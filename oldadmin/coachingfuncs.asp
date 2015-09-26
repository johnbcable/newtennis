<script language="JScript" CODEPAGE="65001" runat=Server>
//
//  getGroup(lessonid)           		returns coaching_lesson Object
//  setGroup(lessonObject)				returns result Object
//  printGroup(lessonObject)			returns string
//  getSchedule(scheduleid)        		returns coaching_schedule Object
//  setSchedule(scheduleObject)			returns result Object
//  printSchedule(scheduleObject)		returns string
//  getLesson(lessonid)        			returns coaching_lesson Object
//  setLesson(lessonObject)				returns result Object
//  printLesson(lessonObject)			returns string
//
// ================================================================
// COACHING GROUPS
// ================================================================
function getGroup(groupid)
{
	// Establish local variables
	var thegroup = new Object();
	var sGroup = new String(groupid);
	var RS, RS2, Conn, SQL1, SQL2, dbconnect;
	//
	thegroup.group_id = new String(sGroup).toString();
	//
	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	// 
	SQL1 = new String("SELECT * from coaching_groups where group_id = " + sGroup);
	RS = Conn.Execute(SQL1);
	// Retrieve database values for member
	while (! RS.EOF)
	{
		thegroup.group_id = Trim(new String(RS("group_id")).toString());
		thegroup.description = Trim(new String(RS("description")).toString());
   		thegroup.start_age= Trim(new String(RS("start_age")).toString());
		thegroup.end_age= Trim(new String(RS("end_age")).toString());
		thegroup.qualifier_text = Trim(new String(RS("qualifier_text")).toString());
		thegroup.prime_information= Trim(new String(RS("prime_information")).toString());
		thegroup.secondary_information= Trim(new String(RS("secondary_information")).toString());
		thegroup.display_order= Trim(new String(RS("display_order")).toString());
		RS.MoveNext();
	}
	if (thegroup.description=="null" || thegroup.description=="undefined")
		thegroup.description="";
	if (thegroup.start_age=="null" || thegroup.start_age=="undefined")
		thegroup.start_age="";
	if (thegroup.end_age=="null" || thegroup.end_age=="undefined")
		thegroup.end_age="";
	if (thegroup.qualifier_text=="null" || thegroup.qualifier_text=="undefined")
		thegroup.qualifier_text="";
	if (thegroup.prime_information=="null" || thegroup.prime_information=="undefined")
		thegroup.prime_information="";
	if (thegroup.secondary_information=="null" || thegroup.secondary_information=="undefined")
		thegroup.secondary_information="";
	if (thegroup.display_order=="null" || thegroup.display_order=="undefined")
		thegroup.display_order="";
	
	return(thegroup);
}
// ================================================================
function setGroup(groupobj)
{
	// Establish local variables
	var sGroup = new String(groupobj.group_id);
	var RS, RS2, Conn, SQL1, SQL2, dbconnect;
	var mDateObj, dummy1;
	var resultObj = new Object();
	var e;
	//
	resultObj.result = true;
	resultObj.errno = 0;
	resultObj.description = new String("").toString();
	//
	if (groupobj.description=="null" || groupobj.description =="undefined")
		groupobj.description="";
	if (groupobj.start_age=="null" || groupobj.start_age =="undefined")
		groupobj.start_age="";
	if (groupobj.end_age=="null" || groupobj.end_age =="undefined")
		groupobj.end_age="";
	if (groupobj.qualifier_text=="null" || groupobj.qualifier_text =="undefined")
		groupobj.qualifier_text="";
	if (groupobj.prime_information=="null" || groupobj.prime_information =="undefined")
		groupobj.prime_information="";
	if (groupobj.secondary_information=="null" || groupobj.secondary_information =="undefined")
		groupobj.secondary_information="";
	if (groupobj.display_order=="null" || groupobj.display_order =="undefined")
		groupobj.display_order="";
	
	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	SQLstart = new String("UPDATE coaching_groups ")
	SQLend = new String(" WHERE group_id="+groupobj.group_id).toString();
	SQLmiddle = new String("SET ").toString();
	SQLmiddle += " group_id='"+groupobj.id+"',";
	SQLmiddle += " description='"+groupobj.description+"',";
	SQLmiddle += " start_age='"+groupobj.start_age+"',";
	SQLmiddle += " end_age='"+groupobj.end_age+"',";
	SQLmiddle += " qualifier_text='"+groupobj.qualifier_text+"',";
	SQLmiddle += " prime_information='"+groupobj.prime_information+"',";
	SQLmiddle += " secondary_information='"+groupobj.secondary_information+"',";
	SQLmiddle += " display_order='"+groupobj.display_order+"'";
//
	SQL1 = new String(SQLstart+SQLmiddle+SQLend).toString();
	try {
		RS = Conn.Execute(SQL1);
	}
	catch(e) {
		resultObj.result = false;
		resultObj.errno = (e.number & 0xFFFF);
		resultObj.description += e.description;
		resultObj.sql = new String(SQLstart+SQLmiddle+SQLend).toString();
	}
	return(resultObj);
}
// ================================================================
function printGroup(groupobj)
{
	// Establish local variables
		var sReport = new String("").toString();
		sReport += groupobj.group_id +"<br />";
		sReport += groupobj.description +"<br />";
   		sReport += groupobj.start_age +"<br />";
		sReport += groupobj.end_age +"<br />";
		sReport += groupobj.qualifier_text +"<br />";
		sReport += groupobj.prime_information +"<br />";
		sReport += groupobj.secondary_information +"<br />";
		sReport += groupobj.display_order +"<br />";

	return(sReport);
}
// ================================================================
// COACHING SCHEDULES
// ================================================================
function getSchedule(scheduleid)
{
	// Establish local variables
	var theschedule = new Object();
	var sSchedule = new String(scheduleid);
	var RS, RS2, Conn, SQL1, SQL2, dbconnect;
	var mDateObj = new Date();
	var dummy1;
	//
	theschedule.schedule_id = new String(sSchedule).toString();
	//
	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	// 
	SQL1 = new String("SELECT * from coaching_schedules where schedule_id = " + sSchedule);
	RS = Conn.Execute(SQL1);
	// Retrieve database values for coaching schedule
	while (! RS.EOF)
	{
		theschedule.schedule_id = Trim(new String(RS("schedule_id")).toString());
		theschedule.schedule_role = Trim(new String(RS("schedule_role")).toString());
   		theschedule.break_text= Trim(new String(RS("break_text")).toString());
		theschedule.fees_hour= Trim(new String(RS("fees_hour")).toString());
		theschedule.fees_45mins = Trim(new String(RS("fees_45mins")).toString());
		theschedule.fees_30mins= Trim(new String(RS("fees_30mins")).toString());
		// now the date bits of the schedule record
		// First, start_date
		mDateObj=new Date(RS("start_date"));
		dummy1 = mDateObj.valueOf();
		if (dummy1 == 0) // no date in database
			theschedule.start_date = "";
		else
			theschedule.start_date = ddmmyyyy(mDateObj);
		// Second, end_date
		mDateObj=new Date(RS("end_date"));
		dummy1 = mDateObj.valueOf();
		if (dummy1 == 0) // no date in database
			theschedule.end_date = "";
		else
			theschedule.end_date = ddmmyyyy(mDateObj);
		// Third, break_start
		mDateObj=new Date(RS("break_start"));
		dummy1 = mDateObj.valueOf();
		if (dummy1 == 0) // no date in database
			theschedule.break_start = "";
		else
			theschedule.break_start = ddmmyyyy(mDateObj);
		// Fourth, break_end
		mDateObj=new Date(RS("break_end"));
		dummy1 = mDateObj.valueOf();
		if (dummy1 == 0) // no date in database
			theschedule.break_end = "";
		else
			theschedule.break_end = ddmmyyyy(mDateObj);
		// End of date bits
		RS.MoveNext();
	}
	if (theschedule.schedule_role=="null" || theschedule.schedule_role=="undefined")
		theschedule.schedule_role="";
	if (theschedule.break_text=="null" || theschedule.break_text=="undefined")
		theschedule.break_text="";
	if (theschedule.fees_hour=="null" || theschedule.fees_hour=="undefined")
		theschedule.fees_hour="";
	if (theschedule.fees_45mins=="null" || theschedule.fees_45mins=="undefined")
		theschedule.fees_45mins="";
	if (theschedule.fees_30mins=="null" || theschedule.fees_30mins=="undefined")
		theschedule.fees_30mins="";
	
	return(theschedule);
}
/*
// ================================================================
function setSchedule(scheduleobj)
{
	// Establish local variables
	var sSchedule = new String(scheduleobj.schedule_id);
	var RS, RS2, Conn, SQL1, SQL2, dbconnect;
	var mDateObj, dummy1;
	var resultObj = new Object();
	var e;
	//
	resultObj.result = true;
	resultObj.errno = 0;
	resultObj.description = new String("").toString();
	//
	if (scheduleobj.schedule_role=="null" || scheduleobj.schedule_role =="undefined")
		scheduleobj.schedule_role="";
	if (scheduleobj.break_text=="null" || scheduleobj.break_text =="undefined")
		scheduleobj.break_text="";
	if (scheduleobj.fees_hour=="null" || scheduleobj.fees_hour =="undefined")
		scheduleobj.fees_hour="";
	if (scheduleobj.fees_45mins=="null" || scheduleobj.fees_45mins =="undefined")
		scheduleobj.fees_45mins="";
	if (scheduleobj.fees_30mins=="null" || scheduleobj.fees_30mins =="undefined")
		scheduleobj.fees_30mins="";
	
	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	SQLstart = new String("UPDATE coaching_schedules ")
	SQLend = new String(" WHERE schedule_id="+scheduleobj.schedule_id).toString();
	SQLmiddle = new String("SET ").toString();
	SQLmiddle += " schedule_id='"+scheduleobj.id+"',";
	SQLmiddle += " schedule_role='"+scheduleobj.schedule_role+"',";
	SQLmiddle += " break_text='"+scheduleobj.break_text+"',";
	SQLmiddle += " fees_hour='"+scheduleobj.fees_hour+"',";
	SQLmiddle += " fees_45mins='"+scheduleobj.fees_45mins+"',";
	SQLmiddle += " fees_30mins='"+scheduleobj.fees_30mins+"' ";
//
	SQL1 = new String(SQLstart+SQLmiddle+SQLend).toString();
	try {
		RS = Conn.Execute(SQL1);
	}
	catch(e) {
		resultObj.result = false;
		resultObj.errno = (e.number & 0xFFFF);
		resultObj.description += e.description;
		resultObj.sql = new String(SQLstart+SQLmiddle+SQLend).toString();
	}
	return(resultObj);
}
*/
// ================================================================
function printSchedule(scheduleobj)
{
	// Establish local variables
		var sReport = new String("").toString();
		sReport += scheduleobj.schedule_id +"<br />";
		sReport += scheduleobj.schedule_role +"<br />";
   		sReport += scheduleobj.break_text +"<br />";
		sReport += scheduleobj.fees_hour +"<br />";
		sReport += scheduleobj.fees_45mins +"<br />";
		sReport += scheduleobj.fees_30mins +"<br />";

	return(sReport);
}
// ================================================================
// COACHING LESSONS 
// ================================================================
function getLesson(lessonid)
{
	// Establish local variables
	var thelesson = new Object();
	var sLesson = new String(lessonid);
	var RS, RS2, Conn, SQL1, SQL2, dbconnect;
	//
	thelesson.lesson_id = new String(sLesson).toString();
	//
	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	// 
	SQL1 = new String("SELECT * from coaching_lessons where lesson_id = " + sLesson);
	RS = Conn.Execute(SQL1);
	// Retrieve database values for member
	while (! RS.EOF)
	{
		thelesson.lesson_id = Trim(new String(RS("lesson_id")).toString());
		thelesson.schedule_role = Trim(new String(RS("schedule_role")).toString());
   		thelesson.group_id= Trim(new String(RS("group_id")).toString());
		thelesson.lesson_day= Trim(new String(RS("lesson_day")).toString());
		thelesson.lesson_text = Trim(new String(RS("lesson_text")).toString());
		thelesson.lesson_coach= Trim(new String(RS("lesson_coach")).toString());
		// now the date bits of the schedule record
		// First, start_time
		mTimeObj=new Time(RS("start_time"));
		dummy1 = mTimeObj.valueOf();
		if (dummy1 == 0) // no time in database
			thelesson.start_time = "";
		else
			thelesson.start_time = timeasstring(mTimeObj);
		// Second, end_time
		mTimeObj=new Time(RS("end_time"));
		dummy1 = mTimeObj.valueOf();
		if (dummy1 == 0) // no time in database
			thelesson.end_time = "";
		else
			thelesson.end_time = timeasstring(mTimeObj);

		RS.MoveNext();
	}
	if (thelesson.schedule_role=="null" || thelesson.schedule_role=="undefined")
		thelesson.schedule_role="";
	if (thelesson.group_id=="null" || thelesson.group_id=="undefined")
		thelesson.group_id="";
	if (thelesson.lesson_day=="null" || thelesson.lesson_day=="undefined")
		thelesson.lesson_day="";
	if (thelesson.lesson_text=="null" || thelesson.lesson_text=="undefined")
		thelesson.lesson_text="";
	if (thelesson.lesson_coach=="null" || thelesson.lesson_coach=="undefined")
		thelesson.lesson_coach="";
	
	return(thelesson);
}
// ================================================================
function setLesson(lessonobj)
{
	// Establish local variables
	var sLesson = new String(lessonobj.lesson_id);
	var RS, RS2, Conn, SQL1, SQL2, dbconnect;
	var mDateObj, dummy1;
	var resultObj = new Object();
	var e;
	//
	resultObj.result = true;
	resultObj.errno = 0;
	resultObj.description = new String("").toString();
	//
	if (lessonobj.schedule_role=="null" || lessonobj.schedule_role =="undefined")
		lessonobj.schedule_role="";
	if (lessonobj.group_id=="null" || lessonobj.group_id =="undefined")
		lessonobj.group_id="";
	if (lessonobj.lesson_text=="null" || lessonobj.lesson_text =="undefined")
		lessonobj.lesson_text="";
	if (lessonobj.lesson_day=="null" || lessonobj.lesson_day =="undefined")
		lessonobj.lesson_day="";
	if (lessonobj.lesson_coach=="null" || lessonobj.lesson_coach =="undefined")
		lessonobj.lesson_coach="";
	
	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	SQLstart = new String("UPDATE coaching_lessons ")
	SQLend = new String(" WHERE lesson_id="+lessonobj.lesson_id).toString();
	SQLmiddle = new String("SET ").toString();
	SQLmiddle += " lesson_id='"+lessonobj.id+"',";
	SQLmiddle += " schedule_role='"+lessonobj.schedule_role+"',";
	SQLmiddle += " group_id='"+lessonobj.group_id+"',";
	SQLmiddle += " end_age='"+lessonobj.end_age+"',";
	SQLmiddle += " lesson_text='"+lessonobj.lesson_text+"',";
	SQLmiddle += " lesson_day='"+lessonobj.lesson_day+"',";
	SQLmiddle += " lesson_coach='"+lessonobj.lesson_coach+"',";
//
	SQL1 = new String(SQLstart+SQLmiddle+SQLend).toString();
	try {
		RS = Conn.Execute(SQL1);
	}
	catch(e) {
		resultObj.result = false;
		resultObj.errno = (e.number & 0xFFFF);
		resultObj.description += e.description;
		resultObj.sql = new String(SQLstart+SQLmiddle+SQLend).toString();
	}
	return(resultObj);
}
// ================================================================
function printLesson(lessonobj)
{
	// Establish local variables
		var sReport = new String("").toString();
		sReport += lessonobj.lesson_id +"<br />";
		sReport += lessonobj.schedule_role +"<br />";
   		sReport += lessonobj.group_id +"<br />";
		sReport += lessonobj.lesson_day +"<br />";
		sReport += lessonobj.lesson_text +"<br />";
		sReport += lessonobj.lesson_coach +"<br />";
		sReport += lessonobj.start_time +"<br />";
		sReport += lessonobj.end_time +"<br />";

	return(sReport);
}
// ================================================================
</script>