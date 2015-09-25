<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("MAXI-Tennis Results - Spring 2008");
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
	<div id="2008summaryresults">
		<table>
			<caption><h3>Spring 2008 MAXI-Tennis Summary Results</h3></caption>
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
					<td class="centered" width="20%">168</td>
					<td class="centered" width="20%">133</td>
					<td class="leftalign" width="20%">Scotland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=walesvscotland2008.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">France</td>
					<td class="centered" width="20%">126</td>
					<td class="centered" width="20%">161</td>
					<td class="leftalign" width="20%">Ireland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=francevireland2008.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Italy</td>
					<td class="centered" width="20%">136</td>
					<td class="centered" width="20%">158</td>
					<td class="leftalign" width="20%">England</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=italyvengland2008.htm">[DETAILS]</a></td>
				</tr>				
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 5px; margin-left:10px">Sunday 3 February</td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Ireland</td>
					<td class="centered" width="20%">156</td>
					<td class="centered" width="20%">147</td>
					<td class="leftalign" width="20%">Italy</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=irelandvitaly2008.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">England</td>
					<td class="centered" width="20%">139</td>
					<td class="centered" width="20%">140</td>
					<td class="leftalign" width="20%">Wales</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=englandvwales2008.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Scotland</td>
					<td class="centered" width="20%">147</td>
					<td class="centered" width="20%">141</td>
					<td class="leftalign" width="20%">France</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=scotlandvfrance2008.htm">[DETAILS]</a></td>
				</tr>								
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 5px; margin-left:10px">Sunday 24 February</td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Wales</td>
					<td class="centered" width="20%">126</td>
					<td class="centered" width="20%">154</td>
					<td class="leftalign" width="20%">Italy</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=walesvitaly2008.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Ireland</td>
					<td class="centered" width="20%">144</td>
					<td class="centered" width="20%">150</td>
					<td class="leftalign" width="20%">Scotland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=irelandvscotland2008.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">France</td>
					<td class="centered" width="20%">140</td>
					<td class="centered" width="20%">157</td>
					<td class="leftalign" width="20%">England</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=francevengland2008.htm">[DETAILS]</a></td>
				</tr>												
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 5px; margin-left:10px">Sunday 9 March</td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Ireland</td>
					<td class="centered" width="20%">156</td>
					<td class="centered" width="20%">120</td>
					<td class="leftalign" width="20%">Wales</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=irelandvwales2008.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Scotland</td>
					<td class="centered" width="20%">161</td>
					<td class="centered" width="20%">129</td>
					<td class="leftalign" width="20%">England</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=scotlandvengland2008.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">France</td>
					<td class="centered" width="20%">144</td>
					<td class="centered" width="20%">142</td>
					<td class="leftalign" width="20%">Italy</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=francevitaly2008.htm">[DETAILS]</a></td>
				</tr>												
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 5px; margin-left:10px">Sunday 16 March</td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Italy</td>
					<td class="centered" width="20%">130</td>
					<td class="centered" width="20%">139</td>
					<td class="leftalign" width="20%">Scotland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=italyvscotland2008.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">England</td>
					<td class="centered" width="20%">149</td>
					<td class="centered" width="20%">132</td>
					<td class="leftalign" width="20%">Ireland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=englandvireland2008.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td class="rightalign" width="20%">Wales</td>
					<td class="centered" width="20%">137</td>
					<td class="centered" width="20%">154</td>
					<td class="leftalign" width="20%">France</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=walesvfrance2008.htm">[DETAILS]</a></td>
				</tr>		
				<tr>
					<td colspan="5" class="centered">
						<p>
							Maxi-Tennis finals day is scheduled for Sunday April 13th, between 2.30pm and 4.00pm<br />
							The results from that match will be kept <a href="showmaxiresult.asp?thefile=maxifinals2008.htm">here</a>
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
			<li><a href="maxileague2008.asp">Current Maxi-Tennis league table</a></li>
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
