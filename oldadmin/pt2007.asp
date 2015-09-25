<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Play Tennis Day, 5th May, 2007");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="junsectionhead.asp" -->
<div id="content">
	<div id="mainContent">
	<h3>'Play Tennis' Day - Saturday May 5, 2007 at our club</h3>
	<table>
	<tr>
		<td class="tdfont" width="650" align="center" valign="top">
			
            <img alt="Play Tennis promotional image" src="Images/pt140x140.jpg" width="140" height="140" style="float: left"><span class="style2">
			</span> 
            <b>
			<font face="Comic Sans MS" size="4">
            <span class="style2">Play Tennis For Free!</span><br />
            Have a go at your local Play Tennis Day 
            here at Hampton In Arden Tennis Club<br />
            on<br />
            </b>
			<img border="0" width="384" height="41" src="pt2007_files/image001.gif" alt="Saturday 5 May 2007">
		</td>
	</tr>
	<tr>
		<td>
			<p>
			Tennis for all ages and abilities! Come and join the fun with our 
			coach <strong>Alan Cutts</strong>
            </p>
			<p>
			Also, come and try your hand at <b>
            HOCKEY </b>on the fantastic new astroturf pitch. <u>EVERYONE</u> is welcome to come and 
            try out our activities.
			</p>
			<p>
			There's lots of things going on - tennis factory (for under 9&#39;s) 
			ball machine, tennis demonstration, bacon butties (from 10.00 am), BBQ (from 11.00 
			am).
            </p>
            <p>
			The current timetable for the day is as follows:
			</p>
			<div align="center">
				<table>
					<tr>
						<td>
							9.30 a.m. -> 12.00 noon.
						</td>
						<td>
							Minis and Juniors, all ages - just turn up and play. 
							Also, adult racket testing and ball machine!
 						</td>
					</tr>
					<tr>
						<td>
							10.30 a.m. -&gt; 12.00 noon</td>
						<td >
							Hockey skills - on the new astroturf pitch.
						</td>
					</tr>
					<tr>
						<td>
							12.30 p.m. -> 1.30 p.m. 
						</td>
						<td >
							Tennis demonstration including crowd participation, plus 
							<i><b>frying pan challenge</b></i>
							&nbsp;(please bring your own equipment) 
						</td>
					</tr>
					<tr>
						<td>
							2.00 p.m. -> 3.00 p.m. 
						</td>
						<td >
							Adult beginners/rusty rackets
 						</td>
					</tr>
					<tr>
						<td>
							3.00 p.m. onwards
						</td>
						<td >
							Adult social/intermediate/advanced players
                            <br />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p class="centered">
							For further information, please contact
							<br />
							<b>
								 Rosalia Eccleston (01675 442913)</b> or 
							<br />
							<b>
								Jayne Barnes (01675 443572)
							</b>
							</p> 
						</td>
					</tr>
				</table>
			</div>
		    
		</td>
	</tr>
	<tr>
		<td>
			<p class="centered">
				<i><strong>
					<img border="0" src="Images/ltatennisnation.gif" align="left">FREE</strong>&nbsp;tennis
					<img border="0" src="Images/arielmt1.gif" width="117" height="99" align="right"></i>
			</p>
			<p>
			Play Tennis 2007 is run by the Lawn Tennis Association and the campaign offers
			everyone, especially beginners, the opportunity to pick up a racket and play.
			As part of the campaign, Hampton-in-Arden Tennis Club is throwing open its
			doors on <span class="blueheading">Saturday 5th May, 2007 </span> 
			<b><i>for free!</i></b>
			</p>
			<p>
			It's open to players of all ages and abilities and youngsters are particularly
			welcome to come and experience the greatest game in the world. So why not give
			it a try?
			</p>
			<p>
			Hundreds of venues around the country are expected to take part. 
			Since the initiative started just over 6 years ago, over 500,000 
			people have attended a Play Tennis day at one of over 1,100 tennis 
			clubs around the country. The LTA
			anticipate that more than 70,000 will attend this year making it the 
			UK&#39;s biggest participation event.&nbsp;
			</p>
			<p>
			Steve Ray, our Chairman, has said: "The campaign has been designed 
            from the outset to encourage
			people of all ages to go to their local tennis venue and pick up a racket. We
			want to show people that their local tennis club can be welcoming, friendly 
            and FUN!
			We particularly hope that the campaign attracts children and adults to try
			their hand at tennis and become long-term members of our club."
            </p>
		</td>
	</tr>
</table>
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
