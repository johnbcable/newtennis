	<ol id="membnav">
<%
if (signedin())
{
	var myUserID = getUserCode();
%>
		<h3>Members</h3>
		<li><a href="members.asp">Overview</a></li>
		<li><a href="profile.asp">My Details</a></li>
		<li><a href="chk_memb.asp">Directory</a></li>
		<li><a href="galleryindex.html">Galleries</a></li>
		<li><a href="reports.asp">Reports</a></li>
		<li><a href="forms.asp">Forms</a></li>
		<li><a href="logout.asp">Sign-Out</a></li>
	</ol>
<%
	var mylevel = getUserAccessLevel()
	//  grant access to Jo and Chester
	if (mylevel == 50 || mylevel == 90) {
%>
		<ol id="adminnav">
			<h3>Site Admin</h3>
			<li><a href="quickmail.asp">Send quick messages</a></li>
			<li><a href="chk_list.asp">Circulation lists</a></li>
			<li><a href="/lst_unpaid.asp">Unpaid annual fees</a></li>
		</ol>		
<%
	} 
	if ( isSupport()) {
		// Include an Admin Panel appropriate to signon.
%>

		<ol id="adminnav">
			<h3>Site Admin</h3>
			<li><a href="lst_news.asp">News</a></li>
			<li><a href="lst_teams.asp">Teams/Captains</a></li>
			<li><a href="200res.asp">200 Club</a></li>
			<li><a href="lst_clubs.asp">Other Clubs</a></li>
			<li><a href="lst_sessions.asp">User Sessions</a></li>
			<li><a href="lst_audits.asp">Member Audits</a></li>
			<li><a href="sqlupd.asp">SQL Updates</a></li>
			<li><a href="sendcirc.asp">Send emails</a></li>
			<li><a href="quickmail.asp">Send quick messages</a></li>
			<li><a href="chk_list.asp">Circulation lists</a></li>
			<li><a href="chk_birthdays.asp">Birthdays</a></li>
			<li><a href="/lst_unpaid.asp">Unpaid annual fees</a></li>
		</ol>
<%
	}
}
else
{
%>
	<ol id="membnav">
		<h3>Members</h3>
		<li><a href="login.asp">Sign-In >>></a></li>
	</ol>
<%
}
%>
