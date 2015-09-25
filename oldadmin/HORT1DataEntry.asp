<%
Dim areaname
Dim pagetitle
Dim oConn
Dim oRs
dim sqlstring
Dim viewonly
Dim minutesold
Dim inserting
Dim thecomment
Dim created_on, modified_on
created_on = ""
modified_on = ""
inserting = False
viewonly=False
areaname="West Midlands Police - HO/RT System"
pagetitle="HO/RT 1 Data Entry Page"
if Not isLoggedIn() then
	Response.Redirect "login.asp"
end if
' Decide if READONLY at this stage.
' (from querystring)
If (UCase(Request.QueryString("txtUpdateMode")) = "VIEW") Then
  viewonly = True
End If
%>
<!-- #include file="HORT1ControlProperties.asp" -->
<!-- #include file="HORT1ASPLibrary.asp" -->
<%
  Function SetViewingOnly
  ' function used to set edit boxes to read only if in viewing mode
    If viewonly Then
        SetViewingOnly = "READONLY=TRUE"
    Else
        SetViewingOnly = ""
    End If
  End Function
'==========================================
  Function GetFieldValue(TheField)
    GetFieldValue = ""
    If Not oRs.EOF Then
      If Not IsNull(oRs.Fields(TheField)) Then
        GetFieldValue = oRs.Fields(TheField)
      End If
    End If
  End Function
'==========================================
  Function IsComboValueSelected(TheField, ValueAtIndex)
  ' returns SELECTED to the select element definition if this value is the one currently stored
    IsComboValueSelected = ""
    If Not oRs.EOF Then
      If Not IsNull(oRs.Fields(TheField)) Then
        If (CStr(ValueAtIndex) = CStr(oRs.Fields(TheField))) Then
          IsComboValueSelected = "SELECTED"
        End If
      End If
    End If
  End Function
'==========================================
  ' Create ADO Connection Component to connect with database
  Set oConn = Server.CreateObject("ADODB.Connection")
  oConn.Open "file name=" & Server.MapPath("connect.udl") & ""
  inserting = False
  If UCase(Request.QueryString("txtUpdateMode")) = "INSERT" Then
    inserting = True
    minutesold = 0
    pagetitle="Enter new HO/RT1"
  ElseIf UCase(Request.QueryString("txtUpdateMode")) = "UPDATE" Then
    pagetitle="Update existing HO/RT1"
  Else
    pagetitle="View existing HO/RT1"
  End If
  sqlstring = "SELECT serial_number, surname, forename1, forename2, forename3, " & _
              "to_char(dob, 'DD/MM/YYYY') As birthdate, " & _
              "gender, ethnicity, address, postcode, " & _
              "issue_time, to_char(issue_date, 'DD/MM/YYYY') As issuedate, " & _
              "location, registration_number, make, model, type, colour, rta, process, " & _
              "stop_check, any_further_offences, produce_at_station, issuing_type, " & _
              "issuing_number, force, ocu, comments, " & _
              "to_char(date_created, 'DD/MM/YYYY') As full_date_created, " & _
              "to_char(date_last_modified, 'DD/MM/YYYY') As full_date_last_modified, " & _
              "minutes_difference(date_created,sysdate) as created_minutes, " & _
              "user_name, breath_test, reason_for_stop, self_classification, why_no_self_classification, " & _
              "created_by, origin from hort1 WHERE serial_number = '" & _
              Request.QueryString("txtSerialNumber") & "'"
%>
<!-- #include file="pagehead.asp" -->
<!-- 
<br>
<%= sqlstring %>
<br>
 -->
<%
  Set oRs = oConn.Execute(sqlstring)
  ' Now check if record is locked
  ' If locked, set viewonly to True
  If Not inserting Then
	created_on = oRs("full_date_created")
	modified_on = oRs("full_date_last_modified")
   If Not viewonly Then
        minutesold = CLng(oRs("created_minutes"))
        If minutesold > 720 Then
            viewonly=True
            pagetitle="View existing HO/RT1 - Record Locked"
        End If
      End If
  End If
