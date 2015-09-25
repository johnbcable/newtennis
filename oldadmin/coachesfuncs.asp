<script language="JScript" CODEPAGE="65001" runat=Server>
// List of function prototypes
//
// isCoach(uniqref)
// getCoach(uniqref)
//==================================================
function isCoach(uniqref) {
var zz, result, sowner;
var dbconnect=Application("hamptonsportsdb");
var connobj, RZ, SQL1;
zz=getUserCode();
sowner = new String("-1").toString();
// Response.Write("Inside isCoach: uniqref=["+uniqref+"]");
// Response.End();
result=false;
SQL1=new String("select count([uniqeref]) as kount from members where [uniqueref] = "+uniqref+" and [iscoach] = 'Y'").toString();
connobj=Server.CreateObject("ADODB.Connection");
RZ=Server.CreateObject("ADODB.Recordset");
connobj.Open(dbconnect);
RZ=connobj.Execute(SQL1);
result=false;
if(! RZ.EOF)
{
	if (kount == 1)
		result=true;
}
RZ.Close();
RZ=null;
connobj.Close();
connobj=null;
// Response.Write("Inside isSquadOwner: sowner=["+sowner+"], zz = ["+zz+"], thesquad = ["+thesquad+"]");
return(result);
}
//==================================================
function getCoach(uniqref) {
var zz, result, sid;
var dbconnect=Application("hamptonsportsdb");
var retcoach = new Object();
var connobj, RZ, SQL1;
retcoach.coachid = uniqref;
SQL1=new String("select * from members where [uniqueref] = "+uniqref).toString();
connobj=Server.CreateObject("ADODB.Connection");
RZ=Server.CreateObject("ADODB.Recordset");
connobj.Open(dbconnect);
RZ=connobj.Execute(SQL1);
if(! RZ.EOF)
{
	retcoach.squadname=new String(RZ("squadname"));
	retcoach.gender=new String(RZ("gender"));
	retcoach.squadowner=new String(RZ("squadowner"));
	RZ.MoveNext();
}
else
{
	retcoach.squadid = new String("-1").toString();
}
RZ.Close();
RZ=null;
connobj.Close();
connobj=null;
// Response.Write("Inside mySquadID: sid=["+sid+"], zz = ["+zz+"]");
return(retcoach);
}
</script>
