<%@ Language="VBScript" %><%

Option Explicit

' Configure Twitter API authentication.
' TODO: Enter your own consumer key and consumer secret here so the code can log you in.
' Get your consumer key and consumer secret here: https://dev.twitter.com/apps
' NOTE: These are dummy values and will not work.
'const TWITTER_API_CONSUMER_KEY = 	"* ~ * ~ * ~ YOU MUST SET THIS! * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ "
'const TWITTER_API_CONSUMER_SECRET = 	"* ~ * ~ * ~ YOU MUST SET THIS, ALSO! * ~ * ~ * ~ * ~ * ~ * ~ * ~ * ~ "

const TWITTER_API_CONSUMER_KEY = 	"0oUWODdiyhkrnlQBBodx8Q"
const TWITTER_API_CONSUMER_SECRET = 	"NNWDlAsOZU9SDYrDrN6eP74ZS0ZxCrqtVCvQ2c0ls"

' Twitter API client.
Dim objASPTwitter

' Tweets will be obtained by parsing data from Twitter API.
Dim objTweets

Call Page_Load

Sub Page_Load()

	'On Error Resume Next

	Set objASPTwitter = New ASPTwitter
	Call objASPTwitter.Configure(TWITTER_API_CONSUMER_KEY, TWITTER_API_CONSUMER_SECRET)

	'Call objASPTwitter.Login
	Call objASPTwitter.SetBearerToken("AAAAAAAAAAAAAAAAAAAAADtvRQAAAAAAfnW0LCZ8LFgdnGlGi1cwG%2FDw%2B%2B4%3DqHaaq96NTuMuaiTxVUSeaLYfNp38KqvIFazv4zWljM")

	Call LoadTweetsUserTimeline
	Call WriteTweetsUserTimeline

	Call LoadTweetsSearch
	Call WriteTweetsSearch

End Sub

' UserTimeline

Sub LoadTweetsUserTimeline()

	' Configure the API call.
	Dim sUsername : sUsername = "timacheson"
	Dim iCount : iCount = 10
	Dim bExcludeReplies : bExcludeReplies = False
	Dim bIncludeRTs : bIncludeRTs = True
	
	Set objTweets = objASPTwitter.GetUserTimeline(sUsername, iCount, bExcludeReplies, bIncludeRTs)
	
End Sub

Sub WriteTweetsUserTimeline()

	%>
	<h2>User Timeline</h2>

	<ol id="Tweets"><%

	If objTweets.length = 0 Then
		%><li>Tweets.asp: No tweets.</li><%
	End If
	
	If Err Then
		%><li>Tweets.asp: invalid API response.</li><%
	End if

	Dim oTweet
	For Each oTweet In objTweets
		
		' Workarounds.
		' JSON parser bug workaround:
		'	- API can return invalid tweets, probably due to characters.
		' Twitter API bugs:
		'	- Filtering by the API can return additional invalid items, and seems to filter only after retrieving the requested number of items, so you get less than you asked for.
		'	- API sometimes seems to exclude replies even if that filter is not set, resulting in "*up to* count" responses and associated issues.
		If IsTweet(oTweet) Or IsRetweet(oTweet) Then
			
			' NOTE: A JSON viewer can be useful here: http://www.jsoneditoronline.org/
			Dim screen_name, text
			If Not IsRetweet(oTweet) Then
				screen_name = oTweet.user.screen_name
				text = URLsBecomeLinks(oTweet.text)
			Else 
				screen_name = oTweet.retweeted_status.user.screen_name
				text = URLsBecomeLinks(oTweet.retweeted_status.text)
			End If
		
			%>
		<li>
			<b class="screen_name">@<%= screen_name %></b>
			<span class="text"><%= text %></span>
		</li><%
		
		End If
		
	Next

	%>
	</ol><%

	Response.Flush()

End Sub

' Search

Sub LoadTweetsSearch()

	' Configure the API call.
	Dim sQuery : sQuery = "from:timacheson"
	Dim iCount : iCount = 10
	Dim lMaxID : lMaxID = Null
	
	Set objTweets = objASPTwitter.GetSearch(sQuery, iCount, lMaxID)
	
End Sub

Sub WriteTweetSearch()

	%>
	<h2>Search</h2>

	<ol id="Tweets"><%

	If objTweets.statuses.length = 0 Then
		%><li>Tweets.asp: No tweets.</li><%
	End If
	
	If Err Then
		%><li>Tweets.asp: invalid API response.</li><%
	End if

	Dim oTweet
	For Each oTweet In objTweets.statuses
		
		' Workarounds.
		' JSON parser bug workaround:
		'	- API can return invalid tweets, probably due to characters.
		' Twitter API bugs:
		'	- Filtering by the API can return additional invalid items, and seems to filter only after retrieving the requested number of items, so you get less than you asked for.
		'	- API sometimes seems to exclude replies even if that filter is not set, resulting in "*up to* count" responses and associated issues.
		If IsTweet(oTweet) Or IsRetweet(oTweet) Then
			
			' NOTE: A JSON viewer can be useful here: http://www.jsoneditoronline.org/
			Dim screen_name, text
			If Not IsRetweet(oTweet) Then
				screen_name = oTweet.user.screen_name
				text = URLsBecomeLinks(oTweet.text)
			Else 
				screen_name = oTweet.retweeted_status.user.screen_name
				text = URLsBecomeLinks(oTweet.retweeted_status.text)
			End If
		
			%>
		<li>
			<b class="screen_name">@<%= screen_name %></b>
			<span class="text"><%= text %></span>
		</li><%
		
		End If
		
	Next

	%>
	</ol><%

	Response.Flush()

End Sub

Function IsTweet(ByRef oTweet)
	IsTweet = HasKey(oTweet, "user") 
End Function

Function IsRetweet(ByRef oTweet)
	IsRetweet = HasKey(oTweet, "retweeted_status") 
End Function

Function IsReply(ByRef oTweet)
	IsReply = Not oTweet.get("in_reply_to_user_id") = Null
End Function

Function HasKey(ByRef oTweet, ByVal sKeyName)
	HasKey = CStr("" & oTweet.get(sKeyName)) Not = ""
End Function

Function URLsBecomeLinks(sText)
	' Wrap URLs in text with HTML link anchor tags.
	Dim objRegExp
	Set objRegExp = New RegExp
	objRegExp.Pattern = "(http://[^\s<]*)"
	objRegExp.Global = True
	objRegExp.ignorecase = True
	UrlsBecomeLinks = "" & objRegExp.Replace(sText, "<a href=""$1"" target=""_blank"">$1</a>")
	Set objRegExp = Nothing
End Function

%>
<!--#include virtual="/Libs/ASPTwitter/ASPTwitter.asp"-->