%>
<FORM NAME="frmHORT1DataEntry" ACTION="HORT1PostDetails.asp" METHOD=POST>
 <TABLE>
  <TR>
    <TD><font color=#ff0000><b>Serial Number</b></font></TD>         <TD><INPUT TYPE=TEXT VALUE="<% = Request.QueryString("txtSerialNumber") %>"
                        <% =GetControlProps("txtSerialNumber") %> READONLY=True NAME="txtSerialNumber"></TD>
  </TR>
  <TR>
    <TD>Surname</TD>             <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("surname") %>" onkeypress="UppercaseKeyPress()"
                        <% =GetControlProps("txtSurname") %> <% =SetViewingOnly %> NAME="txtSurname"></TD>
  </TR>
  <TR>
    <TD>Forenames</TD>             <TD COLSPAN=3><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("forename1") %>" onkeypress="UppercaseKeyPress()"
                        <% =GetControlProps("txtForename1") %> <% =SetViewingOnly %> NAME="txtForename1">&nbsp;&nbsp;
                         <INPUT TYPE=TEXT VALUE="<% =GetFieldValue("forename2") %>" onkeypress="UppercaseKeyPress()"
                        <% =GetControlProps("txtForename2") %> <% =SetViewingOnly %> NAME="txtForename2">&nbsp;&nbsp;
                        <INPUT TYPE=TEXT VALUE="<% =GetFieldValue("forename3") %>" onkeypress="UppercaseKeyPress()"
                        <% =GetControlProps("txtForename3") %> <% =SetViewingOnly %> NAME="txtForename3"></TD>
  </TR>
  <TR>
    <TD>Date Of Birth</TD>
    <TD>
        <INPUT TYPE=TEXT VALUE="<%= GetFieldValue("birthdate") %>" onBlur="javascript:checkdate(this)"
                    <%= GetControlProps("txtBirthdate") %> <%= SetViewingOnly %> NAME="txtBirthdate">
    </TD>
  </TR>
  <TR>
    <% If UCase(Request.QueryString("txtUpdateMode")) = "VIEW" Then %>
      <TD>Gender</TD>             <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("gender") %>"
                        <% =GetControlProps("txtGender") %> <% =SetViewingOnly %> NAME="txtGender"></TD>
    <% Else %>
      <TD>Gender</TD>             <TD><select size="1" NAME="cbGender">
                      <option VALUE="M" <% =IsComboValueSelected("gender", "M") %> >M
                      <option VALUE="F" <% =IsComboValueSelected("gender", "F") %> >F
                      <option VALUE="U" <% =IsComboValueSelected("gender", "U") %> >U
                    </select> </TD>
    <% End If %>

    <% If UCase(Request.QueryString("txtUpdateMode")) = "VIEW" Then %>
      <TD>Ethnicity (IC)</TD>         <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("ethnicity") %>"
                        <% =GetControlProps("txtEthnicity") %> <% =SetViewingOnly %> NAME="txtEthnicity"></TD>
    <% Else %>
      <TD>Ethnicity (IC)</TD>         <TD><select size="1" NAME="cbEthnicity">
                          <option VALUE="1" <% =IsComboValueSelected("ethnicity", 1) %> >1
                          <option VALUE="2" <% =IsComboValueSelected("ethnicity", 2) %> >2
                          <option VALUE="3" <% =IsComboValueSelected("ethnicity", 3) %> >3
                            <option VALUE="4" <% =IsComboValueSelected("ethnicity", 4) %> >4
                          <option VALUE="5" <% =IsComboValueSelected("ethnicity", 5) %> >5
                          <option VALUE="6" <% =IsComboValueSelected("ethnicity", 6) %> >6
                          <option VALUE="0" <% =IsComboValueSelected("ethnicity", 0) %> >0
                        </select> </TD>
    <% End If %>
  </TR>
