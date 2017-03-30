<script language="JScript" CODEPAGE="65001" runat=Server>
//
//  getQuickMessageByPost(postid)             		returns QM Object
//  printQuickMessage(qmObj)						returns HTML string
//

// ================================================================
function getQuickMessageByPost(wp_postid)
{
	// Establish local variables
	var qmobj = new Object();
	var sPost = new String(wp_postid).toString();
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var mDateObj, dummy1, dummy2;
	//
	qmobj.subject = new String("").toString();
	qmobj.circulation = new String("").toString();
	qmobj.sent_on = new String("").toString();
	qmobj.messagetext = new String("").toString();
	qmobj.sender = new String("").toString();
	qmobj.postid = new String(sPost).toString();
	qmobj.number_sent = 0;
	qmobj.messageid = 0;
	//
	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	// Need to query particular email database entry from fileref
	SQL1 = new String("SELECT messageid,subject,circulation,sent_on,number_sent,messagetext,sender FROM quickmessages WHERE postid = '"+sPost+"'").toString();
	RS = Conn.Execute(SQL1);
	if (! RS.EOF)
	{
		qmobj.messageid = new Number(RS("messageid"));
		qmobj.subject = new String(RS("subject")).toString();
		qmobj.circulation = new String(RS("circulation")).toString();
		qmobj.sent_on = new String(RS("sent_on")).toString();
		qmobj.messagetext = new String(RS("messagetext")).toString();
		qmobj.sender = new String(RS("sender")).toString();
		qmobj.number_sent = new Number(RS("number_sent"));
		if (qmobj.subject == "undefined" || qmobj.subject == "null" )
			qmobj.subject = new String("");
		if (qmobj.circulation == "undefined" || qmobj.circulation == "null" )
			qmobj.circulation = new String("");
		if (qmobj.sent_on == "undefined" || qmobj.sent_on == "null" )
			qmobj.sent_on = new String("");
		if (qmobj.messagetext == "undefined" || qmobj.messagetext == "null" )
			qmobj.messagetext = new String("");
		if (qmobj.sender == "undefined" || qmobj.sender == "null" )
			qmobj.sender = new String("");
	}
	return(qmobj);
}

// ================================================================
function printQuickMessage(qmobj)
{
	// Establish local variables
	var sReport = new String("").toString();
		sReport += qmobj.messageid +"<br />";
		sReport += qmobj.subject +"<br />";
   		sReport += qmobj.circulation +"<br />";
		sReport += qmobj.sent_on +"<br />";
		sReport += qmobj.messagetext +"<br />";
		sReport += qmobj.sender +"<br />";
		sReport += qmobj.number_sent +"<br />";
	return(sReport);
}
// ================================================================
</script>

