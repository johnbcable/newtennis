<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Leaving Members Area");
// DB connection stuff
var zz, result;
var myusername, myaddress;
var thedate, thetime;
var dbconnect=Application("hamptonsportsdb");
var connobj, RS, SQL1, SQL2, SQL3;
var v_memberid;
var debugging = false;
myusername = new String(Request.ServerVariables("REMOTE_USER")).toString();
myaddress = new String(Request.ServerVariables("REMOTE_ADDR")).toString();
if (myusername == "" || myusername=="null" || myusername == "undefined")
	myusername = new String(myaddress).toString();
connobj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
connobj.Open(dbconnect);
thedate = new Date();
thetime = timeasstring(thedate);
// Get member details for this sign-on
v_memberid = new String(getUserID()).toString();
if (! (v_memberid == "NONE"))
{
	// Clear out any old sign-in record for this theref or theid
	SQL2=new String("delete from user_sessions where remoteaddress = '"+myaddress+"' or remoteuser = '"+myusername+"' or memberid = '"+v_memberid+"'").toString();
	RS=connobj.Execute(SQL2);
	// SQL3 = new String("insert into member_audits([memberid],[action]) values ('"+v_memberid+"','LOGOUT')");
	// RS = connobj.Execute(SQL3);
	RS=null;
	connobj.Close();
	connobj=null;
	// Now for any variables local to this page
	// Response.Cookies("member")("memberid")="";
	// Response.Cookies("member")("membername")="";
	// Response.Cookies("member")("acclevel")=0;
	// Set up default greeting strings
	strdate = datestring();
	strtime = timestring();
	// End of page start up coding
}
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
<%
if (debugging)
{
%>
		<table>
			<caption>Logout current_debug_status() info</caption>
			<thead>
				<tr>
					<th>Variable</th>
					<th>Value</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>v_memberid</td>
					<td><%= v_memberid %></td>
				</tr>
				<tr>
					<td>SQL2</td>
					<td><%= SQL2 %></td>
				</tr>
				<tr>
					<td>SQL3</td>
					<td><%= SQL3 %></td>
				</tr>
				<tr>
					<td>myusername</td>
					<td><%= myusername %></td>
				</tr>
				<tr>
					<td>myaddress</td>
					<td><%= myaddress %></td>
				</tr>				
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						****    End of debug info    ****
					</td>
				</tr>
			</tfoot>
		</table>				
<%
}
else
{
Response.Redirect("index.asp");
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
%>
