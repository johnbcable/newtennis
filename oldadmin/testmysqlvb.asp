<%
Dim oConn, oRS, oRS2
Dim qry, qry2, connectstr
Dim db_name, db_username, db_userpassword
Dim db_server
Dim myId, myLeagues, mySchedules
Dim myForename, mySurname

'  Should myLeagues be an array? '

db_server = "bu2.ebookingonline.net"
db_name = "bookingdb29"
db_username = "29Cabinet"
db_userpassword = "aDj4cent"
' fieldname = "your_field"
tablename = "members"
myForename = ""
mySurname = ""
myLeagues = "("
mySchedules = "("

Set myId = Request.QueryString("playerid")
'  Set myLeagues = "("

if myId = "" then
	myId = 0
end if

connectstr = "Driver={MySQL ODBC 3.51 Driver};SERVER=" & db_server & ";DATABASE=" & db_name & ";UID=" & db_username & ";PWD=" & db_userpassword

Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open connectstr

Response.Write "Fetching ebooking online involvement for player " & myId & "<br /><br />"

'  My details ========================================================='
Response.Write "<h3>First, get player details from members table:</h3><br /><br/>"

qry = "SELECT * FROM members WHERE membership_number = " & myId

Set oRS = oConn.Execute(qry)

if not oRS.EOF then
while not oRS.EOF

	myForename = oRS.Fields("first_name")
	mySurname = oRS.Fields("last_name")

	Response.Write "Name: " & oRS.Fields("first_name") & " " & oRS.Fields("last_name") & "<br />"
	Response.Write "Membership Number (User ID): " & oRS.Fields("membership_number") & "<br />"
	Response.Write "Email address: " & oRS.Fields("email") & "<br />"

' response.write "membership_number: " & oRS.Fields("membership_number") & ", first_name: " & oRS.Fields("first_name") & ", last_name: " & oRS.Fields("last_name") & ", password: "  & oRS.Fields("password") & ", active: "  & oRS.Fields("active") & ", priv_level: "  & oRS.Fields("priv_level") & ", special: "  & oRS.Fields("special") & ", colour: "  & oRS.Fields("colour") & ", email: "  & oRS.Fields("email") & ", remails: "  & oRS.Fields("remails") & ", html_email: "  & oRS.Fields("html_email") & ", bounce: "  & oRS.Fields("bounce")  & ", auth_id: "  & oRS.Fields("auth_id") & ", type_id: "  & oRS.Fields("type_id") & ", alt_membership_number: "  & oRS.Fields("alt_membership_number") & "<br><br>" 
'
oRS.movenext
wend
oRS.close
end if

'  List of all leagues ========================================================='
Response.Write "<h3>Second, get list of all leagues involving player " & myForename & " " & mySurname & ":</h3><br /><br/>"

qry = "SELECT l.league_id, l.name FROM leagues l WHERE league_id IN (SELECT DISTINCT(league_id) FROM entrants WHERE membership_number = " & myId & ") ORDER BY league_id DESC"

Set oRS = oConn.Execute(qry)

if not oRS.EOF then
while not oRS.EOF
	Response.Write "League ID:  " & oRS.Fields("league_id") & "<br />"
	Response.Write "Name:  " & oRS.Fields("name") & "<br /><br />"

'response.write "league_id: " & oRS.Fields("league_id") & ", name: " & oRS.Fields("name") & ", ideal: " & oRS.Fields("ideal") & ", min: "  & oRS.Fields("min") & ", win: "  & oRS.Fields("win") & ", game: "  & oRS.Fields("game") & ", scored: "  & oRS.Fields("scored") & ", movement: "  & oRS.Fields("movement") & ", email: "  & oRS.Fields("email") & ", mobile: "  & oRS.Fields("mobile") & "<br><br>"
'
	myLeagues = myLeagues & oRS.Fields("league_id") & ","

oRS.movenext
wend
oRS.close
end if
myLeagues = myLeagues & ")"

Response.Write "myLeagues is now " & myLeagues & "<br /><br />"

'  List of all current schedules ========================================================='
Response.Write "<h3>Third, get list of all current schedules for those leagues involving " & myForename & " " & mySurname & ":</h3><br /><br/>"

qry = "SELECT league_id, schedule_id FROM entrants WHERE membership_number = " & myId

Set oRS = oConn.Execute(qry)

if not oRS.EOF then
while not oRS.EOF

	curleague = oRS.Fields("league_id")
	curschedule = oRS.Fields("schedule_id")

	Response.Write "League ID:  " & curleague & "<br />"
	' Response.Write "Ranking for " & myForename & " " & mySurname &  " : " & CInt(oRS.Fields("ranking")) &"<br />"
	' Response.Write "Active ? :  " & oRS.Fields("active") & "<br />"

	Response.Write "Current schedule ID : " & curschedule & "<br /><br />"

	' Now construct second query based on results of first'

	qry2 = "SELECT * FROM league_schedule WHERE schedule_id = " & curschedule

	Response.Write "Query on league_schedule is : " & qry2 & "<br /><br />"

	Set oRS2 = oConn.Execute(qry2)

	if not oRS2.EOF then
	while not oRS2.EOF

		Response.Write "League : " & oRS2("league_id") & "<br />"
		Response.Write "Division : " & oRS2("division_number") & "<br />"
		Response.Write "Start : " & oRS2("start") & "<br />"
		Response.Write "Finish : " & oRS2("finish") & "<br />"
		Response.Write "Players : " & oRS2("palyers") & "<br />"
		Response.Write "Results : " & oRS2("results") & "<br />"
		Response.Write "Active ? : " & oRS2("active") & "<br /><br />"
		oRS2.movenext

	wend
	oRS2.close
	end if 

	oRS.movenext
wend
oRS.close
end if



Set oRs = nothing
Set oConn = nothing

%>