<TR>
    <% If UCase(Request.QueryString("txtUpdateMode")) = "VIEW" Then %>
      <TD>Self-Classification</TD>         <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("self_classification") %>"
                        <% =GetControlProps("txtSelfClassification") %> <% =SetViewingOnly %> NAME="txtSelfClassification"></TD>
    <% Else %>
      <TD>Self-Classification</TD>
		<TD><select size="1" NAME="cbSelfClassification">
                      <option <% =IsComboValueSelected("self_classification", "NS - NOT STATED") %> >NS - NOT STATED
                      <option <% =IsComboValueSelected("self_classification", "W1 - White:British") %> >W1 - White:British
                      <option <% =IsComboValueSelected("self_classification", "W2 - White:Irish") %> >W2 - White:Irish
                      <option <% =IsComboValueSelected("self_classification", "W9 - Any other White Background") %> >W9 - Any other White Background
			             <option <% =IsComboValueSelected("self_classification", "M1 - Mixed: White and Black Caribbean") %> >M1 - Mixed: White and Black Caribbean
			             <option <% =IsComboValueSelected("self_classification", "M2 - Mixed: White and Black African") %> >M2 - Mixed: White and Black African
			             <option <% =IsComboValueSelected("self_classification", "M3 - Mixed: White and Asian") %> >M3 - Mixed: White and Asian
                      <option <% =IsComboValueSelected("self_classification", "M9 - Any other Mixed Backround") %> >M9 - Any other Mixed Background
                      <option <% =IsComboValueSelected("self_classification", "A1 - Indian") %> >A1 - Indian
                      <option <% =IsComboValueSelected("self_classification", "A2 - Pakistani") %> >A2 - Pakistani
                      <option <% =IsComboValueSelected("self_classification", "A3 - Bangladeshi") %> >A3 - Bangladeshi
                      <option <% =IsComboValueSelected("self_classification", "A9 - Any other Asian background") %> >B9 - Any other Black background
                      <option <% =IsComboValueSelected("self_classification", "B1 - Caribbean") %> >B1 - Caribbean
                      <option <% =IsComboValueSelected("self_classification", "B2 - African") %> >B2 - African
                      <option <% =IsComboValueSelected("self_classification", "B9 - Any other Black background") %> >B9 - Any other Black background
                      <option <% =IsComboValueSelected("self_classification", "O1 - Chinese") %> >O1 - Chinese
                      <option <% =IsComboValueSelected("self_classification", "O9 - Any other ethnic group") %> >O9 - Any other ethnic group
    <% End If %>
    <% If UCase(Request.QueryString("txtUpdateMode")) = "VIEW" Then %>
      <TD>or why not</TD>         <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("why_no_self_classification") %>"
                        <% =GetControlProps("txtWhyNoClass") %> <% =SetViewingOnly %> NAME="txtWhyNoClass"></TD>
    <% Else %>
      <TD>or why not</TD>
      <TD><select size="1" NAME="cbWhyNoClass">
                      <option <% =IsComboValueSelected("why_no_self_classification", "N/A") %> >N/A
                      <option <% =IsComboValueSelected("why_no_self_classification", "Called Away") %> >Called Away
                      <option <% =IsComboValueSelected("why_no_self_classification", "Disorder") %> >Disorder
                      <option <% =IsComboValueSelected("why_no_self_classification", "Not Understood") %> >Not Understood
                      <option <% =IsComboValueSelected("why_no_self_classification", "Declined") %> >Declined
                    </select> </TD>
    <% End If %>
</TR>
  <TR>
    <TD>Address</TD>             <TD><TEXTAREA NAME="txtAddress" <% =GetControlProps("txtAddress") %> onkeypress="MaxLength_keypress('txtAddress')"
                        <% =SetViewingOnly %>><% =GetFieldValue("address") %></TEXTAREA></TD>
    <TD>Postcode</TD>             <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("postcode") %>" onkeypress="AlphaNumericKeyPressOnly(false)"
                        <% =GetControlProps("txtPostcode") %> <% =SetViewingOnly %> NAME="txtPostcode"></TD>
  </TR>

  <TR>
    <TD>Time Of Issue</TD>         <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("issue_time") %>" onkeypress="NumericKeyPressOnly(false)"
                        <% =GetControlProps("txtIssueTime") %> <% =SetViewingOnly %> NAME="txtIssueTime">&nbsp;&nbsp;on&nbsp;&nbsp;
        <INPUT TYPE=TEXT VALUE="<%= GetFieldValue("issuedate") %>" onBlur="javascript:checkdate(this)"
                    <%= GetControlProps("txtIssuedate") %> <%= SetViewingOnly %> NAME="txtIssuedate">
    </TD>
  </TR>
  <TR>
    <TD>Location of Stop</TD>     <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("location") %>" onkeypress="UppercaseKeyPress()"
                        <% =GetControlProps("txtLocation") %> <% =SetViewingOnly %> NAME="txtLocation"></TD>
    <TD>Registration Number</TD>     <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("registration_number") %>" onkeypress="AlphaNumericKeyPressOnly(false)"
                        <% =GetControlProps("txtRegistrationNumber") %> <% =SetViewingOnly %> NAME="txtRegistrationNumber"></TD>
  </TR>
  <TR>
    <TD>Make</TD>             <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("make") %>" onkeypress="UppercaseKeyPress()"
                        <% =GetControlProps("txtMake") %> <% =SetViewingOnly %> NAME="txtMake"></TD>
    <TD>Model</TD>             <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("model") %>" onkeypress="UppercaseKeyPress()"
                        <% =GetControlProps("txtModel") %> <% =SetViewingOnly %> NAME="txtModel"></TD>
  </TR>
  <TR>
    <TD>Type</TD>             <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("type") %>" onkeypress="UppercaseKeyPress()"
                        <% =GetControlProps("txtType") %> <% =SetViewingOnly %> NAME="txtType"></TD>
    <TD>Colour</TD>             <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("colour") %>" onkeypress="UppercaseKeyPress()"
                        <% =GetControlProps("txtColour") %> <% =SetViewingOnly %> NAME="txtColour"></TD>
  </TR>
