<%@language="VBScript"%>
<%
Response.AddHeader("Access-Control-Allow-Origin", "http://hamptontennis.org.uk");
Response.AddHeader("Cache-Control", "no-cache,no-store,must-revalidate");
Response.AddHeader("Pragma", "no-cache");
Response.AddHeader("Expires", 0);
%>
<!--#include file="JSON_2.0.4.asp" -->
<!--#include file="JSON_UTIL_0.1.1.asp" -->
<!--#include file="userfuncs.asp" -->
<%
' This page sends back JSON data to a requesting agent 
' From and identified DB query
'Dimension variables
Dim adoCon         'Holds the Database Connection Object
Dim rsDB		   'Holds the recordset for the records in the database
Dim strSQL         'Holds the SQL query to query the database	
Dim dataSource	   'Holds the name of the data source from the Application object
Dim dataResults    'Holds results from the JSON query
Dim debugging      'Are we running in debug mode
Dim debug          'Placeholder for if we are to display debug info
Dim origSQL

debugging = False  'Default production provision

debug = Request.Form("debug")
If debug = "" Then
	debug = Request.QueryString("debug")
	If debug = "Y" Then
		debugging = True
	End If
Else
	If debug = "Y" Then
		debugging = True
	End If
End If

debugging = False

'Retrieve the datSource name from the Application object
dataSource = Application("hamptonsportsdb")
'Create an ADO connection object
Set adoCon = Server.CreateObject("ADODB.Connection")	
'Set an active connection to the Connection object using DSN connection
adoCon.Open dataSource
'Create an ADO recordset object
Set rsDB = Server.CreateObject("ADODB.Recordset")	

' First, retrieve the uniqueref for the currently signed-in person
myuniqueref = getUserCode()

' Now define the SQL to fetch the member details
strSQL = "SELECT * FROM allmembers WHERE uniqueref = " & myuniqueref
origSQL = strSQL


If debugging Then
	Response.Write("myuniqueref = [" & myuniqueref & "]<br />")
	Response.Write("origSQL = [" & origSQL & "]<br />")
	Response.Write("strSQL = [" & strSQL & "]<br />")
	Response.End
End If

dataResults = QueryToJSON(adoCon, strSQL).Flush

Response.ContentType = "application/json"
Response.Write(dataResults)
Response.End
%>
