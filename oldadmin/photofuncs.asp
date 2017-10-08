<script language="JScript" CODEPAGE="65001" runat=Server>
//
//  setPhoto( photoobj)                                                 returns boolean
//  getPhotoByID( photoidid)                                      returns photo object
//  setGallery( galleryobj)                                           returns boolean
//  getGalleryByID( galleryid)                                    returns gallery object
//
function setPhoto(photoobj)
{
	// Establish local variables
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var ophoto = new Object();
	var mDateObj, dummy1;
	// Initialise the news object
	ophoto.photoid = photoobj.photoid;
	ophoto.topcaption = new String(photoobj.topcaption).toString();
	ophoto.bottomcaption = new String(photoobj.bottomcaption).toString();
	ophoto.altcaption = new String(photoobj.altcaption).toString();
	ophoto.submittedby = new String(photoobj.submittedby).toString();
	ophoto.takenon = new String(photoobj.takenon).toString();
	ophoto.mainphoto = new String(photoobj.mainphoto).toString();
	ophoto.thumbnail = new String(photoobj.thumbnail).toString();
	// Set up database connection
	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	SQL1 = new String("UPDATE photos SET topcaption='"+ophoto.topcaption+"',bottomcaption='"+ophoto.bottomcaption+"',altcaption='"+ophoto.altcaption+"',submittedby='"+ophoto.submittedby+"',takenon='"+ophoto.takenon+"'").toString();
	SQL1 += ",mainphoto='"+ophoto.mainphoto+"', thumbnail='"+ophoto.thumbnail+"' where photoid = "+ophoto.photoid;
	RS = Conn.Execute(SQL1);
	RS.Close();
	Conn.Close();
	return (true);
}
//=======================================================================================================
function getPhotoByID(photoid)
{
	// Establish local variables
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var localid = photoid;
	var ophoto = new Object();
	var mDateObj, dummy1;
	// Initialise the news object
	ophoto.photoid = localid;
	ophoto.mainphoto = new String("").toString();
	ophoto.thumbnail = new String("").toString();
	ophoto.bottomcaption = new String("").toString();
	ophoto.topcaption = new String("").toString();
	ophoto.altcaption = new String("").toString();
	ophoto.takenon = new String("").toString();
	ophoto.submittedby = new String("").toString();
	// Set up database connection
	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	SQL1 = new String("SELECT * from photos where photoid = "+localid).toString();
	RS = Conn.Execute(SQL1);
	if (! RS.EOF)
	{
		ophoto.mainphoto = new String(RS("mainphoto")).toString();
		ophoto.thumbnail = new String(RS("thumbnail")).toString();
		ophoto.bottomcaption = new String(RS("bottomcaption")).toString();
		ophoto.topcaption = new String(RS("topcaption")).toString();
		ophoto.altcaption = new String(RS("altcaption")).toString();
		mDateObj=new Date(RS("takenon"));
		dummy1 = mDateObj.valueOf();
		if (dummy1 == 0) // no date in database
			ophoto.takenon = new String("").toString();
		else
			ophoto.takenon = new String(ddmmyyyy(mDateObj)).toString();
		ophoto.submittedby = new String(RS("submittedby")).toString();
		// now deal with nulls
		if (ophoto.topcaption == "null" || ophoto.topcaption == "undefined")
			ophoto.topcaption = new String("").toString();
		if (ophoto.bottomcaption == "null" || ophoto.bottomcaption == "undefined")
			ophoto.bottomcaption = new String("").toString();
		if (ophoto.altcaption == "null" || ophoto.altcaption == "undefined")
			ophoto.altcaption = new String("").toString();
		if (ophoto.submittedby == "null" || ophoto.submittedby == "undefined")
			ophoto.submittedby = new String("").toString();
		if (ophoto.mainphoto == "null" || ophoto.mainphoto == "undefined")
			ophoto.mainphoto = new String("").toString();
		if (ophoto.thumbnail == "null" || ophoto.thumbnail == "undefined")
			ophoto.thumbnail = new String("").toString();
	}
	RS.Close();
	Conn.Close();
	return (ophoto);
}
//=======================================================================================================
function setGallery(galleryobj)
{
	// Establish local variables
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var ogallery = new Object();
	// Initialise the news object
	ogallery.photoid = galleryobj.photoid;
	ogallery.galleryname = new String(galleryobj.galleryname).toString();
	ogallery.gallerythumbnail = new String(galleryobj.gallerythumbnail).toString();
	// Set up database connection
	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	SQL1 = new String("UPDATE gallerylist SET galleryname='"+ogallery.galleryname+"',gallerythumbnail='"+ogallery.gallerythumbnail+"' where galleryid = "+ogallery.galleryid).toString();
	RS = Conn.Execute(SQL1);
	RS.Close();
	Conn.Close();
	return (true);
}
//=======================================================================================================
function getGalleryByID(galleryid)
{
	// Establish local variables
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var localid = galleryid;
	var ogallery = new Object();
	// Initialise the news object
	ogallery.galleryid = localid;
	ogallery.galleryname = new String("").toString();
	ogallery.gallerythumbnail = new String("").toString();
	// Set up database connection
	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	SQL1 = new String("SELECT * from gallerylist where galleryid = "+localid).toString();
	RS = Conn.Execute(SQL1);
	if (! RS.EOF)
	{
		ogallery.galleryname = new String(RS("galleryname")).toString();
		ogallery.gallerythumbnail = new String(RS("gallerythumbnail")).toString();
		// now deal with nulls
		if (ogallery.galleryname == "null" || ogallery.galleryname == "undefined")
			ogallery.galleryname = new String("").toString();
		if (ogallery.gallerythumbnail == "null" || ogallery.gallerythumbnail == "undefined")
			ogallery.gallerythumbnail = new String("").toString();
	}
	RS.Close();
	Conn.Close();
	return (ogallery);
}

</script>