<TR>
    <% If UCase(Request.QueryString("txtUpdateMode")) = "VIEW" Then %>
      <TD>Reason for Stop</TD>         <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("reason_for_stop") %>"
                        <% =GetControlProps("txtStopReason") %> <% =SetViewingOnly %> NAME="txtStopReason"></TD>
    <% Else %>
      <TD>Reason for Stop</TD>
		<TD><select size="1" NAME="cbStopReason">
                      <option <% =IsComboValueSelected("reason_for_stop", "N/A") %> >N/A
                      <option <% =IsComboValueSelected("reason_for_stop", "Offence Committed/RTC") %> >Offence Committed/RTC
                      <option <% =IsComboValueSelected("reason_for_stop", "VDRS") %> >VDRS
                      <option <% =IsComboValueSelected("reason_for_stop", "Negative Breath Test") %> >Negative Breath Test
                      <option <% =IsComboValueSelected("reason_for_stop", "Traffic Stop Only") %> >Traffic Stop Only
                    </select> </TD>
    <% End If %>
    <% If UCase(Request.QueryString("txtUpdateMode")) = "VIEW" Then %>
      <TD>Breath Test</TD>         <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("breath_test") %>"
                        <% =GetControlProps("txtBreathTest") %> <% =SetViewingOnly %> NAME="txtBreathTest"></TD>
    <% Else %>
      <TD>Breath Test</TD>         <TD><select size="1" NAME="cbBreathTest">
                      <option VALUE="X" <% =IsComboValueSelected("breath_test", "X") %> >X
                      <option VALUE="P" <% =IsComboValueSelected("breath_test", "P") %> >P
                      <option VALUE="N" <% =IsComboValueSelected("breath_test", "N") %> >N
                    </select> </TD>
    <% End If %>
