<%@ Language="VBScript" %><%

Option Explicit

%><!DOCTYPE html>
<html lang="en-gb">
	<head>
		<meta charset="utf-8">
		<title>ASPTwitter example</title>
	</head>
	<body>
		<h1>ASPTwitter examples</h1>

		<% Server.Execute("Tweets.asp") %>

		<% Server.Execute("Tweet.asp") %>
	</body>
</html>