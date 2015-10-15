<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Saving Team Setup Amendments");
// Now for any variables local to this page
var mUnique;
var ConnObj;
var RS;
var SQL1, SQL2;
var dbconnect=Application("hamptonsportsdb");
var mteamid, mteamname, mteamcategory, mteamcaptain, mteamnote, mfixtureline, muniqeref, memail;
var teamObj = new Object();
// Start page processing
if (!signedin())
	Response.Redirect("login.asp");
if (!isAdministrator())
	Response.Redirect("members.asp");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
// Initialise update variables
mteamid=Trim(new String(Request.Form("teamid")));
mteamname=Trim(new String(Request.Form("theteamname")));
mteamcategory=Trim(new String(Request.Form("theteamcategory")));
mteamcaptain=Trim(new String(Request.Form("teamcaptain")));
mteamnote=Trim(new String(Request.Form("teamnote")));
mfixtureline=Trim(new String(Request.Form("theteamfixtureline")));
muniqueref=Trim(new String(Request.Form("thecaptainid")));
memail=Trim(new String(Request.Form("theteamemail")));
if (mteamnote=="" || mteamnote=="undefined" || mteamnote=="null")
	mteamnote=" ";
// Do DB update
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1=new String("UPDATE tennisteams set teamname='"+mteamname+"',teamcategory='"+mteamcategory+"',teamcaptain='"+mteamcaptain+"',teamnote='"+mteamnote+"', fixtureline='"+mfixtureline+"', uniqueref="+muniqueref+", email='"+memail+"' where teamid="+mteamid);
// RS = ConnObj.Execute(SQL1);
var debugging = true;
var updating = true;
%>
<!--#include file="sectionhead.asp" -->
	<div id="content">
		<div id="mainContent">
<%
if (debugging)
	Response.Write("<br /><p align=center>"+SQL1+"</p><hr>");
if (updating)
{
	RS = ConnObj.Execute(SQL1);
	Response.Redirect("lst_teams.asp");
}
%>
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">
<!--#include file="fixturepanel.asp" -->
<!--#include file="memb_nav.asp" -->	
	</div>
	<div id="footer">
<!--#include file="textnav.asp" -->
	</div>
</div>
</body>
</html>
<%
%>
