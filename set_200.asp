<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("200 Club Administration");
// Now for any variables local to this page
var sNumber, sOwner, sStandingOrder, sOverdue;
var sSection, sNews;
var ConnObj;
var RS,RS2,RS3;
var SQLStmt, SQL2, SQL3;
var kount;
var memberknt;
var dbconnect=Application("hamptonsportsdb");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
if (! is200ClubEditor())
	Response.Redirect("services.asp");
// End of page start up coding
// Initialise update variables
sNumber=Trim(new String(Request.Form("thenumber")));
sOwner=Trim(new String(Request.Form("theowner")));
sStandingOrder=Trim(new String(Request.Form("standingorder")));
sOverdue=Trim(new String(Request.Form("overdue")));
if (sNumber=="undefined")
	Response.Redirect("services.asp"); // incorrect dialogue route
if (sOwner=="null" || sOwner=="")
    sOwner="NOBODY";
if (sStandingOrder=="undefined")
    sStandingOrder="N";
if (sOverdue=="undefined")
		sOverdue="N";
// Do DB update
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1="update 200club set ownersname='"+sOwner+"',overdue='"+sOverdue+"',standingorder='"+sStandingOrder+"' where drawnumber="+sNumber;
RS = ConnObj.Execute(SQL1);
RS=null;
ConnObj.Close();
ConnObj=null;
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<comment>
			Column 1 reserved for navigation menu
		</comment>
		
		<td>
			<comment>
				Content for each page placed into middle column
			</comment>
			<div name="body1" align="center">
				<br>
				<hr width="95%" align=center>
				<table  width="100%" border="1" cellspacing="2" cellpadding="5">
					<tr>
						<td >
							<b>
								Draw Number
							</b>
						</td>
						<td >
							<%= sNumber %>
						</td>
					</tr>
					<tr>
						<td >
							<b>
								Owner's Name
							</b>
						</td>
						<td >
							<%= sOwner %>
						</td>
					</tr>
				</table>
				<br>
				<b>
					The above details have been saved on the database
					<br>
				</b>
			</font>
			<hr width="95%" align=center>
			<br>
			<br>
		</div>
		<TABLE BORDER=0 WIDTH=100%  bgcolor="#408080" CELLPADDING=5>
			<TR>
				<td class="tdfont" ALIGN=CENTER VALIGN=TOP>
					<font color=#ffffff>
						<h3>
							Click on a menu choice on the left to go elsewhere in the site, or
							<br>
							click <a href="chk_200.asp">here</a>&nbsp;to alter another 200 Club number, or<br>
							click <a href="lst_200.asp">here</a>&nbsp;to list the allocated numbers
						</h3>
					</font>
				</TD>
			</TR>
		</TABLE>
	</td>
	<comment>
		Column 3 reserved for internal and external advertising
	</comment>
	<!--#include file="adverts.asp" -->
</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
%>

