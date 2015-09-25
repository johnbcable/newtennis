<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="squadfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("League Squad Listing");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var myjoining, myleaving, joiningstr, leavingstr;
var myid, mMailing, mailline;
var mystrdob,mydob,dobstr;
var mySquad;
var myaccess, theiraccess;
var callinguser;
var editline, squadmemberemailline, deleteline, deletetext, emailtext;
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var SQL0, SQL1, SQL2, SQL3, SQL4, SQL5;
var SQLaudit;
var memberknt;
var v_memberid = new String("");
var thesquad, thesquadtext, thecaptain, thesquadclause, dataline1, dataline2;
var mytable, myemailtext;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
var topdog = isSupport();	
myemailtext=new String("").toString();
if (topdog)
	myemailtext += "EMAIL";
v_memberid = getUserID();
memberknt=0;
toclick=0;
myaccess=0;
theiraccess=0;
thesquadtext = new String("(None)").toString();
callinguser=new String("NONE");
// Determine if we know which squad to list
// If not , list all the squad names out
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
RS2=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL0 = new String("SELECT * from squads where squadowner = 1").toString();
thesquad = new String("1").toString();	
thecaptain = new String("(None)").toString();
thecaptain = new String(Request.QueryString("captain")).toString();
if (thecaptain == "" || thecaptain == "null" || thecaptain == "undefined")
{
	// No captain passed in so check for squad
	thesquad = new String(Request.QueryString("squad")).toString();
	if (thesquad == "" || thesquad == "null" || thesquad == "undefined")
		thesquad = new String("1").toString();	
}
else
{
	// Determine squad from the captain
	SQL0 = new String("SELECT squadid from squads where squadowner = "+thecaptain).toString();
	RS = ConnObj.Execute(SQL0);
	if (!RS.EOF)
		thesquad = new String(RS("squadid")).toString();
	RS.Close();
}
SQL1 = new String("SELECT squadname, squadid, squadowner, teamid from squads ORDER BY squadid").toString();
SQL2 = new String("SELECT distinct(uniqueref) from squadmembers WHERE squadid = "+thesquad).toString();
SQL3 = new String("SELECT * from members where uniqueref = ").toString();
SQL4 = new String("SELECT querytouse from squads where squadid = "+thesquad).toString();
if (debugging)
	Response.Write("<br />thesquad = ["+thesquad+"]<br />");
mySquad = isSquadOwner(thesquad);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
	<title><%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="tennis3col.css" />
	<link rel="stylesheet" type="text/css" href="softboxes.css" />
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" />
	<script language="Javascript" src="datetimepicker.js"></script>
	<script language="Javascript" src="minmax.js"></script>
</head>
<body>
<div id="container">
	<div id="header">
		<img id="clublogo" src="images/logo.gif" width="88" height="100" alt="Hampton-In-Arden Sports Club logo" />
		<h2>Hampton-In-Arden Sports Club</h2>
		<h3>Tennis Section</h3>
			<!--#include file="horizmenu.asp" -->
	</div>
	<div id="content">
		<div id="mainContent">
<%
if (debugging)
{
	Response.Write("    SQL0 statement = ["+SQL0+"]<br />");
	Response.Write("    SQL1 statement = ["+SQL1+"]<br />");
	Response.Write("    SQL2 statement = ["+SQL2+"]<br />");	
	Response.Write("    SQL3 statement = ["+SQL3+"]<br />");
	Response.Write("    SQL4 statement = ["+SQL4+"]<br />");
	Response.Write("    thesquad       = ["+thesquad+"]<br />");
	Response.Write("    thesquadtext   = ["+thesquadtext+"]<br />");
	// Response.End();
}
// Now create the form to display the drop down list to choose a squad
%>
			<form name="SquadForm" action="lst_squad.asp" method="GET">
				<fieldset>
					<legend>Listing a league team squad</legend>
					<div>
						<label for="squad">Choose which squad to list:</label>
						<select class="tdfont" name="squad">
