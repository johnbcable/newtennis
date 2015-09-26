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
	myfilename = Server.MapPath("2002dinner.htm");
	f = fso.OpenTextFile(myfilename, ForReading);
	return(f.ReadAll());
}
// thefiletext=GetEveryThing();
// Now set up the mail transfer
mailer = Server.CreateObject("CDONTS.NewMail");
mailer.From="johncable@talk21.com";
mailer.To="jcable@dial.pipex.com";
mailer.Subject="Test Email Send of Web Page";
mailer.BodyFormat=0;
mailer.MailFormat=0;
mailer.Body=GetEveryThing();
mailer.Send();
mailer=null;
%>
<!doctype html public "-//w3c//dtd html 3.2//en">

<html>

<head>
<title>Test CDONTS Page</title>
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="FORMATTER" content="Arachnophilia 4.0">
</head>

<body bgcolor="#ffffff" text="#000000" link="#0000ff" vlink="#800080" alink="#ff0000">

Message send notification
<br>
================================================
<br>
Message sent
<br>
================================================
<br>

</body>

</html>
<%
%>
