<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("MAXI-Tennis - Team Squad Lists");
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
var themembertype, thesortorder;
var thelayout, thelayouttext;
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var memberknt;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
memberknt=0;
toclick=0;
myaccess=0;
theiraccess=0;
callinguser=new String("NONE");
themembername = new String(Request.Form("surname"));
themembername = themembername.toUpperCase();
therealname = new String(themembername);
searchtype = new String(Request.Form("searchtype"));
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
themembertype = new String(Request.Form("MemberType"));
if (themembertype != "All")
    thetypetext = " and membergrade like '"+themembertype+"'";
// now the sort order
thesortorder = (new String(Request.Form("sortorder"))).toString();
thesortorder=thesortorder.toUpperCase();
thesortorder=thesortorder.substring(0,1);
// A is the default circumstance
thesorttext=new String("surname, membergrade, forename1");
if (thesortorder=="B")
	thesorttext=new String("membergrade,surname,forename1");
if (thesortorder=="C")
	thesorttext=new String("dob,surname,forename1");
// lastly, the type of report layout
thelayout = (new String(Request.Form("reporttype"))).toString();
thelayout=thelayout.toUpperCase();
thelayout=thelayout.substring(0,1);
thelayouttext=new String("Summary Layout");
if (thelayout=="B")
	thelayouttext=new String("Full Details");
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT * from "+teamname+" order by surname");
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
<%
if (debugging)
{
Response.Write("    SQL statement = ["+SQLStmt+"]<br>\r\n");
}
%>
			<table  width=650 border=0 cellspacing=0 cellpadding=0>
				<tr>
					<td class="tdfont" colspan="2" bgcolor="#c0c0c0">
						<b>
							Search request was:
						</b>
					</td>
				</tr>
				<tr>
					<td class="tdfont">
						<b>
							Surname:
						</b>
					</td>
					<td class="tdfont">
						<%= thesearchtext %>
						&nbsp;<%= therealname %>
					</td>
				</tr>
				<tr>
					<td class="tdfont">
						<b>
							Member Grade:
						</b>
					</td>
					<td class="tdfont">
						<%= themembertype %>
					</td>
				</tr>
				<tr>
					<td class="tdfont">
						<b>
							Sorting for Results:
						</b>
					</td>
					<td class="tdfont">
						ascending by <%= thesorttext %>
					</td>
				</tr>
				<tr>
					<td class="tdfont">
						<b>
							Report Layout:
						</b>
					</td>
					<td class="tdfont">
						<%= thelayouttext %>
					</td>
				</tr>
			</table>
<%
// execute the SQL statement
if (! debugging)
	RS = ConnObj.Execute(SQLStmt);