</TR>
  <TR>
    <TD>Produce At Station</TD>     <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("produce_at_station") %>" onkeypress="UppercaseKeyPress()"
                        <% =GetControlProps("txtProduceAtStation") %> <% =SetViewingOnly %> NAME="txtProduceAtStation"></TD>
  </TR>
  <TR>
    <TD>Issued by:&nbsp;</TD>
    <% If UCase(Request.QueryString("txtUpdateMode")) = "VIEW" Then %>
                           <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("issuing_type") %>"
                        <% =GetControlProps("txtIssuingType") %> <% =SetViewingOnly %> NAME="txtIssuingType">
    <% Else %>
                           <TD><SELECT SIZE="1" NAME="cbIssuingType">
                        <option VALUE="PO" <% =IsComboValueSelected("issuing_type", "PO") %> >PO
                        <option VALUE="SC" <% =IsComboValueSelected("issuing_type", "SC") %> >SC
                        </SELECT>
    <% End If %>
                         &nbsp;&nbsp;number&nbsp;&nbsp;
							<INPUT TYPE=TEXT VALUE="<% =GetFieldValue("issuing_number") %>" onkeypress="NumericKeyPressOnly(false)"
                        <% =GetControlProps("txtIssuingNumber") %> <% =SetViewingOnly %> NAME="txtIssuingNumber"></TD>
    <TD>Force</TD>             <TD><INPUT TYPE=TEXT VALUE="<% =GetFieldValue("force") %>" onkeypress="AlphaNumericKeyPressOnly(false)"
                        <% =GetControlProps("txtForce") %> <% =SetViewingOnly %> NAME="txtForce">
    <% If UCase(Request.QueryString("txtUpdateMode")) = "VIEW" Then %>
                           OCU<INPUT TYPE=TEXT VALUE="<% =GetFieldValue("ocu") %>"
                        <% =GetControlProps("txtOCU") %> <% =SetViewingOnly %> NAME="txtOCU">
    <% Else %>
                           &nbsp;&nbsp;OCU&nbsp;&nbsp;<SELECT SIZE="1" NAME="cbOCU">
                        <option VALUE="NA" <% =IsComboValueSelected("ocu", "NA") %> >NA
                        <option VALUE="D1" <% =IsComboValueSelected("ocu", "D1") %> >D1
                        <option VALUE="D2" <% =IsComboValueSelected("ocu", "D2") %> >D2
                        <option VALUE="D3" <% =IsComboValueSelected("ocu", "D3") %> >D3
                        <option VALUE="E1" <% =IsComboValueSelected("ocu", "E1") %> >E1
                        <option VALUE="E2" <% =IsComboValueSelected("ocu", "E2") %> >E2
                        <option VALUE="E3" <% =IsComboValueSelected("ocu", "E3") %> >E3
                        <option VALUE="F1" <% =IsComboValueSelected("ocu", "F1") %> >F1
                        <option VALUE="F2" <% =IsComboValueSelected("ocu", "F2") %> >F2
                        <option VALUE="F3" <% =IsComboValueSelected("ocu", "F3") %> >F3
                        <option VALUE="G1" <% =IsComboValueSelected("ocu", "G1") %> >G1
                        <option VALUE="G2" <% =IsComboValueSelected("ocu", "G2") %> >G2
                        <option VALUE="H1" <% =IsComboValueSelected("ocu", "H1") %> >H1
                        <option VALUE="H2" <% =IsComboValueSelected("ocu", "H2") %> >H2
                        <option VALUE="J1" <% =IsComboValueSelected("ocu", "J1") %> >J1
                        <option VALUE="J2" <% =IsComboValueSelected("ocu", "J2") %> >J2
                        <option VALUE="K1" <% =IsComboValueSelected("ocu", "K1") %> >K1
                        <option VALUE="K2" <% =IsComboValueSelected("ocu", "K2") %> >K2
                        <option VALUE="L" <% =IsComboValueSelected("ocu", "L") %> >L
                        <option VALUE="M1" <% =IsComboValueSelected("ocu", "M1") %> >M1
                        <option VALUE="M2" <% =IsComboValueSelected("ocu", "M2") %> >M2
                        <option VALUE="M3" <% =IsComboValueSelected("ocu", "M3") %> >M3
                        <option VALUE="T1" <% =IsComboValueSelected("ocu", "T1") %> >T1
                        <option VALUE="T4" <% =IsComboValueSelected("ocu", "T4") %> >T4
                        </SELECT>
						</TD>
    <% End If %>
  </TR>
<%
if inserting then
	thecomment=""
else
	thecomment = oRs("comments")
	thecomment = Trim(thecomment)
end if
%>
  <TR>
    <TD>Comment</TD>
    <TD><TEXTAREA NAME="txtComment" <% =GetControlProps("txtComment") %> onkeypress="MaxLength_keypress('txtComment')">
                        <%= thecomment %></TEXTAREA></TD>
    <TD><P STYLE="line-height: 150%">Date Created<BR>Who Created<BR>Date Last Modified<BR>User Name</P></TD>
                    <TD><INPUT TYPE=TEXT VALUE="<%= created_on %>"
                        <% =GetControlProps("txtDateCreated") %> READONLY=TRUE NAME="txtDateCreated"><BR>
                         <INPUT TYPE=TEXT VALUE="<% =GetFieldValue("created_by") %>"
                        <% =GetControlProps("txtCreatedBy") %> READONLY=TRUE NAME="txtCreatedBy"><BR>
                         <INPUT TYPE=TEXT VALUE="<%= modified_on %>"
                        <% =GetControlProps("txtDateLastModified") %> READONLY=TRUE NAME="txtDateLastModified"><BR>
                         <INPUT TYPE=TEXT VALUE="<% =GetFieldValue("user_name") %>"
                        <% =GetControlProps("txtUserName") %> READONLY=TRUE NAME="txtUserName"><BR>
								<input type="hidden" name="txtOrigin" value="HORT1">
   </TD>
  </TR>
