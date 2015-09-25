<html>
<head>
	<title>RSS Feed Using ASP Classic - For Hampton Tennis wordpress blog</title>
	<style>
		*{font-family:verdana;}
		td{vertical-align:top;padding:5px 5px 5px 5px;}
	</style>
</head>
<body>
<%
	' change the RSSURL variable to the exact URL of the RSS Feed you want to pull
	' RSSURL = "http://www.ticketcity.com/rss/Texas-Longhorns-Football-Tickets.rss"
	RSSURL = "http://hamptontennis.wordpress.com/rss"

	Dim objHTTP ' this object is used to call the RSS Feed remotely
	Dim RSSURL,RSSFeed ' these variables hold the URL and Content for the RSS Feed
	Dim xmlRSSFeed ' this variable hold the XML data in a DOM Object
	Dim objItems,objItem, objChild ' these variables are used to temporarily hold data from the various RSS Items
	Dim title,description,link,pubdate '  these are local variables that will hold the data to be displayed
	Dim OutputHTML_1,OutputHTML_2,OutputHTML_3 ' these variables will hold the HTML that was converted from the RSS Feed
	Dim xmlNodeNames

	' this code requests the raw RSS/XML and saves the response as a string <RSSFeed>
	Set objHTTP = Server.CreateObject("Msxml2.ServerXMLHTTP")
	objHTTP.open "GET",RSSURL,false
	objHTTP.send
	RSSFeed = objHTTP.responseText

	' this code takes the raw RSSFeed and loads it into an XML Object
	Set xmlRSSFeed = Server.CreateObject("MSXML2.DomDocument.4.0")
	xmlRSSFeed.async = false
	xmlRSSFeed.LoadXml(RSSFeed)

	' this code disposes of the object we called the feed with
	Set objHTTP = Nothing

	' this is where you determine how to display the content from the RSS Feed

	' this code grabs all the "items" in the RSS Feed
	Set objItems = xmlRSSFeed.getElementsByTagName("item")

	' this code disposes of the XML object that contained the entire feed
	Set xmlRSSFeed = Nothing
	
	' loop over all the items in the RSS Feed
	For x = 0 to objItems.length - 1
		' this code places the content from the various RSS nodes into local variables
		Set objItem = objItems.item(x)
		For Each objChild in objItem.childNodes
			xmlNodeNames = xmlNodeNames & objChild.nodeName & " | "
			Select Case LCase(objChild.nodeName)
				Case "title"
					  title = objChild.text
				Case "link"
					  link = objChild.text
				Case "description"
					  description = objChild.text
				Case "pubdate"
					  pubdate = objChild.text
			End Select
		Next
		' Here are some various display samples.
		OutputHTML_1 = OutputHTML_1 & "<a href=""" & link & """>" & title & "</a><br />" & description & "<br />Published on:- " & pubdate & "<br /><br />"
	Next
%>

<!-- This is the HTML Layout that will render content from the RSS Feed -->
Here is the output, with content provided by the RSS Feed located at:<br /><%=RSSURL%><hr />

<table border="1">
	<tr>
		<td>
			<h1>XML node names</h1><br />
			<%=xmlNodeNames%>
		</td>
	</tr>
<!--
	<tr>
		<td colspan="3">
			<h1>Raw RSS feed</h1><br />
			<%=RSSFeed%>
		</td>
	</tr>
-->
	<tr>
		<td>Wordpress Blog Output</td>
	</tr>
	<tr>
		<td><%=OutputHTML_1%></td>
	</tr>
</table>
</body>
</html>