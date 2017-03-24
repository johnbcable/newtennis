<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="clubfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Useful Links");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
var dbconnect=Application("hamptonsportsdb");
var curseason = currentSeason();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// Set up db connections for club web list
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);

// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>Useful Links</h3>
		<div id="linksblurb" class="borderbottom">
			<p>
				No web site can satisfy all the information demands of the vast variety of people who may purposefully 
				or inadvertently stray onto it. This site is no exception. In addition, web sites can draw peoples attention to 
				other material presented elsewhere that may be of interest to the visitor without having to duplicate the 
				efforts of other web sites. This section brings together some references to other web sites that may be of interest 
				to visitors to this web site. We break these down into the following sections:<br />
			</p>
			<ul>
				<li>Links to material presented on other web sites run by other sections in the club</li>
				<li>Links to other (mainly local) tennis club web sites</li>
				<li>Links to sites dealing with tennis national (or regional) initiatives or events</li>
				<li>Other web sites relating to our locality</li>
			</ul>
			<p>
				As always, Hampton-In-Arden Sports Club is not repsonsible for the content of these web sites.
			</p>
		</div>
		<div id="overlayboxquote" class="boxright">
			<div class="boxheader">Other Tennis Clubs</div>
			<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
			<p>
				The list below is based on information given to Hampton-In-Arden Tennis Club in the Coventry League fixtures 
				booklet for the most recent season (<%= curseason %>).
			</p>
<%
				clublist = getClubEmailAddressList();
				Response.Write(clublist);
%>
			</p>
			<p class="boxsignature">Senior Committee</p>
		</div>
		<div id="othersports">
			<p>
				The club also plays host to other sports sections e.g. the Hampton-In-Arden Sports Club squash and racketball section, the hockey club and the football section and is
				working with the Parish Council to bring back cricket into the village on the sports club grounds. During the summer, the club also plays host to a local boules league.
			</p>
			<div id="squash" class="borderbottom">
				<h4>Squash and Racketball</h4>
				<div id="squashimage">
					<img class="boxleft" src="images/squashlogoV1.gif" width="100" height="123" alt="Hampton Squash Club" />
					<p class="caption"></p>
				</div>
				<p>
					The squash and racketball section has 2 recently re-floored, indoor squash and racketball courts with lighting on a pay-as-you-go basis using cards obtainable 
					from behind the bar. The section has its own web site (<a href="http://www.hamptonsquash.org.uk/">click here</a>) which contains all you could ever 
					want to know about squash and racketball at Hampton-In-Arden Sports Club
				</p>
			</div>
			<div id="hockey" class="borderbottom" style="clear:both;">
				<h4>Hampton-In-Arden Hockey Club</h4>
				<div id="hockeyimage">
					<img class="boxright" src="images/hockeyphoto.jpg" width="214" height="87" alt="Hampton Hockey Club" />
					<p class="caption"></p>
				</div>				
				<p>
					The Hampton-In-Arden Hockey Club has its own web site (<a href="http://www.hamptonhockey.org.uk/">click here</a>) which contains loads of good information 
					about hockey teams and fixtures. The hockey team are currently enjoying playing their home fixtures on their purpose-built astro-turf playing surface (introduced in 2006).
				</p>
			</div>		
			<div id="boules">
				<h4>Boules</h4>
				<p class="leftindent">
					In the summer months, Hampton-In-Arden Sports Club also plays host to the local Boules League.
					<br /><br />
					The clubhouse has one outdoor boules piste area for use in these competitions. It is a lovely way to spend an hour or 
					two on the weekend or a weekday evening. Anyone interested in playing boules should contact the current secretary of the 
					league (<b>Phil Shaw (01675 443696)</b>)&nbsp;for details of how to take part.
				</p>
			</div>
		</div>
		<div id="tennisnational" clas="borderbottom">
			<div id="ltasites">
				<h4>LTA-Related Sites</h4>
				<div id="nationallta">
					<a href="http://www.lta.org.uk/">
						<img src="images/lta.gif" width="118" height="70" alt="National LTA Home Page" />
					</a>			
					<p class="caption"></p>
				</div>
				<p>
					National Lawnt Tennis Association
				</p>
			</div>		
		</div>
	</div>  <!-- mainContent -->	
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="home_nav.asp" -->
<!--#include file="memb_nav.asp" -->
</div>
<div id="footer">
<!--#include file="textnav.asp" -->
</div>
</div>
<!--end container-->
</body>
</html>
<%
%>

