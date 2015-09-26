<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Privacy Statement");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>Privacy Policy</h3>
		<div id="confidentiality">
			<p class="leftindent">
				A number of pages throughout this site invite members to verify or view forms including their personal details. 
				There is no requirement to fill in these forms in order to view general material on this site. If you do 
				sign-on to the site as a club member with your username and password , you should note the following:<br /><br />
					1. <strong><u>Web Pages</u></strong><br /><br />
					Hampton-In-Arden Sports Club stores your personal details in a database server facility to protect your 
					details from third parties when you send them over the internet. These details are only accessible to you 
					and other members of the club via the username/password sign-in facility on the club web site.<br /><br />
					2. <strong><u>Virus Protection</u></strong><br /><br />
					We make every effort to check and test the material on our site. However, it is always wise to run an 
					anti-virus program on all material downloaded from the Internet. Hampton-In-Arden Sports Club cannot accept 
					any responsibility or liability for any loss, disruption or damage to your data or to your computer system, 
					which may occur as a result of using material from our site.<br /><br />
					3. <strong><u>Cookies</u></strong><br /><br />
					A cookie is small text file placed on a user's computer by a Website, which logs information about the user 
					and their previous/current visits to the site. Cookies allow web applications to respond to you as an individual. 
					The web application can tailor its operations to your needs, likes and dislikes by gathering and remembering 
					information about your preferences. We use traffic log cookies to identify which pages are being used. This 
					helps us analyse data about web page traffic and improve our Website in order to tailor it to customer needs. 
					We only use this information for statistical analysis purposes and then the data is removed from our system.
					We also use session cookies which are temporary cookies stored for remembering your preferences during a web 
					site visit and that are destroyed when you leave the website. A cookie in no way gives us access to your 
					computer or any information about you, other than the data you choose to share with us.<br /><br />
					4. <strong><u>Search Engines</u></strong><br /><br />
					All of the club web site (with some exceptions - see below) is available to internet search engine providers 
					e.g. Yahoo, Google, Ask etc for them to index the content of our site which will allow people to find our site 
					as quickly and reliably as possible. The exception to this overall availability is your membership and contact 
					details (which are only available for members of the club to view via access to the club web site using the 
					username and password allocated). Search engines are very useful but, essentially, indiscriminate tools that 
					catalogue everything they find regardless of its sensitivity. In view of this, the club has taken steps to explicitly exclude member details from the set of information that these search engines can see.
			</p>
		</div>
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
