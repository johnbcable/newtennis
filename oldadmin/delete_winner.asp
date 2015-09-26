<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String(clubname+" - Deleting a Title Winner");
// Now for any variables local to this page
var ConnObj, RS, SQL1, SQL2;
var dbconnect=Application("hamptonsportsdb");
var theid, dummy;
var referline = new String("winners.asp").toString();
var debugging = false;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
theid = new String(Request.Querystring("id"));
if (!signedin())
	Response.Redirect("login.asp");
if (! isSupport())
	Response.Redirect("winners.asp");
if (theid=="null" || theid=="undefined")
	Response.Redirect("winners.asp");
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from winners WHERE winnerid = "+theid).toString();
SQL2 = new String("DELETE from winners WHERE winnerid = "+theid).toString();
RS = ConnObj.Execute(SQL1);
if (! RS.EOF)
{
	dummy = new String(RS("title")).toString();
	dummy = new String(dummy.replace(" ","+")).toString();
	dummy = new String(dummy.replace(" ","+")).toString();
	referline = new String("winners.asp?year="+RS("year")+"&title="+dummy).toString();
}
RS.Close();
RS = ConnObj.Execute(SQL2);
if (! current_debug_status())
	Response.Redirect(referline)
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td>
			<h3>The requested title winner has been deleted from the winners list</h3>
			<br><br>
			referline=[<%= referline %>]<br />
			SQL1 = [<%= SQL1 %>]<br />
			SQL2 = [<%= SQL2 %>]<br />
    </td>
    <!--#include file="adverts.asp" -->
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
