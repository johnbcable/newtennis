<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Tennis Club Disclaimer");
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
		<h3>Disclaimer</h3>
		<p class="leftindent">
			Great care has been taken in the creation of this website and attempts made to 
			present and maintain accurate and up-to-date information, however inaccuracies may 
			occasionally occur.
		</p>
		<p class="leftindent">
			Hampton-In-Arden Sports Club will not be held responsible for any loss, damage or inconvenience 
			caused as a result of any inaccuracy or error within its tennis club website pages. If you discover 
			any information on our pages that you believe to be inaccurate or inappropriate, please let us know 
			emailing <a href="mailto:support@hamptontennis.org.uk">support@hamptontennis.org.uk</a> or in writing
			to<br /><br />
			Chris Barnes<br />Secretary<br />Hampton-In-Arden Tennis Club<br />Shadowbrook Lane<br />Hampton-In-Arden<br />Solihull<br />West Midlands
			<br />B92 0DQ.<br /><br />You may also telephone Chris on 01675 443572
		</p>
		<div id="linkdisclaimer">
			<h4>The Links on our Website</h4>
			<p class="leftindent">
				This website contains links to other websites, both those of government departments and of other organisations. 
				This disclaimer and our <a href="privacy.asp">privacy statement</a> only applies to our website, so you should 
				always read the privacy statement and disclaimer of any other websites visited. We have no control over and shall 
				not be responsible for the content of such linked websites. These links are provided for your convenience and do 
				not imply that Hampton-In-Arden Sports Club endorses or supports those organisations, the information on their 
				pages, or their products or services in any way. Any purchase of goods and services made through third parties' 
				websites shall be subject to those third parties' terms and conditions.
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
