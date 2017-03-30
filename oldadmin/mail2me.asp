<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Broadcasting Email to Members Personal Email Accounts");
// Now for any functions and variables local to this page
function GetEveryThing(thefile)
{
	var fso, f;
	var ForReading = 1, ForWriting = 2;
	var fcontents;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	myfilename = Server.MapPath(thefile);
	f = fso.OpenTextFile(myfilename, ForReading);
	fcontents = new String(f.ReadAll()).toString();
	f.Close();
	return(fcontents);
}
// Constant single template file for the moment
var whichfile = new String("email_template.htm").toString();
// Other variables
var attachfile1 = new String(Request.Form("attach1")).toString();
var attachfile2 = new String(Request.Form("attach2")).toString();
var attachfile3 = new String(Request.Form("attach3")).toString();
var sSubject = new String(Request.Form("thesubject")).toString();
var sFrom = new String("Hampton-In-Arden Tennis Club");
var squery = new String(Request.Form("query")).toString(); 
var sBodyTitle = new String(Request.Form("bodytitle")).toString();
var sPara1 = Trim(new String(Request.Form("para1")).toString());
var sPara2 = Trim(new String(Request.Form("para2")).toString());
var sPara3 = Trim(new String(Request.Form("para3")).toString());
var sFooterText = new String(Request.Form("footertext")).toString();
var sMessage, sBodyText;
var objNewMail;
var sTo;
var SQL1, SQL2;
var RS;
var dbconnect, connObj;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// Set debugging to true true to get diagnostice messages
debugging = true;
if (whichfile == "null" || whichfile == "undefined" || whichfile == "")
	Response.Redirect("services.asp");
if (attachfile1 == "null" || attachfile1 == "undefined" || attachfile1 == "")
	attachfile1 = new String("NONE").toString();
if (attachfile2 == "null" || attachfile2 == "undefined" || attachfile2 == "")
	attachfile2 = new String("NONE").toString();
if (attachfile3 == "null" || attachfile3 == "undefined" || attachfile3 == "")
	attachfile3 = new String("NONE").toString();
if (sSubject == "null" || sSubject == "undefined" || sSubject == "")
	sSubject = new String("Tennis Club Email Circular");
if (sBodyTitle == "null" || sBodyTitle == "undefined" || sBodyTitle == "")
	sBodyTitle = new String("").tostring();
if (sBodyText == "null" || sBodyText == "undefined" || sBodyText == "")
	sBodyText = new String("").toString();
if (sPara1 == "null" || sPara1 == "undefined" || sPara1 == "")
	sPara1 = new String("BLANK").toString();
if (sPara2 == "null" || sPara2 == "undefined" || sPara2 == "")
	sPara2 = new String("BLANK").toString();
if (sPara3 == "null" || sPara3 == "undefined" || sPara3 == "")
	sPara3 = new String("BLANK").toString();
// Now read in contents of HTML email message
sMessage = new String(GetEveryThing(whichfile));
// Get user email details
uniqref = getUserCode();
uniqref = uniqref.toString();
SQL2 = new String("SELECT email from members where uniqueref = "+uniqref).toString();
sender = new String("johncable@talk21.com").toString();
dbconnect=Application("hamptonsportsdb");
connObj = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
connObj.Open(dbconnect);
RS = connObj.Execute(SQL2);
if (! RS.EOF)
	sender = Trim(new String(RS("email")).toString());
// Now, assemble the main text of the message
sBodyText = new String("").toString();
if (sPara1 == "BLANK")
	Response.Redirect("members.asp");
sBodyText = new String("<p><b>"+sPara1+"</b></p>").toString();
if (! (sPara2 == "BLANK"))
	sBodyText = new String(sBodyText+"<p>"+sPara2+"</p>");
if (! (sPara3 == "BLANK"))
	sBodyText = new String(sBodyText+"<p>"+sPara3+"</p>");
// Now do merge field replacements in standard email template
fullmessage = new String(sMessage).toString();
fullmessage = new String(fullmessage.replace("ZZTitleZZ",sSubject)).toString();
fullmessage = new String(fullmessage.replace("ZZBodyTitleZZ",sBodyTitle)).toString();
fullmessage = new String(fullmessage.replace("ZZBodyTextZZ",sBodyText)).toString();
fullmessage = new String(fullmessage.replace("ZZFooterTextZZ",sFooterText)).toString();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width="100%" border="0" cellspacing="2" cellpadding="5" cols="100,*,120">
  <tr>
    <td width="650">
    	<br>Sending email to <%= sender %> for testing<br><br>
<%
if (debugging)
{
%>
    	Debugging: <br>
    	<br>
    	sBodyText:   [<%= sBodyText %>]<br>
    	<br>
    	sBodyTitle:  [<%= sBodyTitle %>]<br>
    	<br>
    	sFooterText: [<%= sFooterText %>]<br>
    	<br>
    	sender:      [<%= sender %>]<br>
    	<br>
<%
}
%>    	
		<u>Subject</u><br><br>
		<%= sSubject %><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;Attachment 1 is: <%= attachfile1 %><br>
		&nbsp;&nbsp;&nbsp;&nbsp;Attachment 2 is: <%= attachfile2 %><br>
		&nbsp;&nbsp;&nbsp;&nbsp;Attachment 3 is: <%= attachfile3 %><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;Circulation is: <%= squery %><br><br>
    	<u>Message</u><br><br>
    	<%= fullmessage %>
    	<hr width=650>
<%
if (! debugging)
{
	Server.ScriptTimeout = 360;

	objNewMail = new ActiveXObject("CDONTS.NewMail");
	objNewMail.From=new String("support@hamptontennis.org.uk");
	objNewMail.Subject=new String(sSubject).toString();
	objNewMail.BodyFormat=0;
	objNewMail.MailFormat=0;
	objNewMail.Body=new String(fullmessage).toString();
	// Next few lines deal with attachments
	if (attachfile1 != "NONE")
	{
		attachfile1 = Server.MapPath(attachfile1);
	    objNewMail.AttachFile(attachfile1);
	}
	if (attachfile2 != "NONE")
	{
		attachfile2 = Server.MapPath(attachfile2);
	    objNewMail.AttachFile(attachfile2);
	}
	if (attachfile3 != "NONE")
	{
		attachfile3 = Server.MapPath(attachfile3);
	    objNewMail.AttachFile(attachfile3);
	}
	// end of attachments
	objNewMail.To=new String(sender);
	Response.Write("Recipient is ["+sender+"]<br>");
	objNewMail.Send();
	objNewMail=null;
}
else
{
	Response.Write("<br><font color=red><b>There were NO emails sent at this time - debugging</b></font><br>");
}
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