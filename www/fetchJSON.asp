<%@language="VBScript"%>
<%
Response.AddHeader "Access-Control-Allow-Origin", "*"
%>
<!--#include file="JSON_2.0.4.asp" -->
<!--#include file="JSON_UTIL_0.1.1.asp" -->
<%
' This page sends back JSON data to a requesting agent 
' From and identified DB query
'Dimension variables
Dim adoCon         'Holds the Database Connection Object
Dim rsDB		   'Holds the recordset for the records in the database
Dim strSQL         'Holds the SQL query to query the database	
Dim dataSource	   'Holds the name of the data source from the Application object
Dim dataResults    'Holds results from the JSON query
Dim querylist(60)  'Array of queries
Dim queryref       'Reference to query in querylist (default to 1)
Dim p1, p2, p3     'Parameters (text)
Dim paramknt       'Count of the number of parameters
Dim debugging      'Are we running in debug mode
Dim debug          'Placeholder for if we are to display debug info
Dim origSQL        'Holds a copy of the original SQL from the querylist 
Dim testing        'Is the real or test database to be used (Y=test)

p1 = ""
p2 = ""
p3 = ""
paramknt = 0
testing = "N"

debugging = False  'Default production provision

'Now retrieve query details from submitting form or querystring
'and initialise the strSQL variable with an SQL statement to query the database
queryref = Request.Form("id")
If queryref = "" Then
	queryref = Request.QueryString("id")
	If queryref = "" Then
		queryref = -1
	End If
End If

' Optionally consider dealing with fill-in fields for the identified query
If queryref > -1 Then	

	p1 = Request.Form("p1")
	If p1 = "" Then
		p1 = Request.QueryString("p1")
		If p1 <> "" Then
			paramknt = paramknt + 1
		End If
	End If

	p2 = Request.Form("p2")
	If p2 = "" Then
		p2 = Request.QueryString("p2")
		If p2 <> "" Then 
			paramknt = paramknt + 2
		End If
	End If

	p3 = Request.Form("p3")
	If p3 = "" Then
		p3 = Request.QueryString("p3")
		If p3 <> "" Then
			paramknt = paramknt + 4
		End If
	End If

Else

 	'No query Id so use the supplied query
	thequery = Request.Form("thequery")
	If thequery = "" Then
		thequery = Request.QueryString("thequery")
		If thequery = "" Then
			thequery = "SELECT ""There are no results"" FROM coaches"
		End If
	End If

End If

'Retrieve the datSource name from the Application object
dataSource = Application("hamptonsportsdb")

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

'Create an ADO connection object
Set adoCon = Server.CreateObject("ADODB.Connection")	
'Set an active connection to the Connection object using DSN connection
adoCon.Open dataSource
'Create an ADO recordset object
Set rsDB = Server.CreateObject("ADODB.Recordset")	