</TABLE>

<%
  oRs.Close
  oConn.Close
  Set oConn = Nothing
%>

<% If UCase(Request.QueryString("txtUpdateMode")) <> "VIEW" Then %>
  <BR>
  <DIV ALIGN="CENTER">
  <TABLE>
    <TR>
      <TD><input type="submit" value="Save" name="btnSubmit"></TD>
<!--
       <TD><input type="reset" value="Reset" name="btnReset"></TD>
 -->
      <TD><input type="button" value="Cancel" name="btnCancel"></TD>
     </TR>
     <TR>
        <TD><input type="hidden" name="txtUpdateMode" value=" <%= UCase(Request.QueryString("txtUpdateMode")) %>"></TD>
     </TR>
  </TABLE>
  </DIV>
</FORM>
<% End If %>

<SCRIPT LANGUAGE="VBScript">
'=========================================================
' data validation routines
'=========================================================
  Function CheckSurnameEntered
  ' checks that a surname is entered
    If (Len(Document.Forms(0).txtSurname.Value) > 0) Then
      CheckSurnameEntered = True
    Else
      CheckSurnameEntered = False
      MsgBox "A Surname must be entered.", vbExclamation, C_HORT1_TITLE
      Document.Forms(0).txtSurname.Focus
    End If
  End Function
'=========================================================
  Function CheckIssueTimeValid(ValidData)
  ' checks the digits entered in the time field form a valid time
    CheckIssueTimeValid = False
    If ValidData Then
      If Not IsTimeValid(CStr(Left(Document.Forms(0).txtIssueTime.Value, 2)), _
      CStr(Right(Document.Forms(0).txtIssueTime.Value, 2))) Then
        MsgBox "Issue Time is not a valid time.", vbExclamation, C_HORT1_TITLE
        Document.Forms(0).txtIssueTime.Focus
      Else
        CheckIssueTimeValid = True
      End If
    End If
  End Function
'=========================================================
  Function CheckReasonSelected(ValidData)
  ' ensures that a reason for issuing a HO/RT1 is selected
    Dim thereason
     thereason = Document.Forms(0).cbStopReason.Value
    CheckReasonSelected = True
    If ValidData Then
      ' MsgBox "Before if test, thereason = -" & thereason & "-", vbExclamation, C_HORT1_TITLE
      If thereason = "N/A" Then
         MsgBox "You must select a reason for issuing a HO/RT1.", vbExclamation, C_HORT1_TITLE
        CheckReasonSelected = False
      End If
    End If
  End Function
'=========================================================
  Function CheckSelfClassification(ValidData)
  ' ensures that 16+1 ethnicity clasification guidelines are followed
    Dim theselfclass
    Dim thereasonwhynot
    theselfclass = Document.Forms(0).cbSelfClassification.Value
    thereasonwhynot = Document.Forms(0).cbWhyNoClass.Value
    CheckSelfClassification = False
    If ValidData Then
      If theselfclass = "NS - NOT STATED" Then
        ' MsgBox "NS - NOT STATED", vbExclamation, C_HORT1_TITLE
        If thereasonwhynot = "N/A" Then
            MsgBox "You must select a reason why self classification was NOT STATED", vbExclamation, C_HORT1_TITLE
            CheckSelfClassification = False
        Else
            ' MsgBox "[" & thereasonwhynot & "]", vbExclamation, C_HORT1_TITLE
            CheckSelfClassification = True
        End If
      Else
        ' a 16+1 classification has been selected
        Document.Forms(0).cbWhyNoClass.Value = "N/A"
        CheckSelfClassification = True
      End If
    End If
  End Function
'=========================================================
 Function CheckValidEntryDate(ValidData)
  ' checks that the date the HO/RT1 is entered on the system is not before the issue date of the HO/RT1
    CheckValidEntryDate = False
    If ValidData Then
		' MsgBox "before IsTextEntryDateOK",vbExclamation, C_HORT1_TITLE
      If IsTextEntryDateOK(Document.Forms(0).txtIssuedate.Value) Then
        CheckValidEntryDate = True
      Else
        MsgBox "The HO/RT1 Issue Date cannot be after the current system date!", vbExclamation, C_HORT1_TITLE
        Document.Forms(0).txtIssuedate.Focus
      End If
    End If
  End Function