<%
	if (thesquadtext == "(None)")
		Response.Write("<option selected>(None)");
	else
		Response.Write("<option>(None)");
	RS = ConnObj.Execute(SQL1);
	while (! RS.EOF)
	{
		dummy = Trim(new String(RS("squadid")).toString());
		if (dummy == thesquad)
		{
			Response.Write("<option selected value="+RS("squadid")+">"+RS("squadname"));
			thesquadtext = new String(RS("squadname")+" squad").toString();
		}
		else
			Response.Write("<option value="+RS("squadid")+">"+RS("squadname"));
		RS.MoveNext();
	}
	RS.Close();
%>
						</select>&nbsp;&nbsp;&nbsp;	<input type="submit" value="Fetch">
					</div>
				</fieldset>
			</form>
			<div>
<%
if (thesquadtext == "(None)")
{
%>
				<p class="centered" style="color: red;">
					<b>No squad currently selected</b>
				</p>
<%
}
else
{
	// We have a squad to list so lets do it
%>
		<table>
			<caption>Member listing for <%= thesquadtext %></caption>
			<thead>
				<tr>
					<th>Name</th>
					<th><i>(Start of address)<br />[Home Telephone] {Mobile Phone}</i></th>
<%
	if (mySquad)
	{
%>				
					<th colspan="2" class="centered">ACTION</th>
<%
	}
%>
				</thead>
				<tbody>
<%
	deletetext = new String("").toString();
	emailtext = new String("").toString();
	mytable = new String("squadmembers").toString();
	RS = ConnObj.Execute(SQL4);
	if (! RS.EOF)
		mytable = new String(RS("querytouse")).toString();
	SQL2 = new String("SELECT * from "+mytable+" order by surname asc, forename1 asc").toString();
	RS = ConnObj.Execute(SQL2);
	while (! RS.EOF)
	{
		squadmemberemailline = new String(" ").toString();
		if (mySquad)
		{
			deleteline = new String("deletefromsquad.asp?member="+RS("uniqueref")+"&squad="+thesquad);
			squadmemberemailline = new String("squadmemberemail.asp?member="+RS("uniqueref")+"&squad="+thesquad);
			deletetext = new String("DELETE").toString();
			emailtext = new String(myemailtext).toString();
		}
		if (debugging)
		{
			Response.Write("<br />squadmemberemailline = ["+squadmemberemailline+"]");
			Response.Write("<br />deleteline = ["+deleteline+"]");
		}
		// Get member detail from the squad reference
		dataline1=new String("("+RS("address1")+" "+RS("address2")+")");
		dataline2=new String("["+RS("homephone")+"] {"+RS("mobilephone")+"}");
%>
					<tr>
						<td><b><%= RS("surname") %>&nbsp;,&nbsp;<%= RS("forename1") %>&nbsp;<%= RS("initials") %></b></td>
						<td><%= dataline1 %><br /><%= dataline2 %> &nbsp;</td>
<%
			if (mySquad)
			{
%>
						<td class="centered"><a href="<%= deleteline %>" alt="Remove this member from this squad"><%= deletetext %></a>&nbsp;&nbsp;</td>
						<td class="centered"><a href="<%= squadmemberemailline %>" alt="Send an email to this squad member"><%= emailtext %></a>
						</td>
<%
			}
%>
					</tr>
				</tbody>
<%				
		RS.MoveNext();
	}
	RS.Close();
}
%>
				<tfoot>
					<tr>
						<td colspan="4">
							&nbsp;
						</td>
					</tr>
				</tfoot>
			</table>
			</div>
			<br />
<%
if (mySquad)
{
%>
			<div class="seealso">
				<p class="centered" style="color: red;">
					<b><a href="addtosquad.asp">Add new member to this squad</b></a>
				</p>
<%
if (topdog)
{
%>
				<p class="centered" style="color: red;">
					<b><a href="squademail.asp">Send a general email to this squad</a></b>
				</p>
<%
}
%>
			</div>
<%
}
%>
	</div>  <!-- mainContent -->
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="home_nav.asp" -->
<!--#include file="memb_nav.asp" -->
</div>
<div id="footer">
<!--#include file="textnav.asp" -->
</div>
</div>
<!--end container-->
</body>
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.SquadForm.squad.Focus
End Sub
</SCRIPT>
</html>
<%
%>

