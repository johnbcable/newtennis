<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Deleting User Sessions");
// DB connection stuff
var zz, result;
var myusername, myaddress;
var thedate, thetime;
var dbconnect=Application("hamptonsportsdb");
var connobj, RS, SQL1, SQL2, SQL3;
var v_memberid;
var debugging = current_debug_status();
var theip;
if (! signedin())
	Response.Redirect("login.asp");
theip = new String(Request.QueryString("ip")).toString();
if (theip == "" || theip == "null" || theip == "undefined")
	Response.Redirect("lst_sessions.asp");
themode = new String(Request.QueryString("mode")).toString();
if (themode == "" || themode == "null" || themode == "undefined")
	Response.Redirect("lst_sessions.asp");
connobj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
connobj.Open(dbconnect);
SQL1=new String("update user_sessions set sessionmode='"+themode+"' where remoteaddress = '"+theip+"'").toString();
RS=connobj.Execute(SQL1);
RS=null;
connobj.Close();
connobj=null;
// End of page start up coding
if (! current_debug_status())
	Response.Redirect("lst_sessions.asp");
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
<%
if (debugging)
{
%>
		<table>
			<caption>Logout current_debug_status() info</caption>
			<thead>
				<tr>
					<th>Variable</th>
					<th>Value</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>theip</td>
					<td><%= theip %></td>
				</tr>
				<tr>
					<td>themode</td>
					<td><%= themode %></td>
				</tr>
				<tr>
					<td>SQL1</td>
					<td><%= SQL1 %></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						****    End of debug info    ****
					</td>
				</tr>
			</tfoot>
		</table>				
<%
}
else
{
Response.Redirect("oldwayin.asp");
}
%>
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
