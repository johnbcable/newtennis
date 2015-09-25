<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="memberfuncs.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Member Services Area");
// Now for any variables local to this page
var emailuser, emailpassword;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
// Now do pre processing for certain things on this page
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td>
	 <!--#include file="tickertape.asp" -->
<br>
	<h2>Member Options:</h2>
<%
// Need code in here to read and display any appropriate messages for MEMBERS and/or the currently signed-in member

%>
<table  width="80%" cellspacing="2" cellpadding="5" border="0">
 				<tr>
					<td class="tdfont" bgcolor="#aed2ac" colspan="2" border="0">
						<b>
							Membership Details
						</b>
					</td>
				</tr>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="profile.asp">
							Check my details
						</a>
					</td>
				</tr>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="chk_memb.asp">
							Search membership list
						</a>
					</td>
				</tr>
 				<tr>
					<td class="tdfont" bgcolor="#aed2ac" colspan="2" border="0">
						<b>
							Publications and News Items
						</b>
					</td>
				</tr>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="cchist.asp">
							Court Circular magazine - current and historic.
						</a>
					</td>
				</tr>
<%
if (isPublicationEditor())
{
%>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="article.asp">
							Submit a news item for potential inclusion on the site.
						</a>
					</td>
				</tr>
<%
}
%>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="reports.asp">
							Minutes of meetings, annual report and accounts and so on.
						</a>
					</td>
				</tr>
<%
if (isSupport())
{
%>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="put_mess.asp">
							Leave a message on the site.
						</a>
					</td>
				</tr>
<%
}
%>
</table>
</font>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
<%
%>


