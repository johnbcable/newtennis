<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Sending Email to Chester for Approval");
// Now for any functions and variables local to this page
function GetEveryThing(thefile)
{
	var fso, f;
	var ForReading = 1, ForWriting = 2;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	myfilename = Server.MapPath(thefile);
	f = fso.OpenTextFile(myfilename, ForReading);
	return(f.ReadAll());
}
var dbconnect=Application("hamptonsportsdb");
var sFrom = new String("Hampton-In-Arden Tennis Club");
var sSubject = new String("Merry Christmas!");
var sMessage = new String(GetEveryThing("xmas.htm"));
var objNewMail;
var sTo;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td>
<%
	objNewMail = Server.CreateObject("CDONTS.NewMail");
	objNewMail.From=new String("secretary@hamptontennis.org.uk");
	objNewMail.To=new String("cbarnes@lanner.co.uk");
	objNewMail.Subject=new String(sSubject);
	objNewMail.BodyFormat=0;
	objNewMail.MailFormat=0;
	objNewMail.Body=new String(sMessage);
	objNewMail.Send();
	objNewMail=null;
	
	objNewMail = Server.CreateObject("CDONTS.NewMail");
	objNewMail.From=new String("secretary@hamptontennis.org.uk");
	objNewMail.To=new String("jcbarnes@tesco.net");
	objNewMail.Subject=new String(sSubject);
	objNewMail.BodyFormat=0;
	objNewMail.MailFormat=0;
	objNewMail.Body=new String(sMessage);
	objNewMail.Send();
	objNewMail=null;
%>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
































