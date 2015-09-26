<%@language="JScript" CODEPAGE="65001"%>
<%
var thefiletext;
var myfilename;
var mailer
var sendOK;;
function GetEveryThing()
{
	var fso, f;
	var ForReading = 1, ForWriting = 2;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	myfilename = Server.MapPath("cc9.htm");
	f = fso.OpenTextFile(myfilename, ForReading);
	return(f.ReadAll());
}
// thefiletext=GetEveryThing();
// Now set up the mail transfer
mailer = Server.CreateObject("SMTPsvg.Mailer");
mailer.FromName="John Cable";
mailer.FromAddress="johncable@talk21.com";
mailer.RemoteHost="mail.hamptontennis.org.uk";
mailer.AddRecipient("John Cable","jcable@dial.pipex.com");
mailer.ConfirmRead=true;
mailer.ContentType="text/html";
mailer.ReturnReceipt=true;
mailer.Subject="Test Email Send of Web Page";
mailer.BodyText=GetEveryThing();
// mailer.GetBodyTextFromFile(Server.MapPath("cc9.htm"));
if (mailer.SendMail())
	sendOK = "Sent OK";
else
	sendOK = "Send Failed : -> " + mailer.Response;
mailer=null;
%>
<!doctype html public "-//w3c//dtd html 3.2//en">

<html>

<head>
<title>(Type a title for your page here)</title>
<meta name="GENERATOR" content="Arachnophilia 4.0">
<meta name="FORMATTER" content="Arachnophilia 4.0">
</head>

<body bgcolor="#ffffff" text="#000000" link="#0000ff" vlink="#800080" alink="#ff0000">

Message send notification
<br>
================================================
<br>
<%= sendOK %>
<br>
================================================
<br>

</body>

</html>
<%
%>
