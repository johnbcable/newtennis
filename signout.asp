
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
var refurl, onwardurl, frmUserId, frmPassword;

var debugging = false;    // Set to false for production

//defaults
onwardurl = new String("/index.html").toString();

myusername = new String(Request.ServerVariables("REMOTE_USER")).toString();
myaddress = new String(Request.ServerVariables("REMOTE_ADDR")).toString();
if (myusername == "" || myusername=="null" || myusername == "undefined")
	myusername = new String(myaddress).toString();
connobj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
connobj.Open(dbconnect);
thedate = new Date();
thetime = timeasstring(thedate);

var refurl = new String(Request.Form("refurl")).toString();
if (refurl == "" || refurl=="null" || refurl == "undefined") {
	refurl = new String(Request.QueryString("d")).toString();
	if (refurl == "" || refurl=="null" || refurl == "undefined") {
		refurl = new String("").toString();
	}
}
onwardurl = new String(refurl).toString();

// Get member details for this sign-on
v_memberid = new String(getUserID()).toString();
if (v_memberid == "" ||v_memberid == "null" ||v_memberid == "undefined") {
	v_memberid = new String("NONE").toString();
}

if (! (v_memberid == "NONE"))
{
	// Clear out any old sign-in record for this theref or theid
	SQL2=new String("delete from user_sessions where remoteaddress = '"+myaddress+"' or remoteuser = '"+myusername+"' or memberid = '"+v_memberid+"'").toString();
	RS=connobj.Execute(SQL2);
	SQL3 = new String("insert into member_audits([memberid],[action]) values ('"+v_memberid+"','LOGOUT')");
	RS = connobj.Execute(SQL3);
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
	if (debugging)
	{
			Response.Write("<p><br />");
			Response.Write("SQL2 was     ["+SQL2+"]<br />");
			Response.Write("SQL3 was     ["+SQL3+"]<br />");
			Response.Write("Onward URL was     ["+onwardurl+"]<br />");
			Response.Write("My IP address was     ["+myaddress+"]<br />");
			Response.Write("My username was     ["+myusername+"]<br />");
			Response.Write("</p>");
	}

}
if (! debugging)
{
	Response.Redirect("/index.html");
}
%>