if (thelayout=="A")
{
%>
			<TABLE border="2" WIDTH="100%" BGCOLOR="#ffff80" CELLPADDING="5" COLS="2">
				<TH ALIGN="LEFT" COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000>
					<FONT SIZE=2 FACE="Arial" COLOR=#000000>
						Member Name:
					</FONT>
				</TH>
				<TH COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000 >
					<FONT SIZE=2 FACE="Arial" COLOR=#000000>
						<i>
							(Start of address) - [Home Telephone] {Mobile Phone}
						</i>
					</FONT>
				</TH>
<%
}
if (thelayout=="B")
{
%>
				<TABLE border="2" WIDTH="100%" BGCOLOR="#ffff80" CELLPADDING="5" COLS="2">
					<TH ALIGN="LEFT" COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000>
						<FONT SIZE=2 FACE="Arial" COLOR=#000000>
							Name and Address Details
						</FONT>
					</TH>
					<TH COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000 >
						<FONT SIZE=2 FACE="Arial" COLOR=#000000>
							<i>
								Other Information:
							</i>
						</FONT>
					</TH>
<%
}
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
Response.Write("     <TR>\r\n");
// Insert the following to control access to changes in details
dataline=new String("("+RS("address1")+" "+RS("address2")+") - ["+RS("homephone")+"] {"+RS("mobilephone")+"}");
mystrdob=new String(RS("dob"));
myjoining=new String(RS("joined"));
myleaving=new String(RS("dateleft"));
dobstr=new String(" - Date of birth missing");
joiningstr = new String(" - Joining date missing");
leavingstr = new String(" - No leaving date");
if (mystrdob!="null")
{
	mydob=new Date(RS("dob"));
	dobstr = ddmmyyyy(mydob);
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
					<td class="courtcirc" ALIGN="LEFT" VALIGN="CENTER">
						<B>
							<a href="<%= editline %>								">
								<%= RS("surname") %>
							</a>
							&nbsp;,&nbsp;<%= RS("forename1") %>
							&nbsp;<%= RS("initials") %>
						</B>
					</td>
					<td class="courtcirc">
						<%= dataline %> &nbsp;</TD>
<%
}
if (thelayout=="B")
{
%>
				<td class="courtcirc" ALIGN="LEFT" VALIGN="CENTER">
					<B>
						<a href="<%= editline %>							">
							<%= RS("surname") %>
						</a>
						&nbsp;,&nbsp;<%= RS("forename1") %>
						&nbsp;<%= RS("initials") %>
						<br>
						<%= RS("address1") %>
						<br>
						<%= RS("address2") %>
						<br>
						<%= RS("address3") %>
						<br>
						<%= RS("address4") %>
						<br>
						<%= RS("postcode") %>
					</B>
						<br>
						<i><%= mailline %></i>
				</td>
				<td class="courtcirc">
					Home Phone: <%= RS("homephone") %>
					<br>
					Work Phone: <%= RS("workphone") %>
					<br>
					Mobile Phone: <%= RS("mobilephone") %>
					<br>
					E-mail: <%= RS("email") %>
					<br>
					Date of birth:
					<b>
						<%= dobstr %>
					</b>
					<br>
					Date Joined:
					<b>
						<%= joiningstr %>
					</b>
					<br>
					Date left:
					<b>
						<%= leavingstr %>
					</b>
					<br>
				</TD>
<%
}
Response.Write("       </TR>\r\n");
RS.MoveNext();
}
if (memberknt<1)
{
%>
			<TR>
				<td class="tdfont" colspan="2">
					<BR>
					<CENTER>
						No matching member information found for <%= therealname %>
					</CENTER>
					<BR>
				</TD>
			</TR>
<%
}
else
{
%>
			<TR>
				<td class="tdfont" colspan="2">
					<BR>
					<DIV ALIGN="CENTER">
						Click on the surname corresponding to the member you are searching for to
						view their details
					</DIV>
					<BR>
				</TD>
			</TR>
<%
}	  // end of memberknt test
Response.Write("<TR>");
if (isMembershipEditor())
{
%>
			<td colspan="2" class="tdfont" color="#00000" bgcolor="#aed2ac">
				<BR>
				<DIV ALIGN="CENTER">
					<a href="new_memb.asp">
						Create a new member
					</a>
					<br>
					<br>
					<a href="chk_memb.asp">
						Search again
					</a>
				</DIV>
				<BR>
			</TD>
<%
}
else
{
%>
			<td colspan="2" class="tdfont" color="#00000" bgcolor="#aed2ac">
				<BR>
				<DIV ALIGN="CENTER">
					<a href="chk_memb.asp">
						Search again
					</a>
				</DIV>
				<BR>
			</TD>

<%
} // end of membership editor test
%>
		</TR>
	</TABLE>
	</div>
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>
<div id="leftcolumn">
<!--#include file="home_nav.asp" -->
<!--#include file="memb_nav.asp" -->	
</div>
<div id="footer">
<!--#include file="textnav.asp" -->
</div>
</div>
</body>
</html>
<%
ConnObj.Close();
%>