If queryref > -1 Then

	'Initialise querylist with queries
	querylist(0) = "SELECT count(*) FROM members"
	querylist(1) = "SELECT eventdate, Format(eventtime,'HH:mm') as eventtime, Format(endtime,'HH:mm') as endtime, eventnote, eventreport FROM futureevents WHERE eventdate = Date() ORDER BY eventtime ASC;"
	querylist(2) = "SELECT dateofevent, eventdate, eventtime, eventtype, eventnote, eventreport, enddate, endtime FROM futureevents WHERE eventdate > Date() AND eventdate < (Date()+14) ORDER BY eventdate ASC;"
	querylist(3) = "SELECT * FROM coaches WHERE surname = ""POOLE"";"
	querylist(4) = "SELECT * FROM coaches WHERE surname NOT LIKE ""POOLE"";"
	querylist(5) = "SELECT * FROM coaches ORDER BY surname ASC;"
	querylist(6) = "SELECT * FROM tennisfixtures where fixtureyear = {{p1}} ORDER BY teamname,fixturedate;"
	querylist(7) = "SELECT memberid FROM User_Sessions where remoteaddress = '{{p1}}'"
	querylist(8) = "SELECT * FROM tennisfixtures where fixtureyear = {{p1}} and homeoraway in ({{p2}}) {{p3}} ORDER BY teamname,fixturedate;"
	querylist(9) = "SELECT memberid FROM User_Sessions where remoteaddress = '{{p1}}' ORDER BY [loggedindate] ASC, [loggedintime] ASC"
	querylist(10) = "SELECT * FROM User_Sessions where memberid = '{{p1}}'"
	querylist(11) = "SELECT * FROM allmembers WHERE onlinebookingid = {{p1}} AND onlinebookingpin = '{{p2}}';"
	querylist(12) = "SELECT * FROM members WHERE uniqueref = {{p1}}"
	querylist(13) = "SELECT * FROM {{p1}}"
	querylist(14) = "SELECT * FROM members WHERE surname LIKE UCase('{{p1}}%') AND membergrade in ('Adult','18-25s','SOCIAL') ORDER BY surname, address1, forename1"
	querylist(15) = "SELECT * FROM clubcommunications WHERE datesent > (Date()-20) ORDER BY datesent DESC;"
	querylist(16) = "SELECT gender, membergrade, count(*) AS kount FROM members WHERE detailscorrectdate IS NOT null GROUP BY gender, membergrade;"
	querylist(17) = "SELECT * FROM tennisteams WHERE teamcategory = 'ADULT' AND teamid NOT IN (42) ORDER BY teamname, teamid;"
	querylist(18) = "SELECT Format(start_date,'YYYY-mm-dd') AS start_date, Format(end_date,'YYYY-mm-dd') AS end_date, Format(break_start,'YYYY-mm-dd') AS break_start, Format(break_end,'YYYY-mm-dd') AS break_end, Format(fees_hour, 'Standard') as fees_hour, Format(fees_45mins, 'Standard') as fees_45mins, Format(fees_30mins, 'Standard') AS fees_30mins FROM coaching_schedules WHERE schedule_role = 'NEXT';"
	querylist(19) = "SELECT * FROM coaching_lessons WHERE lesson_day = '{{p1}}' ORDER BY group_display_order, start_time, lesson_id, end_time;"
	querylist(20) = "SELECT Format(fixturedate,'dd/mm/YYYY') AS fixturedate, homeoraway, fixtureid, opponents, hamptonresult, opponentresult, fixtureyear, teamname, pair1, pair2, fixturenote, matchreport FROM tennisfixtures WHERE fixtureyear = {{p1}} AND teamname = '{{p2}}' ORDER BY fixturedate ASC;"
	querylist(21) = "SELECT * FROM otherclubs ORDER BY clubname;"
	querylist(22) = "SELECT eventdate, Format(eventtime,'HH:mm') as eventtime, Format(endtime,'HH:mm') as endtime, eventnote, eventreport FROM futureevents WHERE eventtype in('SOCIAL','MATCH','EVENT', 'SOCIALTENNIS')  AND eventdate = Date() ORDER BY eventtime ASC;"
	querylist(23) = "SELECT * FROM winners WHERE [year] = {{p1}} ORDER BY [displayorder] ASC;"
	querylist(24) = "SELECT * from news where visible = 'Y' order by newspriority asc, newsid desc;"
	querylist(25) = "SELECT * from member_audits where action in ('LOGIN','LOGOUT') order by action_date desc, action_time desc;"
	querylist(26) = "SELECT m.forename1, m.surname, m.onlinebookingid FROM members m, member_audits a WHERE a.action IN ('SIGNIN','SIGNOUT','LOGIN','LOGOUT') AND a.memberid = m.memberid;"

	querylist(27) = "SELECT webaccess, count(*) AS kount FROM members GROUP BY webaccess;"
	querylist(28) = "SELECT wimbledonweekday, membergrade, detailscorrect, count(*) AS kount FROM members WHERE detailscorrectdate IS NOT null GROUP BY wimbledonweekday, membergrade, detailscorrect;"
	querylist(29) = "SELECT gender, membergrade, count(*) AS kount FROM members WHERE {{p1}} LIKE 'Y' GROUP BY gender, membergrade;"
	querylist(30) = "SELECT DISTINCT([memberid]) FROM member_audits WHERE action IN ('SIGNIN','SIGNOUT')"
	querylist(31) = "SELECT * FROM events WHERE eventtype = '{{p1}}' ORDER BY eventdate DESC"
	querylist(32) = "SELECT * FROM events WHERE eventid = {{p1}}"
	querylist(33) = "SELECT * FROM winners WHERE [title] = '{{p1}}' ORDER BY [year] DESC;"
	querylist(34) = "SELECT [title], MIN(displayorder) as displayorder, COUNT(*) as kount FROM winners GROUP BY [title], [displayorder] ORDER BY [displayorder] ASC;"
	querylist(35) = "SELECT m.forename1, m.surname, m.onlinebookingid FROM members m WHERE m.onlinebookingid IN ({{p1}});"
	querylist(36) = "SELECT * FROM tennisteams WHERE teamcategory = 'ADULT' AND teamname ='{{p1}}';"
	querylist(37) = "SELECT * FROM members WHERE webaccess = {{p1}};"
	querylist(38) = "SELECT gender, membergrade, forename1, surname, detailscorrectdate FROM members WHERE detailscorrectdate IS NOT null AND detailscorrectdate > (Date()-{{p1}})"
	querylist(39) = "SELECT * FROM members WHERE email LIKE '%{{p1}}%';"
	querylist(40) = "SELECT eventtype, MAX(eventdate) as latestdate, count(*) as kount FROM events GROUP BY eventtype ORDER BY eventtype"
	querylist(41) = "SELECT DISTINCT([surname]) FROM allmembers WHERE [membergrade] in ('Adult','18-25s','Junior','Under 7','Social') ORDER BY surname ASC"
	querylist(42) = "SELECT DISTINCT([surname]) FROM allmembers ORDER BY surname ASC"
	querylist(43) = "SELECT * FROM members WHERE mobilephone LIKE '%{{p1}}%';"
	querylist(44) = "SELECT m.forename1, m.surname, m.membergrade, m.britishtennisno FROM members m WHERE dob IS NULL;"
	querylist(45) = "SELECT gender, membergrade, forename1, surname, joined FROM allmembers WHERE joined IS NOT null AND joined > CDate('August 31, 2016') AND currentage > 17"
	querylist(46) = "SELECT Format(fixturedate,'dd/mm/YYYY') AS fixturedate, homeoraway, fixtureid, opponents, hamptonresult, opponentresult, fixtureyear, teamname, pair1, pair2, fixturenote, matchreport FROM tennisfixtures WHERE fixtureyear = {{p1}} AND (fixturedate > Date()-1) AND homeoraway = 'H' ORDER BY fixturedate ASC;"

	querylist(48) = "SELECT * FROM allmembers WHERE currentage = {{p1}}"
	querylist(49) = "SELECT gender, currentage, count(*) as kount FROM allmembers WHERE currentage > 44 AND currentage < 65 GROUP BY gender, currentage"

	querylist(50) = "SELECT * FROM allmembers WHERE [email] LIKE '%{{p1}}%' ORDER BY surname, forename1 ASC"

	strSQL = querylist(queryref)
	origSQL = strSQL

	'Now, replace any fill-in fields with their params

	If (paramknt > 0)  Then
		strSQL = replace(strSQL, "{{p1}}", p1)
	End If

	If (paramknt > 1)  Then
		strSQL = replace(strSQL, "{{p2}}", p2)
	End If

	If (paramknt > 2)  Then
		strSQL = replace(strSQL, "{{p3}}", p3)
	End If

	'Now for any predecided substitutions
	
Else

	strSQL = thequery
	origSQL = strSQL

End If

If debugging Then
	Response.Write("p1 = [" & p1 & "]<br />")
	Response.Write("p2 = [" & p2 & "]<br />")
	Response.Write("p3 = [" & p3 & "]<br />")
	Response.Write("testing = [" & testing & "]<br />")
	Response.Write("origSQL = [" & origSQL & "]<br />")
	Response.Write("strSQL = [" & strSQL & "]<br />")
	Response.End 
End If

dataResults = QueryToJSON(adoCon, strSQL).Flush

Response.ContentType = "application/json"

Response.Write(dataResults)
Response.End
%>
