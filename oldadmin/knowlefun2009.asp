<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Knowle Fun Run - Sponsorhip for Sports Club Members");
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
		<br />
		<h3>Knowle Fun Run, May 11th, 12.00 midday.</h3>
		<div class="borderboth">
			<h4 class="blueheading">Update</h4>
			<p>
				Hampton entrants in 2008 raised a total of <b>&pound;4271.00</b> which was split between Hampton-In-Arden Recreational Trust and St Mary's Hospice, Selly Oak.
				This is a fantastic monetary total but, equally as important, this year Hampton sent 76 sponsored runners into the race - a huge increase over the 44 from 2007. 
				So, well done to everyone concerned and I hope you all enjoyed it - I am sure you did! Let's see you all back again next year.
			</p>
		</div>
		<p class="blueheading">
			An invitation to participate as member of Hampton Sports Club-based team  - &quot;The Good, the Bad and the Ugly&quot;
		</p>
		<div id="overlayboxquote" class="boxright">
			<div class="boxheader">
				Lets Get Busy
			</div>
			<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
			<p>
				Once again for 2008, the Hampton Sports Club charities to benefit from sports club members racing in the Knowle Fun Run are all very deserving 
				cases - our local astro-turf providers (used by our hockey club) and a Birmingham hospice dealing with the care of cancer sufferers, often terminal 
				cases. The added incentive this year is for us to get as many runners entering as possible in order to maximise the donation from the Lillie Johnson 
				Charitable Trust (&pound;50 per runner). This will ensure our charities do well from our participation in this event.
			</p>
			<p class="boxsignature">Karen Finch</p>
		</div>
		<p>
			Last year, 44 runners entered from Hampton  - and were the largest team entry in this event. This year, funds raised by 
			the team will be divided between St Mary`s Hospice, Selly Oak and the Hampton Recreational Trust. The Lillie Johnson Charitable 
			Trust has kindly pledged &pound;50 per runner. The Entry Form is in the main entrance of the Hampton in Arden Sports Club. &pound;6.00 
			entry for Juniors and Secondary age, &pound;12.00 for adults and veterans.<br /><br />
			Please hand in fees to either Sue Kiely at 3 Meriden Rd (01675 443989) or Karen Finch at 9 Station Rd (01675 443160), or behind 
			the Sports Club bar. Tee shirt colour will be pillar box red. All team sponsorship is taken care of, but if you would like to 
			download your own sponsorhip form, use the following link:<br /><br />
			<a href="http://www.knowlefunrun.org.uk/information/sponsorship_form.pdf">http://www.knowlefunrun.org.uk/information/sponsorship_form.pdf</a><br /><br />
			(document in Adobe Acrobat form).
		</p>
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
