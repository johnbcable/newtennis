<script language="JScript" CODEPAGE="65001" runat=Server>
// List of function prototypes
//
// isSquadOwner(squadid)
// mySquadID
// getSquad(squadid)
//==================================================
function isSquadOwner(thesquad) {
var zz, result, sowner;
var dbconnect=Application("hamptonsportsdb");
var connobj, RZ, SQL1;
zz=getUserCode();
sowner = new String("-1").toString();
// Response.Write("Inside isSquadOwner: sowner=["+sowner+"], zz = ["+zz+"], thesquad = ["+thesquad+"]");
// Response.End();
result=false;
SQL1=new String("select squadowner from squads where squadid = "+thesquad).toString();
connobj=Server.CreateObject("ADODB.Connection");
RZ=Server.CreateObject("ADODB.Recordset");
connobj.Open(dbconnect);
RZ=connobj.Execute(SQL1);
while(! RZ.EOF)
{
	sowner=new String(RZ("squadowner"));
	RZ.MoveNext();
}
RZ.Close();
RZ=null;
connobj.Close();
connobj=null;
// Response.Write("Inside isSquadOwner: sowner=["+sowner+"], zz = ["+zz+"], thesquad = ["+thesquad+"]");
if (zz == sowner)
	result=true;
return(result);
}
//==================================================
function mySquadID() {
var zz, result, sid;
var dbconnect=Application("hamptonsportsdb");
var connobj, RZ, SQL1;
zz=getUserCode();
sid = new String("-1").toString();
// Response.Write("Inside mySquadID: sid=["+sid+"], zz = ["+zz+"]");
// Response.End();
SQL1=new String("select squadid from squads where squadowner = "+zz).toString();
connobj=Server.CreateObject("ADODB.Connection");
RZ=Server.CreateObject("ADODB.Recordset");
connobj.Open(dbconnect);
RZ=connobj.Execute(SQL1);
while(! RZ.EOF)
{
	sid=new String(RZ("squadid"));
	RZ.MoveNext();
}
RZ.Close();
RZ=null;
connobj.Close();
connobj=null;
// Response.Write("Inside mySquadID: sid=["+sid+"], zz = ["+zz+"]");
return(sid);
}
//==================================================
function getSquad(thesquad) {
var zz, result, sid;
var dbconnect=Application("hamptonsportsdb");
var retsquad = new Object();
var connobj, RZ, SQL1;
retsquad.squadid = thesquad;
SQL1=new String("select * from squads where squadid = "+thesquad).toString();
connobj=Server.CreateObject("ADODB.Connection");
RZ=Server.CreateObject("ADODB.Recordset");
connobj.Open(dbconnect);
RZ=connobj.Execute(SQL1);
if(! RZ.EOF)
{
	retsquad.squadname=new String(RZ("squadname"));
	retsquad.gender=new String(RZ("gender"));
	retsquad.squadowner=new String(RZ("squadowner"));
	RZ.MoveNext();
}
else
{
	retsquad.squadid = new String("-1").toString();
}
RZ.Close();
RZ=null;
connobj.Close();
connobj=null;
// Response.Write("Inside mySquadID: sid=["+sid+"], zz = ["+zz+"]");
return(retsquad);
}
</script>
