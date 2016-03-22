<script language="JScript" CODEPAGE="65001" runat=Server>
//
//  getMember(memberid)           returns member Object
//  setMember(memberObject)		  returns result Object
//  printMember(memberObject)	  returns string 
//  deleteMember(memberid)        returns result Object 
//
// ================================================================
function getMember(memberid)
{
	// Establish local variable
	var themember = new Object();
	var sMember = new String(memberid);
	var RS, RS2, Conn, SQL1, SQL2, uniqref;
	var mDateObj, dummy1;
	var mDob;
	//
	themember.memberid = new String(sMember).toString();
	//
	var dbconnect=Application("hamptonsportsdb"); 
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	// 
	SQL1 = new String("SELECT * from members where uniqueref = " + sMember);
	RS = Conn.Execute(SQL1);
	// Retrieve database values for member
	mDob = new String("").toString();
	themember.uniqueref = sMember;
	while (! RS.EOF)
	{
		themember.id = Trim(new String(RS("memberid")).toString());
		themember.grade = Trim(new String(RS("membergrade")).toString());
 		themember.surname= Trim(new String(RS("surname")).toString());
		themember.forename1= Trim(new String(RS("forename1")).toString());
		themember.gender = Trim(new String(RS("gender")).toString());
		themember.address1= Trim(new String(RS("address1")).toString());
		themember.address2= Trim(new String(RS("address2")).toString());
		themember.address3= Trim(new String(RS("address3")).toString());
		themember.address4= Trim(new String(RS("address4")).toString());
		themember.postcode= Trim(new String(RS("postcode")).toString());
		themember.homephone= Trim(new String(RS("homephone")).toString());
		themember.mobile= Trim(new String(RS("mobilephone")).toString());
		themember.email= Trim(new String(RS("email")).toString());
		themember.webpassword = Trim(new String(RS("webpassword")).toString());
		themember.britishtennisno = Trim(new String(RS("britishtennisno")).toString());
		themember.emergencyname = Trim(new String(RS("emergencyname")).toString());
		themember.emergencyphone = Trim(new String(RS("emergencyphone")).toString());
		themember.medicalinfo = Trim(new String(RS("medicalinfo")).toString());
		themember.photoconsent = Trim(new String(RS("photoconsent")).toString());
		themember.paid = StringFromDB(new String(RS("paid")));
		themember.mailing = Trim(new String(RS("mailing")).toString());
		themember.onlinebookingid = Trim(new String(RS("onlinebookingid")).toString());
		themember.onlinebookingpin = Trim(new String(RS("onlinebookingpin")).toString());
		themember.wimbledonweekday = Trim(new String(RS("wimbledonweekday")).toString());
		themember.wimbledonweekend = Trim(new String(RS("wimbledonweekend")).toString());
		themember.singles = Trim(new String(RS("singles")).toString());
		themember.doubles = Trim(new String(RS("doubles")).toString());
		themember.mixeddoubles = Trim(new String(RS("mixeddoubles")).toString());
		themember.mixedplate = Trim(new String(RS("mixedplate")).toString());
		themember.vets40plus = Trim(new String(RS("vets40plus")).toString());
		themember.vets50plus = Trim(new String(RS("vets50plus")).toString());
		themember.vets60plus = Trim(new String(RS("vets60plus")).toString());
		themember.doublespartner = Trim(new String(RS("doublespartner")).toString());
		themember.mixedpartner = Trim(new String(RS("mixedpartner")).toString());
		themember.summerfinalsday = Trim(new String(RS("summerfinalsday")).toString());
		themember.autumnfinalsday = Trim(new String(RS("autumnfinalsday")).toString());
		themember.teamhelp = Trim(new String(RS("teamhelp")).toString());
		themember.socialhelp = Trim(new String(RS("socialhelp")).toString());
		themember.adminhelp = Trim(new String(RS("adminhelp")).toString());
		themember.arden9help = Trim(new String(RS("arden9help")).toString());
		themember.detailscorrect = Trim(new String(RS("detailscorrect")).toString());
		themember.vets40pluspartner = Trim(new String(RS("vets40pluspartner")).toString());
		themember.vets50pluspartner = Trim(new String(RS("vets50pluspartner")).toString());
		themember.vets60pluspartner = Trim(new String(RS("vets60pluspartner")).toString());
		themember.teamhelptext = Trim(new String(RS("teamhelptext")).toString());
		themember.socialhelptext = Trim(new String(RS("socialhelptext")).toString());
		themember.adminhelptext = Trim(new String(RS("adminhelptext")).toString());
		themember.singlesboxleague = Trim(new String(RS("singlesboxleague")).toString());
		themember.doublesboxleague = Trim(new String(RS("doublesboxleague")).toString());

		dummy=new Number(RS("webaccess")).valueOf();
		themember.webaccess=dummy.valueOf();
		// now the date bits of the member record
		// First, date of birth
		mDateObj=new Date(RS("dob"));
		dummy1 = mDateObj.valueOf();
		if (dummy1 == 0) // no date in database
			themember.dob = "";
		else
			themember.dob = ddmmyyyy(mDateObj);
		// Second, joining date
		mDateObj=new Date(RS("joined"));
		dummy1 = mDateObj.valueOf();
		if (dummy1 == 0) // no date in database
			themember.joined = "";
		else
			themember.joined = ddmmyyyy(mDateObj);
		// Third, date of leaving the club
		mDateObj=new Date(RS("dateleft"));
		dummy1 = mDateObj.valueOf();
		if (dummy1 == 0) // no date in database
			themember.left = "";
		else
			themember.left = ddmmyyyy(mDateObj);
		// Fourth, date details last confirmed correct
		mDateObj=new Date(RS("detailscorrectdate"));
		dummy1 = mDateObj.valueOf();
		if (dummy1 == 0) // no date in database
			themember.detailscorrectdate = "";
		else
			themember.detailscorrectdate = ddmmyyyy(mDateObj);
		// End of date bits
		RS.MoveNext();
	}
	if (themember.grade=="null" || themember.grade=="undefined")
		themember.grade="";
	if (themember.surname=="null" || themember.surname=="undefined")
		themember.surname="";
	if (themember.forename1=="null" || themember.forename1=="undefined")
		themember.forename1="";
	// if (themember.initials=="null" || themember.initials=="undef")
	//	themember.initials="";
	if (themember.address1=="null" || themember.address1=="undefined")
		themember.address1="";
	if (themember.address2=="null" || themember.address2=="undefined")
		themember.address2="";
	if (themember.address3=="null" || themember.address3=="undefined")
		themember.address3="";
	if (themember.address4=="null" || themember.address4=="undefined")
		themember.address4="";
	if (themember.postcode=="null" || themember.postcode=="undefined")
		themember.postcode="";
	if (themember.homephone=="null" || themember.homephone=="undefined")
		themember.homephone="";
	if (themember.mobile=="null" || themember.mobile=="undefined")
		themember.mobile="";
	if (themember.email=="null" || themember.email=="undefined")
		themember.email="";
	if (themember.webpassword=="null" || themember.webpassword=="undefined")
		themember.webpassword="tennis";
	if (themember.britishtennisno == "null" || themember.britishtennisno=="undefined")
		themember.britishtennisno = "";
	if (themember.emergencyname == "null" || themember.emergencyname=="undefined")
		themember.emergencyname = "";
	if (themember.emergencyphone == "null" || themember.emergencyphone == "undefined" )
		themember.emergencyphone = "";
	if (themember.medicalinfo == "null" || themember.medicalinfo == "undefined" )
		themember.medicalinfo = "";
	if (themember.photoconsent == "null" || themember.photoconsent == "undefined" || themember.photoconsent == "")
		themember.photoconsent = new String("N").toString();
	if (themember.paid == "null" || themember.paid == "undefined" || themember.paid == "")
		themember.paid = new String("N").toString();
	if (themember.webaccess < 20)
		themember.webaccess = 20;
	if (themember.mailing=="null" || themember.mailing=="" || themember.mailing=="undefined")
			themember.mailing = "N";	
	if (themember.onlinebookingid=="null" || themember.onlinebookingid=="")
	{
	 	  dummy1 = new Number(memberid)+5000;
			themember.onlinebookingid = new String(dummy1).toString();	
	}
	if (themember.onlinebookingpin=="null" || themember.onlinebookingpin=="" || themember.onlinebookingpin=="undefined")
			themember.onlinebookingpin = new String("").toString();	
	if (themember.gender=="null" || themember.gender=="" || themember.gender=="undefined")
			themember.gender = "";	

	// Now for the preferences area

	// Wimbledon ticket draw
	if (themember.wimbledonweekday=="null" || themember.wimbledonweekday=="undefined")
		themember.wimbledonweekday="N";
	if (themember.wimbledonweekend=="null" || themember.wimbledonweekend=="undefined")
		themember.wimbledonweekend="N";
	
	// Tournament entry preferences
	if (themember.singles=="null" || themember.singles=="undefined")
		themember.singles="N";
	if (themember.doubles=="null" || themember.doubles=="undefined")
		themember.doubles="N";
	if (themember.mixeddoubles=="null" || themember.mixeddoubles=="undefined")
		themember.mixeddoubles="N";
	if (themember.mixedplate=="null" || themember.mixedplate=="undefined")
		themember.mixedplate="N";
	if (themember.vets40plus=="null" || themember.vets40plus=="undefined")
		themember.vets40plus="N";
	if (themember.vets50plus=="null" || themember.vets50plus=="undefined")
		themember.vets50plus="N";
	if (themember.vets60plus=="null" || themember.vets60plus=="undefined")
		themember.vets60plus="N";
	if (themember.summerfinalsday=="null" || themember.summerfinalsday=="undefined")
		themember.summerfinalsday="N";
	if (themember.autumnfinalsday=="null" || themember.autumnfinalsday=="undefined")
		themember.autumnfinalsday="N";
	if (themember.doublespartner=="null" || themember.doublespartner=="undefined")
		themember.doublespartner="Not specified";
	if (themember.mixedpartner=="null" || themember.mixedpartner=="undefined")
		themember.mixedpartner="Not specified";
	if (themember.vets40pluspartner=="null" || themember.vets40pluspartner=="undefined")
		themember.vets40pluspartner="Not specified";
	if (themember.vets50pluspartner=="null" || themember.vets50pluspartner=="undefined")
		themember.vets50pluspartner="Not specified";
	if (themember.vets60pluspartner=="null" || themember.vets60pluspartner=="undefined")
		themember.vets60pluspartner="Not specified";
	
	// Help run the club
	if (themember.teamhelp=="null" || themember.teamhelp=="undefined")
		themember.teamhelp="N";
	if (themember.socialhelp=="null" || themember.socialhelp=="undefined")
		themember.socialhelp="N";
	if (themember.adminhelp=="null" || themember.adminhelp=="undefined")
		themember.adminhelp="N";
	if (themember.arden9help=="null" || themember.arden9help=="undefined")
		themember.arden9help="N";
	if (themember.teamhelptext=="null" || themember.teamhelptext=="undefined")
		themember.teamhelptext="";
	if (themember.socialhelptext=="null" || themember.socialhelptext=="undefined")
		themember.socialhelptext="";
	if (themember.adminhelptext=="null" || themember.adminhelptext=="undefined")
		themember.adminhelptext="Not specified";

	if (themember.singlesboxleague=="null" || themember.singlesboxleague=="undefined")
		themember.singlesboxleague="N";
	if (themember.doublesboxleague=="null" || themember.doublesboxleague=="undefined")
		themember.doublesboxleague="N";

	return(themember);
}
// ================================================================
function setMember(memberobj)
{
	// Establish local variables
	var sMember = new String(memberobj.memberid);
	var RS, RS2, Conn, SQL1, SQL2, uniqref;
	var mDateObj, dummy1;
	var resultObj = new Object();
	var e;
	//
	resultObj.result = true;
	resultObj.errno = 0;
	resultObj.description = new String("").toString();
	//
	if (memberobj.grade=="null" || memberobj.grade =="undefined")
		memberobj.grade="";
	if (memberobj.surname=="null" || memberobj.surname =="undefined")
		memberobj.surname="";
	if (memberobj.forename1=="null" || memberobj.forename1 =="undefined")
		memberobj.forename1="";
	if (memberobj.address1=="null" || memberobj.address1 =="undefined")
		memberobj.address1="";
	if (memberobj.address2=="null" || memberobj.address2 =="undefined")
		memberobj.address2="";
	if (memberobj.address3=="null" || memberobj.address3 =="undefined")
		memberobj.address3="";
	if (memberobj.address4=="null" || memberobj.address4 =="undefined")
		memberobj.address4="";
	if (memberobj.postcode=="null" || memberobj.postcode =="undefined")
		memberobj.postcode="";
	if (memberobj.homephone=="null" || memberobj.homephone =="undefined")
		memberobj.homephone="";
	if (memberobj.mobile=="null" || memberobj.mobile =="undefined")
		memberobj.mobile="";
	if (memberobj.email=="null" || memberobj.email =="undefined")
		memberobj.email="";
	if (memberobj.webpassword=="null" || memberobj.webpassword =="undefined")
		memberobj.webpassword="tennis";
	if (memberobj.britishtennisno == "null" || memberobj.britishtennisno =="undefined")
		memberobj.britishtennisno = "";
	if (memberobj.emergencyname == "null" || memberobj.emergencyname =="undefined")
		memberobj.emergencyname = "";
	if (memberobj.emergencyphone == "null" || memberobj.emergencyphone =="undefined")
		memberobj.emergencyphone = "";
	if (memberobj.medicalinfo == "null" || memberobj.medicalinfo =="undefined")
		memberobj.medicalinfo = "";
	if (memberobj.photoconsent == "null" || memberobj.photoconsent == "undefined" || memberobj.photoconsent == "")
		memberobj.photoconsent = "N";
	if (memberobj.paid == "null" || memberobj.paid == "undefined" || memberobj.paid == "")
		memberobj.paid = "N";
	if (memberobj.onlinebookingid=="null" || memberobj.onlinebookingid=="" || memberobj.onlinebookingid=="undefined")
	{
		if (memberobj.grade == "Adult" || memberobj.grade == "18-25s" || memberobj.grade == "Junior")  
			 memberobj.onlinebookingid = new String(new Number(memberobj.uniqueref)+5000).toString();
		else
			 memberobj.onlinebookingid = new String("0").toString();
	}
	if (memberobj.onlinebookingpin=="null" || memberobj.onlinebookingpin=="" || memberobj.onlinebookingpin=="undefined")
			memberobj.onlinebookingpin = new String("").toString();
	if (memberobj.webaccess < 20)
		memberobj.webaccess = 20;
	if (memberobj.mailing=="null" || memberobj.mailing =="undefined" || memberobj.mailing=="")
			memberobj.mailing = "N";	
	if (memberobj.dob=="null" || memberobj.dob =="undefined")
			memberobj.dob = "";	
	if (memberobj.left=="null" || memberobj.left =="undefined")
			memberobj.left = "";	
	if (memberobj.joined=="null" || memberobj.joined =="undefined")
			memberobj.joined = "";	
	if (memberobj.gender=="null" || memberobj.gender =="undefined" || memberobj.gender=="")
			memberobj.gender = "";	

	// Now for the preferences area

	// Wimbledon ticket draw
	if (memberobj.wimbledonweekday=="null" || memberobj.wimbledonweekday=="undefined")
		memberobj.wimbledonweekday="N";
	if (memberobj.wimbledonweekend=="null" || memberobj.wimbledonweekend=="undefined")
		memberobj.wimbledonweekend="N";
	
	// Tournament entry preferences
	if (memberobj.singles=="null" || memberobj.singles=="undefined")
		memberobj.singles="N";
	if (memberobj.doubles=="null" || memberobj.doubles=="undefined")
		memberobj.doubles="N";
	if (memberobj.mixeddoubles=="null" || memberobj.mixeddoubles=="undefined")
		memberobj.mixeddoubles="N";
	if (memberobj.mixedplate=="null" || memberobj.mixedplate=="undefined")
		memberobj.mixedplate="N";
	if (memberobj.vets40plus=="null" || memberobj.vets40plus=="undefined")
		memberobj.vets40plus="N";
	if (memberobj.vets50plus=="null" || memberobj.vets50plus=="undefined")
		memberobj.vets50plus="N";
	if (memberobj.vets60plus=="null" || memberobj.vets60plus=="undefined")
		memberobj.vets60plus="N";
	if (memberobj.summerfinalsday=="null" || memberobj.summerfinalsday=="undefined")
		memberobj.summerfinalsday="N";
	if (memberobj.autumnfinalsday=="null" || memberobj.autumnfinalsday=="undefined")
		memberobj.autumnfinalsday="N";
	if (memberobj.doublespartner=="null" || memberobj.doublespartner=="undefined")
		memberobj.doublespartner="Not specified";
	if (memberobj.mixedpartner=="null" || memberobj.mixedpartner=="undefined")
		memberobj.mixedpartner="Not specified";
	if (memberobj.vets40pluspartner=="null" || memberobj.vets40pluspartner=="undefined")
		memberobj.vets40pluspartner="Not specified";
	if (memberobj.vets50pluspartner=="null" || memberobj.vets50pluspartner=="undefined")
		memberobj.vets50pluspartner="Not specified";
	if (memberobj.vets60pluspartner=="null" || memberobj.vets60pluspartner=="undefined")
		memberobj.vets60pluspartner="Not specified";
	
	// Help run the club
	if (memberobj.teamhelp=="null" || memberobj.teamhelp=="undefined")
		memberobj.teamhelp="N";
	if (memberobj.socialhelp=="null" || memberobj.socialhelp=="undefined")
		memberobj.socialhelp="N";
	if (memberobj.adminhelp=="null" || memberobj.adminhelp=="undefined")
		memberobj.adminhelp="N";
	if (memberobj.arden9help=="null" || memberobj.arden9help=="undefined")
		memberobj.arden9help="N";
	if (memberobj.teamhelptext=="null" || memberobj.teamhelptext=="undefined")
		memberobj.teamhelptext="";
	if (memberobj.socialhelptext=="null" || memberobj.socialhelptext=="undefined")
		memberobj.socialhelptext="";
	if (memberobj.adminhelptext=="null" || memberobj.adminhelptext=="undefined")
		memberobj.adminhelptext="Not specified";

	if (memberobj.singlesboxleague=="null" || memberobj.singlesboxleague=="undefined")
		memberobj.singlesboxleague="N";
	if (memberobj.doublesboxleague=="null" || memberobj.doublesboxleague=="undefined")
		memberobj.doublesboxleague="N";


	
	var dbconnect=Application("hamptonsportsdb"); 
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	SQLstart = new String("UPDATE members ")
	SQLend = new String(" WHERE uniqueref="+memberobj.uniqueref).toString();
	SQLmiddle = new String("SET ").toString();
	SQLmiddle += " memberid='"+memberobj.id+"',";
	SQLmiddle += " membergrade='"+memberobj.grade+"',";
	SQLmiddle += " surname='"+memberobj.surname+"',";
	SQLmiddle += " forename1='"+memberobj.forename1+"',";
	SQLmiddle += " gender='"+memberobj.gender+"', ";
	SQLmiddle += " address1='"+memberobj.address1+"',";
	SQLmiddle += " address2='"+memberobj.address2+"',";
	SQLmiddle += " address3='"+memberobj.address3+"',";
	SQLmiddle += " address4='"+memberobj.address4+"',";
	SQLmiddle += " postcode='"+memberobj.postcode+"',";
	SQLmiddle += " homephone='"+memberobj.homephone+"',";
	SQLmiddle += " mobilephone='"+memberobj.mobile+"',";
	SQLmiddle += " email='"+memberobj.email+"',";
	SQLmiddle += " webpassword='"+memberobj.webpassword+"',";
	SQLmiddle += " britishtennisno='"+memberobj.britishtennisno+"',";
	SQLmiddle += " emergencyname='"+memberobj.emergencyname+"',";
	SQLmiddle += " emergencyphone='"+memberobj.emergencyphone+"',";
	SQLmiddle += " medicalinfo='"+memberobj.medicalinfo+"',";
	SQLmiddle += " photoconsent='"+memberobj.photoconsent+"',";
	SQLmiddle += " paid='"+memberobj.paid+"',";
	SQLmiddle += " webaccess="+memberobj.webaccess+",";
	if (memberobj.onlinebookingid != "0")
		 SQLmiddle += " onlinebookingid="+memberobj.onlinebookingid+", ";

	// Now do preferences data

	SQLmiddle +=" wimbledonweekday='"+memberobj.wimbledonweekday+"',"
	SQLmiddle +=" wimbledonweekend='"+memberobj.wimbledonweekend+"',"
	SQLmiddle +=" singles='"+memberobj.singles+"',"
	SQLmiddle +=" doubles='"+memberobj.doubles+"',"
	SQLmiddle +=" mixedplate='"+memberobj.mixedplate+"',"
	SQLmiddle +=" mixeddoubles='"+memberobj.mixeddoubles+"',"
	SQLmiddle +=" vets40plus='"+memberobj.vets40plus+"',"
	SQLmiddle +=" vets50plus='"+memberobj.vets50plus+"',"
	SQLmiddle +=" vets60plus='"+memberobj.vets60plus+"',"
	SQLmiddle +=" summerfinalsday='"+memberobj.summerfinalsday+"',"
	SQLmiddle +=" autumnfinalsday='"+memberobj.autumnfinalsday+"',"
	SQLmiddle +=" doublespartner='"+memberobj.doublespartner+"',"
	SQLmiddle +=" mixedpartner='"+memberobj.mixedpartner+"',"
	SQLmiddle +=" vets40pluspartner='"+memberobj.vets40pluspartner+"',"
	SQLmiddle +=" vets50pluspartner='"+memberobj.vets50pluspartner+"',"
	SQLmiddle +=" vets60pluspartner='"+memberobj.vets60pluspartner+"',"
	SQLmiddle +=" teamhelp='"+memberobj.teamhelp+"',"
	SQLmiddle +=" socialhelp='"+memberobj.socialhelp+"',"
	SQLmiddle +=" adminhelp='"+memberobj.adminhelp+"',"
	SQLmiddle +=" arden9help='"+memberobj.arden9help+"',"
	SQLmiddle +=" teamhelptext='"+memberobj.teamhelptext+"',"
	SQLmiddle +=" socialhelptext='"+memberobj.socialhelptext+"',"
	SQLmiddle +=" adminhelptext='"+memberobj.adminhelptext+"',"
	SQLmiddle +=" singlesboxleague='"+memberobj.singlesboxleague+"',"
	SQLmiddle +=" doublesboxleague='"+memberobj.doublesboxleague+"',"

	// Now do date fields. If null dont insert them as part of the update clause
	//  Access doesnt like setting date fields to ''
	if (! (memberobj.dob == ""))
		SQLmiddle += " dob='"+memberobj.dob+"',";
	else
		SQLmiddle += " dob=null,";
	if (! (memberobj.joined == ""))
		SQLmiddle += " joined='"+memberobj.joined+"',";
	else
		SQLmiddle += " joined=null,";
	if (! (memberobj.left == ""))
		SQLmiddle += " dateleft='"+memberobj.left+"',";
	else
		SQLmiddle += " dateleft=null,";
	SQLmiddle += " mailing='"+memberobj.mailing+"', ";

	// onlinebookingpin is the last column so no trailing comma	
	SQLmiddle += " onlinebookingpin='"+memberobj.onlinebookingpin+"' ";
	// SQLmiddle += " iscoach='"+memberobj.iscoach+"' ";
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
function printMember(memberobj)
{
	// Establish local variables
	var sReport = new String("").toString();
		sReport += memberobj.id +"<br />";
		sReport += memberobj.grade +"<br />";
   		sReport += memberobj.surname +"<br />";
		sReport += memberobj.forename1 +"<br />";
		sReport += memberobj.gender +"<br />";
		sReport += memberobj.address1 +"<br />";
		sReport += memberobj.address2 +"<br />";
		sReport += memberobj.address3 +"<br />";
		sReport += memberobj.address4 +"<br />";
		sReport += memberobj.postcode +"<br />";
		sReport += memberobj.homephone +"<br />";
		sReport += memberobj.mobile +"<br />";
		sReport += memberobj.email +"<br />";
		sReport += memberobj.webpassword +"<br />";
		sReport += memberobj.britishtennisno +"<br />";
		sReport += memberobj.emergencyname +"<br />";
		sReport += memberobj.emergencyphone +"<br />";
		sReport += memberobj.medicalinfo +"<br />";
		sReport += memberobj.photoconsent +"<br />";
		sReport += memberobj.dob +"<br />";
		sReport += memberobj.joined +"<br />";
		sReport += memberobj.left +"<br />";
		sReport += memberobj.mailing +"<br />";
		sReport += memberobj.paid +"<br />";
		sReport += memberobj.onlinebookingid +"<br />";
		sReport += memberobj.onlinebookingpin +"<br />";
		sReport += memberobj.wimbledonweekday +"<br />";
		sReport += memberobj.wimbledonweekdend +"<br />";
		sReport += memberobj.singles +"<br />";
		sReport += memberobj.doubles +"<br />";
		sReport += memberobj.mixeddoubles +"<br />";
		sReport += memberobj.mixedplate +"<br />";
		sReport += memberobj.doublespartner +"<br />";
		sReport += memberobj.mixedpartner +"<br />";
		sReport += memberobj.wimbledonweekday +"<br />";
		sReport += memberobj.vets40plus +"<br />";
		sReport += memberobj.vets40pluspartner +"<br />";
		sReport += memberobj.vets50plus +"<br />";
		sReport += memberobj.vets50pluspartner +"<br />";
		sReport += memberobj.vets60plus +"<br />";
		sReport += memberobj.vets60pluspartner +"<br />";
		sReport += memberobj.mixedpartner +"<br />";
		sReport += memberobj.wimbledonweekday +"<br />";
		sReport += memberobj.summerfinalsday +"<br />";
		sReport += memberobj.autumnfinalsday +"<br />";
		sReport += memberobj.teamhelp +"<br />";
		sReport += memberobj.teamhelptext +"<br />";
		sReport += memberobj.socialhelp +"<br />";
		sReport += memberobj.socialhelptext +"<br />";
		sReport += memberobj.adminhelp +"<br />";
		sReport += memberobj.adminhelptext +"<br />";
		sReport += memberobj.arden9help +"<br />";
		sReport += memberobj.detailscorrect +"<br />";
		sReport += memberobj.detailscorrectdate +"<br />";
		sReport += memberobj.singlesboxleague +"<br />";
		sReport += memberobj.doublesboxleague +"<br />";

	return(sReport);
}
// ================================================================
function deleteMember(memberid)
{
	// Establish local variables
	var sMember = new String(memberid);
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var mDateObj, dummy1;
	var resultObj = new Object();
	var memberObj = new Object();

	memberobj = getMember(memberid);
	SQL1 = new String("DELETE FROM members WHERE uniqueref = "+sMember).toString();
	SQL2 = new String("DELETE FROM coaches WHERE uniqueref = "+sMember).toString();
	dbconnect=Application("hamptonsportsdb"); 
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	
	resultObj.result = true;
	resultObj.errno = (0);
	resultObj.description += "Member deleted";
	resultObj.sql = new String(SQL1).toString();
	try {
		RS = Conn.Execute(SQL1);
	}
	catch(e) {
		resultObj.result = true;
		resultObj.errno = (e.number & 0xFFFF);
		resultObj.description += e.description;
		resultObj.sql = new String(SQL1).toString();
	}

	// Delete associated coach record if there
	if (resultObj.result) {
		resultObj.result = true;
		resultObj.errno = (0);
		resultObj.description += "Coach deleted";
		resultObj.sql = new String(SQL2).toString();
		try {
				RS = Conn.Execute(SQL2);
		}
		catch(e) {
				resultObj.result = true;
				resultObj.errno = (e.number & 0xFFFF);
				resultObj.description += e.description;
				resultObj.sql = new String(SQL2).toString();
		}
	
	}	

	// Write audit record
	if (resultObj.result) {
		// Confirm who has been deleted
		me = new String(getUserID()).toString();
		SQL3 = new String("INSERT INTO member_audits(memberid,action) VALUES('"+me+"','DELETE "+memberObj.forename1+" "+memberObj.surname+"')").toString();
		resultObj.result = true;
		resultObj.errno = (0);
		resultObj.description += "Member deleted";
		resultObj.sql = new String(SQL3).toString();
		try {
				RS = Conn.Execute(SQL3);
		}
		catch(e) {
				resultObj.result = true;
				resultObj.errno = (e.number & 0xFFFF);
				resultObj.description += e.description;
				resultObj.sql = new String(SQL3).toString();
		}
	
	}
	return(resultObj);

}
</script>