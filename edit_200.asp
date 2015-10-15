<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("200 Club Administration");
// Now for any variables local to this page
var mynumber, myowner, mystandingorder, myoverdue;
var ConnObj, RstObj;
var dbconnect=Application("hamptonsportsdb");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
if (! is200ClubEditor())
	Response.Redirect("services.asp");
mynumber=new String(Request.Querystring("drawnumber"));
if (mynumber=="null" || mynumber=="undefined")
	Response.Redirect("chk_200.asp");
myowner=new String("");
mystandingorder=new String("N");  // default to no standing order
myoverdue=new String("N"); // default to not overdue
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT * from 200club where drawnumber="+mynumber);
RstObj = ConnObj.Execute(SQLStmt);
while (! RstObj.EOF)
{
	myowner=Trim(new String(RstObj("ownersname")));
	mystandingorder=Trim(new String(RstObj("standingorder")));
	myoverdue=Trim(new String(RstObj("overdue")));
	RstObj.MoveNext();
}
RstObj=null;
ConnObj.Close();
ConnObj=null;
// End of page start up coding
%>
<!--#include file="200head.asp" -->
<h3>Amending 200 Club Number Details</h3>
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td>
<form name="Form200" action="set_200.asp" method="post">
<table  width="480" border="1" cellspacing="2" cellpadding="5" bgcolor="#c0c0c0">
	<tr>
		<td class="tdfont" align="LEFT" valign="CENTER">
			<b>
				200 Club Number
			</b>
		</td>
		<td class="tdfont" align="LEFT" valign="CENTER">
			<%= mynumber %>
			<input type="hidden" name="thenumber" size="3" maxlength="3" value="<%= mynumber %>">
		</td>
	</tr>
	<tr>
		<td class="tdfont" align="LEFT" valign="CENTER">
			<b>
				Owner's Name
			</b>
		</td>
		<td class="tdfont" align="LEFT" valign="CENTER">
			<input type="text" name="theowner" size="40" maxlength="50" value="<%= myowner %>">
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
<input type="hidden" name="standingorder" value="<%= mystandingorder %>">
<input type="hidden" name="overdue" value="<%= myoverdue %>">
</form>
    </td>
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
