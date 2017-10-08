<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Membership Search Results");
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
var baseSQL, SQL1, SQL2, SQLaudit;
var memberknt;
var v_memberid = new String("");
var line1, line2;
var numcol = 2;  // default number of columns in a layout
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
themembername = new String(Request.Form("surname"));
if (themembername == "" || themembername == "null" || themembername == "undefined")
{
	themembername = new String(Request.QueryString("surname"));
	if (themembername == "" || themembername == "null" || themembername == "undefined")
		themembername = new String("").toString();
}
themembername = themembername.toUpperCase();
therealname = new String(themembername);
searchtype = new String(Request.Form("searchtype")).toString();
if (searchtype == "null" || searchtype == "undefined")
{
	searchtype = new String(Request.QueryString("searchtype"));
	if (searchtype == "null" || searchtype == "undefined")
		searchtype = new String("").toString();
}
searchtype=searchtype.toUpperCase();
if (searchtype == "S")
{
    themembername = Trim(themembername + "%");
    thesearchtext = "starts with";
	 if (themembername=="%")
		 thesearchtext = "All surnames";
}
if (searchtype == "C")
{
    themembername = "%" + themembername + "%";
    thesearchtext = "contains";
}
if (searchtype == "E")
{
    themembername = "%" + themembername;
    thesearchtext = "ends with";
}
// membership type filter
thetypetext=new String("");
thememberquery = new String(Request.Form("MemberType")).toString();
if (thememberquery == "" || thememberquery == "null" || thememberquery == "undefined")
{
	thememberquery = new String(Request.QueryString("MemberType"));
	if (thememberquery == "" || thememberquery == "null" || thememberquery == "undefined")
		thememberquery = new String("members").toString();
}
// 
// Now need to fetch description from circulation_lists re this value
//
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from circulation_lists where queryname = '"+thememberquery+"'").toString();
RS = ConnObj.Execute(SQL1);
thetypetext = new String("ZZ").toString();
while (! RS.EOF && thetypetext == "ZZ")
{
  thetypetext = new String(RS("name")).toString();
  RS.MoveNext(); 
}
RS.Close();
// now the sort order
thesortorder = (new String(Request.Form("sortorder"))).toString();
if (thesortorder == "null" || thesortorder == "undefined")
{
	thesortorder = new String(Request.QueryString("sortorder"));
	if (thesortorder == "null" || thesortorder == "undefined")
		thesortorder = new String("").toString();
}
thesortorder=thesortorder.toUpperCase();
thesortorder=thesortorder.substring(0,1);
// A is the default circumstance
thesorttext=new String("surname, membergrade, forename1");
if (thesortorder=="B")
	thesorttext=new String("membergrade,surname,forename1");
if (thesortorder=="C")
	thesorttext=new String("sortabledob,surname,forename1");
// lastly, the type of report layout
thelayout = (new String(Request.Form("reporttype"))).toString();
if (thelayout == "null" || thelayout == "undefined")
{
	thelayout = new String(Request.QueryString("reporttype"));
	if (thelayout == "null" || thelayout == "undefined")
		thelayout = new String("").toString();
}
thelayout=thelayout.toUpperCase();
thelayout=thelayout.substring(0,1);
thelayouttext=new String("Summary Layout");
if (thelayout=="B")
	thelayouttext=new String("Full Details");
if (thelayout=="C")
	thelayouttext=new String("Phone List");
if (thelayout=="D")
	thelayouttext=new String("Detailed Phone List");

// Set up SQL query	
baseSQL = new String("SELECT * from "+thememberquery+" where surname like '" + themembername + "' order by " + thesorttext);

// Change baseSQL if we are dealing with fees paid 
if (thememberquery == "feespaid") {
	baseSQL = new String("SELECT * FROM allmembers WHERE paid LIKE 'Y'  AND membergrade IN ('Adult','18-25s','Junior') ORDER BY " + thesorttext);
	thetypetext = new String("Members who have paid their fees");
}
if (thememberquery == "feesnotpaid") {
	baseSQL = new String("SELECT * FROM allmembers WHERE paid NOT LIKE 'Y'  AND membergrade IN ('Adult','18-25s','Junior') ORDER BY " + thesorttext);
	thetypetext = new String("Members who have not paid their fees");
}

SQLStmt = new String(baseSQL);

