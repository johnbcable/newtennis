<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("200 Club Administration");
// Now for any variables local to this page
var myMonth, myYear, myDrawType;
var myMonthNo;
var ConnObj, RstObj;
var dbconnect=Application("hamptonsportsdb");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
if (! is200ClubEditor())
	Response.Redirect("services.asp");
myYear=Trim(new String(Request.Form("drawyear")));
myMonth=Trim(new String(Request.Form("drawmonth")));
myDrawType=Trim(new String(Request.Form("drawtype")));
// End of page start up coding
%>
<!--#include file="clubhead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
<%
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT * from 200clubwinners where drawnumber="+myMonth);
RstObj = ConnObj.Execute(SQLStmt);
while (! RstObj.EOF)
{
	myYear=Trim(new String(RstObj("ownersname")));
	myDrawType=Trim(new String(RstObj("standingorder")));
	myoverdue=Trim(new String(RstObj("overdue")));
	RstObj.MoveNext();
}
RstObj=null;
ConnObj.Close();
ConnObj=null;
%>
    <td>
	<h3>Amending 200 Club Number Details</h3>
    <comment>Content for each page placed into middle column</comment>
<form name="Form200" action="set_200.asp" method="post">
<table  width="480" border="1" cellspacing="2" cellpadding="5" bgcolor="#c0c0c0">
	<tr>
		<td class="tdfont" align="LEFT" valign="CENTER">
			<b>
				Draw Number
			</b>
		</td>
		<td class="tdfont" align="LEFT" valign="CENTER">
			<%= myMonth %>
			<input type="hidden" name="thenumber" size="3" maxlength="3" value="<%= myMonth %>">
		</td>
	</tr>
	<tr>
		<td class="tdfont" align="LEFT" valign="CENTER">
			<b>
				Owner's Name
			</b>
		</td>
		<td class="tdfont" align="LEFT" valign="CENTER">
			<input type="text" name="theowner" size="40" maxlength="50" value="<%= myYear %>">
		</td>
	</tr>
	<tr>
		<td class="tdfont" colspan="2" align="CENTER">
			Type over the Owner's Name with the correct details for this number.<br>If this number is no longer owned, delete the owner's name completely.<br>
			When you have completed your alterations, click on the 'Submit' button below to save your changes.
		</td>
	</tr>
	<tr>
		<td colspan="2" align="CENTER">
			<input type="submit" value="Submit">
		</td>
	</tr>
</table>
<input type="hidden" name="standingorder" value="<%= myDrawType %>">
<input type="hidden" name="overdue" value="<%= myoverdue %>">
</form>
    </td>
    <comment>Column 3 reserved for internal and external advertising</comment>
    <!--#include file="adverts.asp" -->
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.Form200.theowner.Focus
End Sub
</SCRIPT>
</html>
<%
%>