'=========================================================
 Function CheckDOBDate(ValidData)
  ' checks that the date the HO/RT1 is entered on the system is not before the issue date of the HO/RT1
    CheckDOBDate = False
    If ValidData Then
      If IsTextEntryDateOK(Document.Forms(0).txtBirthdate.Value) Then
        CheckDOBDate = True
      Else
        MsgBox "The Date of Birth cannot be after the current system date!", vbExclamation, C_HORT1_TITLE
        Document.Forms(0).txtBirthdate.Focus
      End If
    End If
  End Function
'------------------------------------------------------------------------------------------------------
' event methods
'------------------------------------------------------------------------------------------------------
  Sub Window_onLoad
   Dim User_name
	Dim created_on, modified_on

      ' User_name = "<% =WindowsLoginUserName() %>"
      User_name = "<% = Session("userid") %>"
    ' set default values if in insert mode
    <% If UCase(Request.QueryString("txtUpdateMode")) = "INSERT" Then %>
	   created_on = DateToday()
	   modified_on = DateToday()
      Document.Forms(0).txtDateCreated.Value = created_on
      Document.Forms(0).txtDateLastModified.Value = modified_on
      Document.Forms(0).txtForce.Value = "20"
      Document.Forms(0).txtCreatedBy.Value = UCase(User_name)
    <% End If %>

    <% If UCase(Request.QueryString("txtUpdateMode")) <> "VIEW" Then %>
      Document.Forms(0).txtUserName.Value = UCase(User_name)
    <% End If %>

    Document.Forms(0).txtSurname.Focus
  End Sub
'=========================================================
  Function frmHORT1DataEntry_onSubmit
    Dim ValidData
    Dim ModifyDate

    ValidData = CheckSurnameEntered
    ' ValidData = ValidData And CheckValidDOBDate(ValidData)
    ValidData = ValidData And CheckDOBDate(ValidData)
    ValidData = ValidData And CheckIssueTimeValid(ValidData)
    ' ValidData = ValidData And CheckValidIssueDate(ValidData)
    ValidData = ValidData And CheckValidEntryDate(ValidData)
    ' ValidData = ValidData And CheckSelfClassification(ValidData)
    ' ValidData = ValidData And CheckReasonSelected(ValidData)

    If ValidData Then
      <% If UCase(Request.QueryString("txtUpdateMode")) <> "VIEW" Then %>
      'ModifyDate = MakeLegalModifyDate(Date())
      Document.Forms(0).txtDateLastModified.Value = Date()
     <% End If %>
   End If

    frmHORT1DataEntry_onSubmit = ValidData
  End Function
'=========================================================
  Function frmHORT1DataEntry_onReset
    <% If UCase(Request.QueryString("txtUpdateMode")) <> "VIEW" Then %>
      If MsgBox("Clear all fields to their initial values?", vbYesNoCancel + vbQuestion, C_HORT1_TITLE) <> vbYes Then
        frmHORT1DataEntry_onReset = False
      End If
    <% End If %>
  End Function
'=========================================================
  Sub btnCancel_onClick
    If MsgBox("Abandon editing HO/RT1 and return to the home page?", vbYesNoCancel + vbQuestion, C_HORT1_TITLE) = vbYes Then
      Navigate "HORT1Home.asp"
    End If
  End Sub
'=========================================================
  Sub txtIssueTime_onBlur
    ' ensure time, if entered, is in hh:mm format by adding leading zeros if necessary
    If Len(Document.Forms(0).txtIssueTime.Value) > 0 Then
      Document.Forms(0).txtIssueTime.Value = LPad(Document.Forms(0).txtIssueTime.Value, "0", 4)
    End If
  End Sub
'=========================================================
  Sub txtIssuingNumber_onBlur
    ' ensure Issuing Number, if entered, is four character in length by adding leading zeros if necessary
    If Len(Document.Forms(0).txtIssuingNumber.Value) > 0 Then
      Document.Forms(0).txtIssuingNumber.Value = LPad(Document.Forms(0).txtIssuingNumber.Value, "0", 4)
    End If
  End Sub
</SCRIPT>
<!-- #include file="pagefoot.asp" -->

