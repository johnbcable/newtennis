<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("MAXI-Tennis Results - Spring 2009");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
	<br />
	<div id="2009summaryresults">
		<table>
			<caption><h3>Spring 2009 MAXI-Tennis Summary Results</h3></caption>
			<thead>
				<tr>
					<th colspan="5">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 5px; margin-left:10px">Sunday 20 January</td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Wales</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">Scotland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=walesvscotland2009.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">France</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">Ireland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=francevireland2009.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Italy</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">England</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=italyvengland2009.htm">[DETAILS]</a></td>
				</tr>				
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 5px; margin-left:10px">Sunday 3 February</td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Ireland</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">Italy</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=irelandvitaly2009.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">England</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">Wales</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=englandvwales2009.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Scotland</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">France</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=scotlandvfrance2009.htm">[DETAILS]</a></td>
				</tr>								
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 5px; margin-left:10px">Sunday 24 February</td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Wales</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">Italy</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=walesvitaly2009.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Ireland</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">Scotland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=irelandvscotland2009.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">France</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">England</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=francevengland2009.htm">[DETAILS]</a></td>
				</tr>												
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 5px; margin-left:10px">Sunday 9 March</td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Ireland</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">Wales</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=irelandvwales2009.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Scotland</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">England</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=scotlandvengland2009.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">France</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">Italy</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=francevitaly2009.htm">[DETAILS]</a></td>
				</tr>												
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 5px; margin-left:10px">Sunday 16 March</td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Italy</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">Scotland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=italyvscotland2009.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">England</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">Ireland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=englandvireland2009.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Wales</td>
					<td class="centered" width="20%"></td>
					<td class="centered" width="20%"></td>
					<td class="leftalign" width="20%">France</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=walesvfrance2009.htm">[DETAILS]</a></td>
				</tr>		
				<tr>
					<td colspan="5" class="centered">
						<p>
							Maxi-Tennis finals day is scheduled for Sunday April 13th, between 2.30pm and 4.00pm<br />
							The results from that match will be kept <a href="showmaxiresult.asp?thefile=maxifinals2009.htm">here</a>
						</p>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>	
 	</div>
	<div class="seealso">
		<h3>See Also:</h3>
		<ul>
			<li><a href="maxirules.asp">Maxi-Tennis rules</a></li>
			<li><a href="maxileague2009.asp">Current Maxi-Tennis league table</a></li>
			<li><a href="maxiscores.xls">Download blank score sheet</a></li>
		</ul>
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
