<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Junior Club Tournament");
// Now for any variables local to this page
// End of page start up coding
// if (! signedin())
//  	Response.Redirect("jtour2007.asp");
%>
<!--#include file="junsectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>Junior Tournament Results - 2007</h3>
		<div id="u16girls" class="borderbottom">
			<div id="u16g2007w">
				<a href="show_jpic.asp?photo=u16g2007w&caption=Charlotte Ray showing her winners plate and medal with coach, Ian&bottomcaption=Charolotte Ray is girls under 16 champion">
					<img class="floatleft" id="finalists1" border="0" src="Images/tn_u16g2007w.jpg" width="150" height="247" alt="Charolotte Ray is girls under 16 champion">
				</a>
			</div>
			<div id="u16g2007ru">
				<a href="show_jpic.asp?photo=u16g2007ru&caption=Sophie Cable shows her runners-up medal from coach, Ian&bottomcaption=Sophie Cable is girls under 16 runner-up">
					<img class="floatright" id="finalists2" border="0" src="Images/tn_u16g2007ru.jpg" width="150" height="256" alt="Sophie Cable is girls under 16 runner-up">
				</a>
			</div>
			<h4>Under 16 Girls</h4>
			<p>
			Charlotte Ray (left) became Hampton-In-Arden under 16 girls singles champion after beating Sophie Cable (right) in the final. Charlotte had won all of her previous 
			'round-robin' matches, Sophie only having lost to Charlotte. The final kicked off in fine form with Sophie taking an early 1-0 lead. Charlotte then 
			rallied back and took the next two games. At 2-1, it began to look as if the final would be a repeat of their earlier round-robin encounter but Sophie 
			was determined to put that match behnd her and stepped up her game to be leading 40-15 at 2-2. A couple of mistakes from Sophie brought the game to deuce 
			and Charlotte kept her head to close that game out giving her a 3-2 lead. 
			</p>

			<p>
			The girls both thought that was it (that the final would follow the model of the round-robin: first to 3 games) but they hadnt been listening to new 
			coach Ian at the start. The final was to be one full set. So the girls had to carry on and treated us all to a display of some fine tennis, Charlotte 
			eventually running out the winner (at 6-2).
			</p>
		</div>
		<div id="u16boys" class="borderbottom">
			<div id="u16b2007w">
				<a href="show_jpic.asp?photo=u16b2007w&caption=Shakey and the coach&bottomcaption=Jacob (Shakey) Pratt is boys under 16 chamption in 2007">
					<img class="floatleft" id="finalists3" border="0" src="Images/tn_u16b2007w.jpg" width="150" height="181" alt="Jacob (Shakey) Pratt is boys under 16 chamption in 2007">
				</a>
			</div>
			<div id="u16b2007ru">
				<a href="show_jpic.asp?photo=u16b2007ru&caption=Will Shaw is under 16 boys runner up in 2007, Ian&bottomcaption=Just that Shakey character to beat next time Will">
					<img class="floatright" id="finalists4" border="0" src="Images/tn_u16b2007ru.jpg" width="150" height="229" alt="Will Shaw is under 16 boys runner up in 2007">
				</a>
			</div>		
			<h4>Under 16 Boys</h4>
			<p>
			Jacob Pratt (Shakey) (see photo on the left) became Hampton-In-Arden under 16 boys singles champion after beating Will Shaw (right) in the final. Shakey had played 
			yesterday (with Sophie Cable) in the finals of the North Warwickshire U14 Mixed Doubles (and won! - read the full story <a href="sophieandshakey.asp">here</a>
			&nbsp;- and was therefore well rehearsed in competitive tennis. This preparedness was what eventually shone through in an exciting match full of very watchable tennis from both 
			boys as Shakey claimed the title with a 6-0 win.
			</p>
		</div>
		<div id="u12girls" class="borderbottom">
			<div id="u12g2008w">
				<a href="show_jpic.asp?photo=u12g2008w&caption=Emily White displaying her winners cup&bottomcaption=Emily White is girls under 12 champion for 2007">
					<img class="floatleft" id="u12finalists1" border="0" src="Images/tn_u12g2008w.jpg" width="149" height="124" alt="Emily White is girls under 12 champion for 2007">
				</a>
			</div>
			<div id="u12g2008ru">
				<a href="show_jpic.asp?photo=u12g2008ru&caption=Grace sporting her first Hampton tournament trophyn&bottomcaption=Grace Nugent-Spick is girls under 12 runner-up for 2007">
					<img class="floatright" id="u12finalists2" border="0" src="Images/tn_u12g2008ru.jpg" width="150" height="129" alt="Grace Nugent-Spick is girls under 16 runner-up for 2007">
				</a>
			</div>					
			<h4>Under 12 Girls</h4>
			<p>
			Emily White (left) became girls under 12 singles champion in the Junior Tournament for 2007 (finals conducted on 17 February 2008 for the under-12 events). Her opponent 
			and eventual runner-up was Grace Nugent-Spick (right). 
			</p>
		</div>
		<div id="u12girls" class="borderbottom">
			<div id="u12b2008w">
				<a href="show_jpic.asp?photo=u12b2008w&caption=Jamie Turpin displaying his winners cup&bottomcaption=Jamie Turpin is boys under 12 champion for 2007">
					<img class="floatleft" id="u12finalists3" border="0" src="Images/tn_u12b2008w.jpg" width="150" height="123" alt="Jamie Turpin is boys under 12 champion for 2007">
				</a>
			</div>
			<div id="u12b2008ru">
				<a href="show_jpic.asp?photo=u12b2008ru&caption=Sam is VERY happy with his tournament performance for 2007&bottomcaption=Sam Hiskett is boys under 12 runner-up for 2007">
					<img class="floatright" id="u12finalists4" border="0" src="Images/tn_u12b2008ru.jpg" width="149" height="125" alt="Sam Hiskett is boys under 16 runner-up for 2007">
				</a>
			</div>					
			<h4>Under 12 Boys</h4>
			<p>
			Jamie Turpin (left) became boys under 12 singles champion in the Junior Tournament for 2007 (finals conducted on 17 February 2008 for the under-12 events) beating Sam Hiskett (right). 
			</p>
		</div>
		<p style="clear:both;">
			For a picture showing all the Under 12 finalists and the two coaches, click 
			<a href="show_jpic.asp?photo=u12-2008-finalists&caption=All Under 12 finalists and their two club coaches&bottomcaption=Back row from left: Ian Poole and 'Deadly' Dave Mountford.<br />Front row from left: Emily White, Jamie Turpin, Sam Hiskett and Grace Nugent-Spick">
			here
			</a>.
			<br /><br />
			Refreshments (coffees, teas, sweets and some delicious home-made cakes) were available on both days 
			as normal from the clubhouse kitchen. Many grateful thanks to all the volunteers and parents.
			Some great tennis from the juniors on both afternoons.
		</p>
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

