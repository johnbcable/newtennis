<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Site Setup and Administration");
// Now for any variables local to this page
var emailuser, emailpassword;
var myaccess;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
if (! isAdministrator())
	Response.Redirect("services.asp");
// Now do pre processing for certain things on this page
myaccess=0;
myaccess=getUserAccessLevel();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
			<br>
			<table  width="80%" cellspacing="2" cellpadding="5" border="0">
<%
// 200 club admin first
if (myaccess == 55 || myaccess > 90)
{
%>
				<tr>
					<td class="tdfont" bgcolor="#aed2ac" colspan="2" border="0">
						<b>
							200 Club
						</b>
					</td>
				</tr>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="lst_200.asp">
							List currently allocated numbers
						</a>
					</td>
				</tr>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="chk_200.asp">
							Specify/alter who holds a number.
						</a>
					</td>
				</tr>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
                        <a href="which200draw.asp">
							Record/amend results of a 200 Club Draw.
						</a>
					</td>
				</tr>
<%
}    // end of 200 club admin section
%>
			</table>
			<br>
			<table  width="80%" cellspacing="2" cellpadding="5" border="0">
<%
// Now for membership administration
if (myaccess == 85 || myaccess > 90)
{
%>
				<tr>
					<td class="tdfont" bgcolor="#aed2ac" colspan="2" border="0">
						<b>
							Membership Administration
						</b>
					</td>
				</tr>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="new_memb.asp">
							Add a new member to the club
						</a>
					</td>
				</tr>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="chk_memb.asp">
							Amend the profile information about an existing club member
						</a>
					</td>
				</tr>
<%
}    // end of membership administration section
%>
			</table>
			<br>
			<table  width="80%" cellspacing="2" cellpadding="5" border="0">
<%
// Thirdly, fixtures
if (myaccess == 65 || myaccess > 90)
{
%>
				<tr>
					<td class="tdfont" bgcolor="#aed2ac" colspan="2" border="0">
						<b>
							Fixtures Administration
						</b>
					</td>
				</tr>
<%
// Restrict to me for the time being - testing
if (isSupport())
{
%>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="newfixture.asp">
							Set up a new fixture on the site.
						</a>
					</td>
				</tr>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
                        <a href="find_fixture.asp">
							Remove an existing fixture from the site.
						</a>
					</td>
				</tr>
<%
// end of me-only restriction
}
%>
				<tr>
					<td class="tdfont" >
						&nbsp;&nbsp;&nbsp;
					</td>
					<td class="tdfont" >
						<a href="fixtureresults.asp">
							Record/amend results of a fixture.
						</a>
					</td>
				</tr>
<%
}    // end of fixtures administration section
%>
			</table>
		</td>
	</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>