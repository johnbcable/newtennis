<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Updating Details ");
// Now for any variables local to this page
var clubid;
var theclub = new Object();
var ConnObj;
var RS,RS2,RS3;
var SQLStmt, SQL2, SQL3;
var kount;
var memberknt;
var dbconnect=Application("hamptonsportsdb");
var debugging=false;
var updating=true;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
// Initialise update variables
clubid = new String(Request.Form("clubid")).toString();
if (clubid == "null" || clubid == "" || clubid == "undefined")
{
	clubid = new String(Request.QueryString("clubid")).toString();
	if (clubid == "null" || clubid == "" || clubid == "undefined")
		Response.Redirect("directions.asp");
}
// Security checks
if (! signedin())
	Response.Redirect("lst_club.asp?clubid="+clubid);
if (! isAdministrator())
	Response.Redirect("lst_club.asp?clubid="+clubid);
// Get existing club details
theclub = getClub(clubid);
theclub.clubname = Trim(new String(Request.Form("clubname"))).toString();
if (theclub.clubname == "null")
	theclub.clubname = new String("").toString();
theclub.address1 = Trim(new String(Request.Form("address1"))).toString();
if (theclub.address1 == "null")
	theclub.address1 = new String("").toString();
theclub.address2 = Trim(new String(Request.Form("address2"))).toString();
if (theclub.address2 == "null")
	theclub.address2 = new String("").toString();
theclub.address3 = Trim(new String(Request.Form("address3"))).toString();
if (theclub.address3 == "null")
	theclub.address3 = new String("").toString();
theclub.address4 = Trim(new String(Request.Form("address4"))).toString();
if (theclub.address4 == "null")
	theclub.address4 = new String("").toString();
theclub.town = Trim(new String(Request.Form("town"))).toString();
if (theclub.town == "null")
	theclub.town = new String("").toString();
theclub.county = Trim(new String(Request.Form("county"))).toString();
if (theclub.county == "null")
	theclub.county = new String("").toString();
theclub.postcode = Trim(new String(Request.Form("postcode"))).toString();
if (theclub.postcode == "null")
	theclub.postcode = new String("").toString();
theclub.telephone = Trim(new String(Request.Form("telephone"))).toString();
if (theclub.telephone == "null")
	theclub.telephone = new String("").toString();
theclub.fax = Trim(new String(Request.Form("fax"))).toString();
if (theclub.fax == "null")
	theclub.fax = new String("").toString();
theclub.email = Trim(new String(Request.Form("email"))).toString();
if (theclub.email == "null")
	theclub.email = new String("").toString();
theclub.contact = Trim(new String(Request.Form("contact"))).toString();
if (theclub.contact == "null")
	theclub.contact = new String("").toString();
theclub.totaltennis = Trim(new String(Request.Form("totaltennis"))).toString();
if (theclub.totaltennis == "null")
	theclub.totaltennis = new String("").toString();
theclub.cluburl = Trim(new String(Request.Form("cluburl"))).toString();
if (theclub.cluburl == "null")
	theclub.cluburl = new String("").toString();
theclub.comments = Trim(new String(Request.Form("comments"))).toString();
if (theclub.comments == "null")
	theclub.comments = new String("").toString();
theclub.email2 = Trim(new String(Request.Form("email2"))).toString();
if (theclub.email2 == "null")
	theclub.email2 = new String("").toString();
theclub.contact2 = Trim(new String(Request.Form("contact2"))).toString();
if (theclub.contact2 == "null")
	theclub.contact2 = new String("").toString();
theclub.telephone2 = Trim(new String(Request.Form("telephone2"))).toString();
if (theclub.telephone2 == "null")
	theclub.telephone2 = new String("").toString();
theclub.email3 = Trim(new String(Request.Form("email3"))).toString();
if (theclub.email3 == "null")
	theclub.email3 = new String("").toString();
theclub.contact3 = Trim(new String(Request.Form("contact3"))).toString();
if (theclub.contact3 == "null")
	theclub.contact3 = new String("").toString();
theclub.telephone3 = Trim(new String(Request.Form("telephone3"))).toString();	
if (theclub.telephone3 == "null")
	theclub.telephone3 = new String("").toString();
// Do DB update
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1="update otherclubs set clubname='"+theclub.clubname+"', contact='"+theclub.contact+"',totaltennis='"+theclub.totaltennis+"',cluburl='"+theclub.cluburl+"',comments='"+theclub.comments+"'";
SQL1+=",address1='"+theclub.address1+"',address2='"+theclub.address2+"',address3='"+theclub.address3+"',address4='"+theclub.address4+"'";
SQL1+=",town='"+theclub.town+"',county='"+theclub.county+"',postcode='"+theclub.postcode+"'";
SQL1+=",telephone='"+theclub.telephone+"',fax='"+theclub.fax+"',email='"+theclub.email+"'";
SQL1+=",telephone2='"+theclub.telephone2+"',contact2='"+theclub.contact2+"',email2='"+theclub.email2+"'";
SQL1+=",telephone3='"+theclub.telephone3+"',contact3='"+theclub.contact3+"',email3='"+theclub.email3+"'";
SQL1+=" where clubid="+clubid;
if (updating)
	RS = ConnObj.Execute(SQL1);
RS=null;
ConnObj.Close();
ConnObj=null;
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>Updating other club details for <%= theclub.clubname %> ...</h3>
		<p>Database updated.</p>
<% 
if (debugging)
	Response.Write("<br>["+SQL1+"]<br><br>");
else
	Response.Redirect("lst_clubs.asp");
%>
	</div>  <!-- mainContent -->
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
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
</html>
<%
%>

