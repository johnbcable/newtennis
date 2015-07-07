<%@ Language="VBScript" %><%

Option Explicit

' Configure Twitter API authentication.
' TODO: Enter your own consumer key and consumer secret here so the code can log you in.
' Get your consumer key and consumer secret here: https://dev.twitter.com/apps
' NOTE: These are dummy values and will not work.

const TWITTER_API_CONSUMER_KEY = 	"0oUWODdiyhkrnlQBBodx8Q"
const TWITTER_API_CONSUMER_SECRET = 	"NNWDlAsOZU9SDYrDrN6eP74ZS0ZxCrqtVCvQ2c0ls"

const TWITTER_API_OAUTH_TOKEN = 	"101008664-pJ97TWTBXRFj1DYbK3LULt74ZLr2MWhaAjkoIPju"
const TWITTER_API_OAUTH_TOKEN_SECRET = 	"ya9Ig3F8EjLg2H62imPkpma7uMAJnohpaYElaUDeFYY"

' Twitter API client.
Dim objASPTwitter

' Tweets will be obtained by parsing data from Twitter API.
Dim objTweets

Call Page_Load

Sub Page_Load()

	'On Error Resume Next

	Set objASPTwitter = New ASPTwitter
	Call objASPTwitter.Configure(TWITTER_API_CONSUMER_KEY, TWITTER_API_CONSUMER_SECRET)
	Call objASPTwitter.ConfigureOAuth(TWITTER_API_OAUTH_TOKEN, TWITTER_API_OAUTH_TOKEN_SECRET)

End Sub

%>

	<h3>Update Status (i.e. post a tweet)</h3>

	<form action="default.asp" method="post">
		<input name="status" type="text" length="140" maxlength="140" value="Test to be deleted" />
		<input name="submit" type="submit" value="Post Tweet" />
	</form>

<%

If Request.Form("submit") = "Post Tweet" Then


	Call UpdateStatus
	Call WriteUpdateStatusResult


End If

Sub UpdateStatus()

	' Configure the API call.
	Dim sStatus : sStatus = "Test"
	
	Set objTweets = objASPTwitter.UpdateStatus(Request.Form("status"))
	
End Sub

Sub WriteUpdateStatusResult()

	%>
	<h3>Result</h3>
	<%

	If objTweets = Null Or objTweets.id_str = Null Then
		%><p>Update failed, check API response for troubleshooting clues.</p><%
	End If

	Dim sTweetURL : sTweetURL = "https://twitter.com/" & objTweets.user.screen_name & "/status/" & objTweets.id_str

	%>
	<p>Tweeted: <a href="<%= sTweetURL %>" target="_blank"><%= sTweetURL %></a></p>
	<%

	Response.Flush()

End Sub

%>
<!--#include virtual="/Libs/ASPTwitter/ASPTwitter.asp"-->