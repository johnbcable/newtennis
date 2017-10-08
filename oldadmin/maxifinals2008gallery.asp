<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("2007 Club Tournament");
// Now for any variables local to this page
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
	<div id="content">
		<div id="mainContent">
			<h3>Maxi-Tennis Finals Day - April 13, 2008</h3>
			<p>
				Shown below are some further photos taken on the finals day at the club. Thanks to everyone who attended despite the 
				(sometimes) atrocious weather and well done to our Maxi-Tennis champions for 2008: <span class="blueheading">Scotland</span>.
			</p>
	<div class="borderboth" id="tournamentresults">
	<table class="borderless">
		<caption>Photo Gallery from the Maxi-Tennis Finals Day, 2008</caption>
		<thead>
			<tr>
				<th colspan="2" class="leftindent">Click on any picture to display a larger version</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>The victorious Scotland team with their treasured shield</td>
				<td class="leftindent">
					<a href="show_jpic.asp?photo=maxifinals2008winners&caption=First time Scotland have been Maxi-Tennis finalists ........ and they won the shield&bottomcaption=From left - Phil Turpin,Dave Betts, Carol Betts, Ruth Fennell, Catherine Eley and Dave Teasdale.<br />In front from left Tom Betts and Jamie Turpin">
						<img border="0" src="Images/tn_maxifinals2008winners.jpg"></b>
					</a>
				</td>
			</tr>
			<tr>
				<td>The gallant runners-up: the Ireland team still cheerful in second place .... with the chocolates!</td>
				<td class="leftindent">
					<a href="show_jpic.asp?photo=maxifinals2008runnersup&caption=First time Ireland have been Maxi-Tennis finalists ........ and the Scots beat them to the shield&bottomcaption=From left - Pete Morris, Lesley Cable, Sophie Cable, Susan Lawrence, Gary Lawrence and Savio Gaspar.<br />In front - Henry Scott">
						<img border="0" src="Images/tn_maxifinals2008runnersup.jpg"></b>
					</a>
				</td>
			</tr>			
			<tr>
				<td>The winning captains show off their trophy. From left: Ruth Fennell and Catherine Eley</td>
				<td class="leftindent">
					<a href="show_jpic.asp?photo=maxifinals2008winningcaptains&caption=It makes it all worthwhile turning up in the cold and wet&bottomcaption=The winning captains show off their trophy. From left: Ruth Fennell and Catherine Eley">
						<img border="0" src="Images/tn_maxifinals2008winningcaptains.jpg"></b>
					</a>
				</td>
			</tr>			
			<tr>
				<td>The runners-up captains discuss who should eat their Celebrations!. From left: Lesley Cable and Susan Lawrence</td>
				<td class="leftindent">
					<a href="show_jpic.asp?photo=maxifinals2008losingcaptains&caption=Cheer up Susan and have a chocolate - there is always next year&bottomcaption=The losing captains laugh about the team distribution of the Celebrations.<br />From left: Lesley Cable and Susan Lawrence">
						<img border="0" src="Images/tn_maxifinals2008losingcaptains.jpg"></b>
					</a>
				</td>
			</tr>						
			<tr>
				<td>Matches in progress</td>
				<td class="leftindent">
					<a href="show_jpic.asp?photo=maxifinals2008_b&caption=Everyone was keen to play their matches despite the weather&bottomcaption=.... it's not far to run to the clubhouse!">
						<img border="0" src="Images/tn_maxifinals2008_b.jpg"></b>
					</a>
				</td>
			</tr>									
			<tr>
				<td>... and finally, a view of the cheery supporting crowd ..... before hypothermia set in!</td>
				<td class="leftindent">
					<a href="show_jpic.asp?photo=maxifinals2008_c&caption=The cheering of the crowd really drove the players on&bottomcaption=Darn it! Who is that man in the black and blue fleece? <i>(You said he wouldnt appear. Ed.)</i>">
						<img border="0" src="Images/tn_maxifinals2008_c.jpg"></b>
					</a>
				</td>
			</tr>												
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
		</tfoot>
	</table>
	</div>    <!-- tournamentresults -->
	<div id="tournamentthanks">
		<p>
		Many grateful thanks to all the volunteers who attended to watch and provided tea and (loadsa) cakes! Nice touch having Scots flags on the shortbread by the way!
		</p>
		<p>
		A good day for everyone, both players and spectators - marred by occasional atrocious weather! 
		</p>
		<p>
		Till next year .....
		</p>
	</div>
	</div>  <!-- mainContent -->	
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="fixturepanel.asp" -->
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
