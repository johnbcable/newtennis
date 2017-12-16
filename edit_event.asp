<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Editing an Entry in the Event Diary");
// Now for any variables local to this page
var myeventid;
var myDay, myMonth, myYear;
var ConnObj;
var RS, RS2, RS3;
var SQL1, SQL2, SQL3;
var dbconnect=Application("hamptonsportsdb");
var strmonth, stryear, strday, pair1, pair2;
var debugging = true;
var m_eventdate, m_eventtime, m_eventnote, m_eventtype, m_eventid, m_eventreport;
var vdate, m_eventyear;   // m_eventyear is always calculated from m_eventdate
var eventtypelist = new Array("EVENT","SOCIAL","MATCH");
var dummydate, dummytime;
//
// Set up default greeting strings
if (!signedin())
	Response.Redirect("login.asp");
if (!isSupport())
	Response.Redirect("services.asp");
strdate = datestring();
strtime = timestring();
// Get event id
myeventid = new String("-1").toString();
myeventid=new String(Request.Querystring("id"));
if (myeventid == "" || myeventid == "null" || myeventid == "undefined")
{
	myeventid=new String(Request.Form("id"));
	if (myeventid == "" || myeventid == "null" || myeventid == "undefined")
		myeventid = new String("-1");
}
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from allevents where eventid = "+myeventid);
// Initialise local variables
RS = ConnObj.Execute(SQL1);
if (RS.EOF)
	Response.Redirect("noevent.asp?id="+myeventid);
while (! RS.EOF)
{
	dummydate = new String(RS("sortabledate")).toString();
	dummytime = new String(RS("sortabletime")).toString();
	m_eventnote = new String(RS("eventnote")).toString();
	m_eventtype = new String(RS("eventtype")).toString();
	m_eventreport = new String(RS("eventreport")).toString();
	RS.MoveNext();
}
m_eventdate=new String(dummydate.substr(6)+"/"+dummydate.substr(4,2)+"/"+dummydate.substr(0,4)).toString();
m_eventtime=new String(dummytime).toString();
if (m_eventreport == "" || m_eventreport == "null" || m_eventreport == "undefined")
	m_eventreport = new String("").toString();
RS.Close();
// Response.Write(SQLStmt+"<BR>");
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<!--#include file="dateval.asp" -->
<div id="content">
	<div id="mainContent">
		<br />
		<h3>Amending and Entry on the Event Calendar</h3>
		<p>
			Fill in the form below with correct (or updated) details of the event. All boxes must be completed with the exception of 
			the Event Starts At box (which may be left blank). Click on Submit when the new or updated event details are ready 
			to be saved as part of the event calendar.
		</p>
		<form method="get" action="set_event.asp">
			<fieldset>
				<legend>Details of Event</legend>
				<div>
					<label for="eventnote">Name/Title for Event</label>
					<input type="text" name="eventnote" id="eventnote" size="60" maxlength="120" tabindex="1" value="<%= m_eventnote %>" />
				</div>
				<div>
					<label for="eventdate">Date of Event</label>
					<input type="text" name="eventdate" id="eventdate" size="10" maxlength="10" tabindex="2" onBlur="javascript:checkdate(this)" value="<%= m_eventdate %>" />&nbsp;(dd/mm/yyyy) e.g. 09/02/2008 = 9 February 2008
				</div>
				<div>
					<label for="eventtime">Event Starts At</label>
					<input type="text" name="eventtime" id="eventtime" size="5" maxlength="4" tabindex="3" value="<%= m_eventtime %>" />&nbsp;(hhmm) e.g. 0910 = ten past nine in the morning
				</div>
				<div>
					<label for="eventtype">Type of Event</label>
					<select name="eventtype" id="eventtype" tabindex="4">
<%
for (i=0; i<3; i++)
{
	if (eventtypelist[i]==m_eventtype)
		Response.Write("<option selected>"+eventtypelist[i]);
	else
		Response.Write("<option>"+eventtypelist[i]);
}
%>
					</select>	
				</div>		
				<div>
					<label for="eventtime">Report File</label>
					<input type="text" name="eventreport" id="eventreport" size="51" maxlength="50" tabindex="5" value="<%= m_eventreport %>" />&nbsp;
				</div>
				<div id="submitblock" align="right">
							<input type="hidden" name="eventid" value="<%= myeventid %>">
							<p style="margin-right:50px;">
								<input align="right" type="submit" value="Submit">
							</p>
				</div>
			</fieldset>
		</form>
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">
<!--#include file="home_nav.asp" -->
<!--#include file="memb_nav.asp" -->	
	</div>
	<div id="footer">
<!--#include file="textnav.asp" -->
	</div>
</div>
</body>
</html>
<%
%>