displaydate = dateasstring(Date());
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<h1>Members:&nbsp;<b>searching the membership directory</h1>
<%
if (debugging)
{
Response.Write("    SQL statement = ["+SQL1+"]<br />\r\n");
Response.Write("    SQL statement = ["+SQLStmt+"]<br />\r\n");
Response.End();
}
%>
		<table id="membersearchparams">
			<tr>
				<td colspan="2">
					Search request was:
				</td>
			</tr>
			<tr>
				<td>
					<span class="leftindent">Surname:</span>
				</td>
				<td>
						<%= thesearchtext %>
						&nbsp;<%= therealname %>
				</td>
			</tr>
			<tr>
				<td>
					<span class="leftindent">Member Grade:</span>
				</td>
				<td>
					<%= thememberquery %>
				</td>
			</tr>
			<tr>
				<td>
					<span class="leftindent">Sorting for Results:</span>
				</td>
				<td>
					ascending by <%= thesorttext %>
				</td>
			</tr>
			<tr>
				<td>
					<span class="leftindent">Report Layout:</span>
				</td>
				<td>
					<%= thelayouttext %>
				</td>
			</tr>
		</table>
		<h2><%= pagetitle %></h2>
		<table id="memberlist">
			<caption>&nbsp;</caption>
			<thead>
<%
// execute the SQL statement
	RS = ConnObj.Execute(SQLStmt);
if (thelayout=="A")
{
%>
				<th>
					Member Name:
				</th>
				<th>
					(Start of address) - [Home Telephone] {Mobile Phone} [British Tennis Number]
				</th>
<%
}
if (thelayout=="B")
{
%>
					<th>
						Name and Address Details
					</th>
					<th>
						Other Information:
					</th>
<%
}
if (thelayout=="C")
{
%>
					<th>
						Name
					</th>
					<th>
						Home Phone - (Mobile Phone)
					</th>
<%
}
if (thelayout=="D")
{
	numcol = 7;  // 6 columns in this layout
%>
					<th>
						Name
					</th>
					<th>
						DOB
					</th>
					<th>
						Category
					</th>
					<th>
						Home Phone
					</th>
					<th>
						BTM Number
					</th>
					<th>
						Photos?
					</th>
					<th>
						Emergency Contact&nbsp;[<i>Special Care Needs</i>]
					</th>
<%
}
%>
				</thead>
				<tbody>
