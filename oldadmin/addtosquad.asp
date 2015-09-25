<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="squadfuncs.asp" -->
<%
// Adding a new club member to an existing squad
//
// User MUST be the owner of a squad to add a member to it
// or have support privileges
// If invoked with no querystring,
// 		-  determine the squad this person owns (if any)
// Else
// 		-  determine squad from querystring
// Else must have supplied member to add and squad on
// querystring line.
// If member and squad supplied
// 		-  Get member details from members
//		-  Get squad details from squads
// 		-  Check if  member is not already in the squad
// 		-  Add member to squad
// 		-  Set confirmation text message
// If there is a confirmation text message, display it
// Create list of members available for selection into
// this squad and display as drop-down list
// Need to take into account gender and membergrade
//
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Adding New Member to Existing Squad");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var mySquad, thegender;
var callinguser;
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var SQL0, SQL1, SQL2, SQL3, SQL4, SQL5;
var SQLaudit;
var messagetext;
var v_memberid = new String("");
var v_usercode = new String("");
var thesquad, thesquadtext, thecaptain, thesquadclause, dataline1, dataline2;
var mytable, thename, thesquadname;
var dummy, dummy2, dummy3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
thename = new String("").toString();
thesquadname = new String("").toString();
messagetext = new String("").toString();
thesquadtext = new String("(None)").toString();
callinguser=new String("NONE");
//
// start of page processing
//
if (!signedin())
	Response.Redirect("login.asp");
// Get details of currently logged on user
v_memberid = getUserID();
v_usercode = getUserCode();
//
// Now process querystring
//
thesquad = new String(Request.QueryString("squad")).toString();
if (thesquad == "" || thesquad == "null" || thesquad == "undefined")
	thesquad = new String(mySquadID()).toString();
if (thesquad == "-1")
	Response.Redirect("notowner.asp");
themember = new String(Request.QueryString("member")).toString();
if (themember == "" || themember == "null" || themember == "undefined")
	themember = new String("(None)").toString();
//
// Establish the initial DB connection
//
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
RS2=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
//
// If we have a member and a squad we must be adding a new member
// So generate SQL to get member+squad details to fill up confirmation
// message and update database
//
SQL4 = new String("SELECT * from squads where [squadid] = "+thesquad).toString();
RS = ConnObj.Execute(SQL4);
while (! RS.EOF)
{
	thesquadname = new String(RS("squadname")).toString();
	thegender = new String(RS("gender")).toString();
	RS.MoveNext();
}
RS.Close();
if (! (themember == "(None)") && (! (thesquad == "-1")))
{
	SQL1 = new String("DELETE from squadmembers where [squadid] = "+thesquad+" and [uniqueref] = "+themember).toString();
	SQL2 = new String("INSERT into squadmembers values("+thesquad+","+themember+")").toString();
	SQL3 = new String("SELECT * from members where [uniqueref] = "+themember).toString();
	SQL4 = new String("SELECT * from squads where [squadid] = "+thesquad).toString();
	RS = ConnObj.Execute(SQL3);
	if (! RS.EOF)
		thename = new String(RS("forename1")+" "+RS("surname")).toString();
	RS.Close();
	if (! current_debug_status())
	{
		RS=ConnObj.Execute(SQL1);
		RS=ConnObj.Execute(SQL2);
		messagetext += thename+" has been added to the "+thesquadname
	}
}
// 
// Now construct the SQL to fill up the drop down list box
//
SQL5 = new String("SELECT * from PotentialLeagueSquadMembers where [gender] = '"+thegender+"' and [uniqueref] not in (SELECT [uniqueref] from squadmembers WHERE [squadid] = "+thesquad+") order by [surname] asc, [membergrade] asc"). toString();
%>
<!--#include file="sectionhead.asp" -->
	<div id="content">
		<div id="mainContent">
		<div id="squadmemberchoice">
<%
if (debugging)
{
	Response.Write("    SQL1 statement = ["+SQL1+"]<br />");
	Response.Write("    SQL2 statement = ["+SQL2+"]<br />");	
	Response.Write("    SQL3 statement = ["+SQL3+"]<br />");
	Response.Write("    SQL4 statement = ["+SQL4+"]<br />");
	Response.Write("    SQL5 statement = ["+SQL5+"]<br />");
	Response.Write("    thesquad       = ["+thesquad+"]<br />");
	Response.Write("    themember      = ["+themember+"]<br />");
	Response.End();
}
//
// Now create the form to display the drop down list to choose a member
// to add to this squad
//
%>
			<p>
				<%= messagetext %>
			</p>
			<br />
			<h4>Adding new members to&nbsp;<%= thesquadname %>&nbsp;squad</h4>
			<form name="SquadMemberForm" action="addtosquad.asp" method="GET">
				<fieldset>
				<legend>Adding club members to a league team squad</legend>
				<div>
					<label for="member">Choose a club member to add to this squad:</label>
					<select name="member" id="member">
<%
	RS = ConnObj.Execute(SQL5);
	while (! RS.EOF)
	{
		dummy = Trim(new String(RS("uniqueref")).toString());
		dummy2 = Trim(new String(RS("forename1")))+" "+Trim(new String(RS("surname")));
		dummy3 = Trim(new String(RS("membergrade")).toString());
		if (! (dummy3 == "Adult"))
			Response.Write("<option value="+dummy+">"+dummy2+"("+dummy3+")");
		else
			Response.Write("<option value="+dummy+">"+dummy2);
		RS.MoveNext();
	}
	RS.Close();
%>
					</select>&nbsp;&nbsp;&nbsp;	
					<input name="squad" id="suqad" type="hidden" value="<%= thesquad %>">
					<input type="submit" value="Add">
				</div>
				</fieldset>
			</form>
		</div>
		<div class="seealso">
			<p class="centered">
				<a href="lst_squad.asp?squad=<%= thesquad %>">List whole <%= thesquadname %>'s squad</a>
			</p>
		</div>
	</div>  <!-- mainContent -->	
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="fixturepanel.asp" -->
<!--#include file="memb_nav.asp" -->
</div>
<div id="footer">
<!--#include file="textnav.asp" -->
</div>
</div>
<!--end container-->
</body>
</html>
<%
%>

