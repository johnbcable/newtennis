<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Fees Already Paid");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var myjoining, myleaving, joiningstr, leavingstr;
var myid, mMailing, mailline;
var mystrdob,mydob,dobstr;
var mUnique;
var myaccess, theiraccess;
var callinguser;
var editline, dataline;
var toclick;
var therealname, themembername, searchtype;
var thesearchtext, thesorttext, thetypetext;
var thememberquery, thesortorder;
var thelayout, thelayouttext;
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var SQL1, SQL2, SQLaudit;
var memberknt = 0;
var v_memberid = new String("");
var line1, line2;
var numcol = 3;  // default number of columns in a layout
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
v_memberid = getUserID();
memberknt=0;
toclick=0;
myaccess=0;
theiraccess=0;
callinguser=new String("NONE");
// 
// Now need to fetch description from circulation_lists re this value
//
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);

SQLStmt = new String("SELECT * FROM members WHERE paid = 'Y' AND membergrade IN ('Adult','18-25s','Junior') ORDER BY surname, membergrade, forename1");
displaydate = dateasstring(Date());
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
	<title>Hampton-In-Arden Tennis Club - <%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if runniung in production -->
<%
if (debugging)
{
%>
<link rel="stylesheet" media="screen" type="text/css" href="borders.css" />
<%
}
%>
<script type="text/javascript" language="javascript">
// <![CDATA[
function checkAll(formname, checktoggle)
{
  var checkboxes = new Array(); 
  checkboxes = document[formname].getElementsByTagName('input');
 
  for (var i=0; i<checkboxes.length; i++)  {
    if (checkboxes[i].type == 'checkbox')   {
      checkboxes[i].checked = checktoggle;
    }
  }
}
// ]]>
</script>

</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="index.html" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
	<h1>Hampton-In-Arden Sports Club</h1>
	<h2>Tennis Section</h2>

<!--   2.  Navigation   -->
	<div id="nav_main">
		<ul id="topmenu">
			<li id="nav_ourclub"><a href="aboutus.asp">Our Club</a></li>
			<li id="nav_coaching"><a href="juniors/coaching.html">Coaching</a></li>
			<li id="nav_playing"><a href="playing.asp">Playing</a></li>
			<li id="nav_links"><a href="juniors/index.html">Juniors</a></li>
			<li id="nav_contact"><a href="juniors/contact.html">Contact</a></li>
			<li id="nav_members"><a href="members.asp">Members</a></li>
		</ul>
		<p id="today">
			<%= displaydate %>&nbsp;<%= strtime %>
		</p>
	</div>
	
</div>

<div id="wrapper">

<!--   3. Content    -->
	<div id="content">
		<h1>Administration:&nbsp;<b>Fees</h1>
<%
if (debugging)
{
Response.Write("    SQL statement = ["+SQL1+"]<br />\r\n");
Response.Write("    SQL statement = ["+SQLStmt+"]<br />\r\n");
Response.End();
}
%>
		<form name="paidform" id="paidform" action="upd_unpaid.asp" action="GET">
			<p>
				DO NOT check more than 20 at a time of the update of the club database will fail.
			</p>
<!-- 
		<div style="float: right; text-align: right; margin-right: 5px; width: 50%; display: inline-block;">
			 <a href="javascript: void()" onClick="checkAll('paidform',true)">Check All</a>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <a href="javascript: void()" onClick="checkAll('paidform',false)">Uncheck All</a>
		</div>
 -->
		<table id="memberlist">
			<caption><%= pagetitle %></caption>
			<thead>
<%
// execute the SQL statement
	RS = ConnObj.Execute(SQLStmt);
%>
				<th>
					Member Name:
				</th>
				<th>
					(Start of address) - [Home Telephone] {Mobile Phone}
				</th>
				<th>
						Unpaid?
				</th>
				</thead>
				<tbody>
<%				
callinguser=getUserID();
callinguser=callinguser.toString();
myaccess=getUserAccessLevel();
while (! RS.EOF)
{
 			mUnique = new String(RS("uniqueref")).toString();
			Response.Write("     <tr>\r\n");
			// Insert the following to control access to changes in details
			dataline=new String("("+RS("address1")+" "+RS("address2")+") - ["+RS("homephone")+"] {"+RS("mobilephone")+"}");
			memberknt++;
%>
					<td>
						<%= RS("surname") %>&nbsp;,&nbsp;<%= RS("forename1") %>
					</td>
					<td>
						<%= dataline %> &nbsp;
					</td>
					<td style="text-align: center;">
							<input name="paid" value="<%= mUnique %>" type="checkbox" />
					</td>
<%
Response.Write("       </tr>\r\n");
RS.MoveNext();
}
%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3">
					<p class="centered">
						<%= memberknt %> members currently marked as having paid their fees
						<br />
<%
if (memberknt>0)
{
%>
						Check the Unpaid? box to indicate that this member hasn't yet paid their fees.<br /><br />
						DO NOT check more than 20 at a time or the update of the club database will not proceed.
<%
}	  // end of memberknt test
%>
					</p>
				</td>
			</tr>

		</tfoot>		
	</table>
<!-- 
		<div style="float: right; text-align: right; margin-right: 5px; width: 50%; display: inline-block;">
			 <a href="javascript: void()" onClick="checkAll('paidform',true)">Check All</a>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <a href="javascript: void()" onClick="checkAll('paidform',false)">Uncheck All</a>
		</div>
 -->
	<div style="float: right; text-align: left; margin-right: 50px;">
			 <button type="submit" value="Submit">Submit</button>
	</div>
		</form>
	
		<div class="seealso">
			<h2>See Also:</h2>
			<ul>
				<li><a href="/lst_unpaid.asp">Members who haven&apos;t paid their subs</a></li>
			</ul>
		</div>			

	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="home_nav.asp" -->
		<!--#include file="memb_nav.asp" -->
	</div>

<!--    5.   Supplementary content     -->	
	<div id="rightcolumn">
		<!--#include file="searchpanel.asp" -->
		<!--#include file="addresspanel.asp" -->
		<!--#include file="newspanel.asp" -->
		<!--#include file="emailpanel.asp" -->
	</div>
</div>

<!--     6.    Site info     -->
<!--#include file="footer.asp" -->

</body>
</html>
<%
%>