<%				
callinguser=getUserID();
callinguser=callinguser.toString();
myaccess=getUserAccessLevel();
while (! RS.EOF)
{
mailline = new String("");
mMailing = new String(RS("mailing")).toString();
mMailing = mMailing.toUpperCase();
if (mMailing == "Y")
	mailline += "(include on mailshots)";
memberknt=memberknt+1;
myid=new String(RS("memberid"));
myid=myid.toString();
mUnique=new String(RS("uniqueref"));
theiraccess=new Number(RS("webaccess"));
theiraccess=theiraccess.valueOf();
Response.Write("     <tr>\r\n");
// Insert the following to control access to changes in details
dataline=new String("("+RS("address1")+" "+RS("address2")+") - ["+RS("homephone")+"] {"+RS("mobilephone")+"} ["+RS("britishtennisno")+"]");
// Now do other columns from the SELECT
mystrdob=new String(RS("sortabledob"));
myjoining=new String(RS("joined"));
myleaving=new String(RS("dateleft"));
dobstr=new String(" - Date of birth missing");
joiningstr = new String(" - Joining date missing");
leavingstr = new String(" - No leaving date");
if (mystrdob!="null")
{
	mydob=new Date(RS("dob"));
	dobstr = new String(mystrdob.substr(6,2)+"/"+mystrdob.substr(4,2)+"/"+mystrdob.substr(0,4)).toString();
	if (dobstr == "//")   // No DOB on file
		dobstr=new String(" - Date of birth missing").toString();
}
if (myjoining!="null")
{
	mydob=new Date(RS("joined"));
	joiningstr = ddmmyyyy(mydob);
}
if (myleaving!="null")
{
	mydob=new Date(RS("dateleft"));
	leavingstr = ddmmyyyy(mydob);
}
if ( thesortorder=="C")
{
	dataline=dataline+" "+dobstr;
}
if (callinguser == myid || myaccess > theiraccess)
	editline="editmemb.asp?code="+mUnique;
else
	editline="viewmemb.asp?code="+mUnique;
if (thelayout=="A")
{
%>
					<td>
						<a href="<%= editline %>"><%= RS("surname") %></a>&nbsp;,&nbsp;<%= RS("forename1") %>
					</td>
					<td>
						<%= dataline %> &nbsp;
					</td>
<%
}
if (thelayout=="B")
{
%>
				<td>
						<a href="<%= editline %>"><%= RS("surname") %></a>&nbsp;,&nbsp;<%= RS("forename1") %>
						<br />
						<%= RS("address1") %>
						<br />
						<%= RS("address2") %>
						<br />
						<%= RS("address3") %>
						<br />
						<%= RS("address4") %>
						<br />
						<%= RS("postcode") %>
						<br />
						<i><%= mailline %></i>
				</td>
				<td>
					Home Phone: <%= RS("homephone") %>
					<br />
					Mobile Phone: <%= RS("mobilephone") %>
					<br />
					E-mail: <%= RS("email") %>
					<br />
					Date of birth:
					<b>
						<%= dobstr %>
					</b>
					<br />
					Date Joined:
					<b>
						<%= joiningstr %>
					</b>
					<br />
					Date left:
					<b>
						<%= leavingstr %>
					</b>
					<br />
				</td>
<%
}
if (thelayout=="C")
{
%>
					<td>
						<a href="<%= editline %>"><%= RS("surname") %></a>&nbsp;,&nbsp;<%= RS("forename1") %>
					</td>
					<td>
						<%= RS("homephone") %>&nbsp;-&nbsp;(<%= RS("mobilephone") %>)
					</td>
<%
}
if (thelayout=="D")
{
	line1 = new String("").toString();
	line2 = new String("").toString();
	dummy = new String(RS("adultcontact")).toString();
	if (dummy == "" || dummy == "null" || dummy == "undefined")
		dummy = new String("");
	if (! (dummy == ""))
		line1 += dummy;
	dummy = new String(RS("adultrelationship")).toString();
	if (dummy == "" || dummy == "null" || dummy == "undefined")
		dummy = new String("");
	if (! (dummy == ""))
	{
		if (! (line1 == ""))
			line1 += ",";
		line1 += dummy;
	}
	dummy = new String(RS("adultphone")).toString();
	if (dummy == "" || dummy == "null" || dummy == "undefined")
		dummy = new String("");
	if (! (dummy == ""))
	{
		if (! (line1 == ""))
			line1 += ",";
		line1 += dummy;
	}
	dummy = new String(RS("specialcare")).toString();
	if (dummy == "" || dummy == "null" || dummy == "undefined")
		dummy = new String("").toString();
	line2 = new String("["+dummy+"]").toString();
	if (line2 == "[]")
		line2 = new String("").toString();
%>
					<td>
						<%= RS("surname") %>&nbsp;,&nbsp;<%= RS("forename1") %>
					</td>
					<td>
						<%= RS("printabledob") %>
					</td>
					<td>
						<%= RS("membergrade") %>
					</td>
					<td>
						<%= RS("homephone") %>
					</td>
					<td>
						<span style="font-weight: bold; color:red;"><%= RS("britishtennisno") %></span>
					</td>
					<td style="text-align: center;">
						<%= RS("photoconsent") %>
					</td>
					<td>
						<%= line1 %>&nbsp;<i><%= line2 %></i>
					</td>
<%
}

Response.Write("       </tr>\r\n");
RS.MoveNext();
}
%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="<%= numcol %>">
					<p class="centered">
						<%= memberknt %> members matched the search request
						<br />
<%
if (memberknt>0)
{
%>
						Click on the surname corresponding to the member you are searching for to
						view their details
<%
}	  // end of memberknt test
%>
					</p>
				</td>
			</tr>

			<tr>
				<td colspan="<%= numcol %>">
					<p class="centered">
						<a href="chk_memb.asp">Search again</a>
					</p>
				</td>

<%
// Now write audit record
SQLaudit = new String("insert into member_audits([memberid],[action]) values ('"+callinguser+"','MEMBER SEARCH')");
RS = ConnObj.Execute(SQLaudit);
ConnObj.Close();
ConnObj=null;
%>
			</tr>
		</tfoot>		
	</table>
<%
if ( isAdministrator() )	
{
%>
		<div id="200clubadminarea" class="admin">
			<h3>Membership Administration:</h3>
			<ul>
				<li><a href="new_memb.asp">Create a new member</a></li>
			</ul>
		</div>		
		
<%
}
%>		
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


