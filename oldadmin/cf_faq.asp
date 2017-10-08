<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("National Competiton Framework - Frequently Asked Questions");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="junsectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3><%= pagetitle %></h3>
		<div id="general">
			<p class="question">
				When does the competition framework take effect?
			</p>
			<p class="answer">
				The framework will lake effect from 1st September 2007, so you can expect competitions 
				from this date to be organised according to the new framework in terms of age group, 
				ball and court. There will be a phasing-in process for age groups over 2 years so that 
				players aren't forced back e.g. a 7 year old in year 1 can compete with an orange ball but 
				not in year 2 and a 10 year old in year 1 can compete with a yellow ball but not in year 2.
			</p>
			<p class="question">
				Do other countries operate a similar system?
			</p>
			<p class="answer">
				Similar systems operate in a number of major tennis playing nations. In France and Belgium 
				the structure for 10&amp;U competition has been in place for a number of years with great 
				success. It is also widely recognised that to have players competing at the right age, with 
				the right ball and on the right sized court has a huge benefit on the technical, tactical, 
				mental and physical development of their game.
			</p>
			<p class="question">
				Why can 8 year olds play in red and orange ball competitions?
			</p>
			<p class="answer">
				It is less clear when a player should progress from red to orange than it is from orange to 
				green ball competition as it depends on when they started playing. A player that starts red 
				ball competition at 6 may be ready to move to orange ball at 8 rather than 9. Once in orange 
				ball competition this difference is not as relevant.		
			</p>
		</div>    <!-- general -->
		<div id="playersandparents">
			<p class="question">
				How will players benefit from this new framework?
			</p>
			<p class="answer">
				Players will have access to well organised, meaningful and fun competition, which is consistent 
				across Great Britain. They will have the opportunity to regularly compete against players of the 
				same age in an environment which will develop their game technically, tactically, mentally and 
				physically. They will also be able to build their own player profile and see their results online.
			</p>
			<p class="question">
				How will parents benefit from this?
			</p>
			<p class="answer">
				In addition to parents knowing their children will be playing in well organised, meaningful and 
				fun competition they will also know when, where and how long each competition will last, allowing 
				for more convenient planning. Players and parents will receive better communication and support 
				through the talent ID and coach network.
			</p>
			<p class="question">
				How do I know what age group to play in?
			</p>
			<p class="answer">
				Currently a player's eligibility to compete is based on the year in which they are born, e.g. from 
				1st September 07 a player born in 1998 is eligible for 10&amp;U age group competition. Vanous options 
				are open to all sports to determine whether a player is eligible to compete in a given age group, 
				however, there is no firm evidence which proves the argument one way or another. As a result, there 
				will be no change to the current age eligibility rule, the LTA will continue to keep a close eye on 
				changes in tennis and in other sports in order to ensure all players have access to appropriate competition.
			</p>
			<p class="question">
				Will any players be allowed to 'play up' an age group?
			</p>
			<div class="answer">
				<p>
				All players are expected to compete in their own age group, 'playing up' is only allowed in 
				exceptional cases when players are issued with a passport to 'play up' as well as in their 
				own age group. There will be conditions in place for this:
				<ul>
					<li>If a player has exhausted the competition opportunities in their own age group category</li>
					<li>If a player has a track record which proves they have no appropriate competition within their own category</li>
					<li> A passport to play may be approved by the Head of Talent Management in conjunction with the relevant Talent Performance Manager for the area and will be communicated to the National Competitions Department and local competition organisers</li>
				</ul>
				</p>
			</div>
			<p class="question">
				What happens for 11 and 12 year olds?
			</p>
			<div class="answer">
				<p>
				We realise that with more competition taking place for 10&amp;U's there needs to be appropriate 
				competition for these players when they move into 11/12&amp;U competition. With this in mind we are 
				looking to:
				<ul>
					<li>Provide more competition opportunities at all grades for 11 and 12 year olds</li>
					<li>Ensure players are fully communicated with so they know where to go to get appropriate competition after they progress from green ball competition</li>
					<li>By registering all players earlier, the LTA can better monitor participation numbers by age group to ensure appropriate competition provision<li>
				</ul>
				</p>
			</div>
		</div>   <!-- playersandparents -->
		<div id="coaches">
			<p class="question">
				How will coaches benefit from this?
			</p>
			<p class="answer">
				Coaches will be supported by a competition framework which will have a huge impact on the 
				technical, tactical, mental and physical development of their players. They will be able to 
				see their players develop through a simple and consistent structure which measures their 
				performances against other players on an equal playing field within their peer group.
			</p>
			<p class="question">
				Should coaches progress players through red, orange and green in line with the competition framework?
			</p>
			<p class="answer">
				Yes. Coaches are advised to use the appropriate ball and court size at the relevant ages as 
				recommended in the competition framework.
			</p>
		</div>   <!-- coaches -->
		<div id="organisers">
			<p class="question">
				How will competition organisers benefit from this?
			</p>
			<p class="answer">
				Competition organisers will have an easy to understand and consistent framework to deliver. 
				They will be provided with support packages to help organise meaningful and fun competitions 
				in which formats and scoring are consistent throughout British Tennis.		
			</p>
		</div>             <!-- organisers -->
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">

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

