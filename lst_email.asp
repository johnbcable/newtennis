<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Email Search Results");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var thesubject, thefile, thedatesent, thenumber, thecomment;
var thedate;
var thesearchtext, therealtext
var callinguser;
var editline, dataline;
var toclick;
var ConnObj, RS, StnObj;
var emailknt;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
emailknt=0;
callinguser=new String("NONE");
thesearchtext = new String(Request.Form("emailtext"));
therealtext = new String(thesearchtext);
thesearchtext = thesearchtext.toUpperCase();
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT * from emails where (((UCase([subject])) like '%" + thesearchtext + "%')) order by sent_on desc");
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
<%
if (debugging)
{
Response.Write("    SQL statement = ["+SQLStmt+"]<br>\r\n");
}
%>
			<table  width=650 border=0 cellspacing=0 cellpadding=0>
				<tr>
					<td class="tdfont" colspan="2" bgcolor="#c0c0c0">
						<b>
							Search request was:
						</b>
					</td>
				</tr>
				<tr>
					<td class="tdfont">
						<b>
							Email contains following text:
						</b>
					</td>
					<td class="tdfont">
						<%= therealtext %>
					</td>
				</tr>
			</table>
			<br>
			<hr>
			<div align="center">
				List presented in reverse date order - most recently sent emails appear at the top
			</div>
<%
// execute the SQL statement
RS = ConnObj.Execute(SQLStmt);
%>
			<TABLE border="2" WIDTH="100%" BGCOLOR="#ffff80" CELLPADDING="5" COLS="2">
				<TH ALIGN="CENTER" COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000>
					<FONT SIZE=2 FACE="Arial" COLOR=#000000>
						Ref:
					</FONT>
				</TH>
				<TH ALIGN="LEFT" COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000>
					<FONT SIZE=2 FACE="Arial" COLOR=#000000>
						Subject:
					</FONT>
				</TH>
				<TH COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000 >
					<FONT SIZE=2 FACE="Arial" COLOR=#000000>
						<i>
							Sent On
						</i>
					</FONT>
				</TH>
<%
while (! RS.EOF)
{
	emailknt=emailknt+1;
	Response.Write("     <TR>\r\n");
	// Insert the following to control access to changes in details
	// dataline=new String("("+RS("address1")+" "+RS("address2")+") - ["+RS("homephone")+"] {"+RS("mobilephone")+"}");
	thedatesent=new String(RS("sent_on")).toString();
	thefile=new String(RS("emailfile")).toString();
	if (thedatesent!="null")
	{
		thedate=new Date(RS("sent_on"));
		thedatesent = ddmmyyyy(thedate);
	}
	editline=new String("emailviewer.asp?email="+thefile).toString();
%>
					<td class="courtcirc" ALIGN="CENTER" VALIGN="CENTER">
						<B>
							<a href="<%= editline %>								">
								<%= RS("emailid") %>
							</a>
						</B>
					&nbsp;</td>
					<td class="courtcirc" ALIGN="LEFT" VALIGN="CENTER">
						<b><%= RS("subject") %> &nbsp;</b>
					</td>
					<td class="courtcirc">
						<%= thedatesent %> &nbsp;</td>
<%
	Response.Write("       </TR>\r\n");
	RS.MoveNext();
}
if (emailknt<1)
{
%>
			<TR>
				<td class="tdfont" colspan="3">
					<BR>
					<CENTER>
						No matching email information found for <%= therealtext %>
					</CENTER>
					<BR>
				</TD>
			</TR>
<%
}
else
{
%>
			<TR>
				<td class="tdfont" colspan="3">
					<BR>
					<DIV ALIGN="CENTER">
						Click on the reference (Ref. column) corresponding to the email you are searching for to
						view it
					</DIV>
					<BR>
				</TD>
			</TR>
<%
}	  // end of emailknt test
Response.Write("<TR>");
%>
			<td colspan="3" class="tdfont" color="#00000" bgcolor="#aed2ac">
				<BR>
				<DIV ALIGN="CENTER">
					<a href="chk_email.asp">
						Search again
					</a>
				</DIV>
				<BR>
			</TD>

		</TR>
	</TABLE>
</DIV>
</td>
</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
ConnObj.Close();
ConnObj=null;
%>
