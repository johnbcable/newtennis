<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Club Tournaments");
// Now for any variables local to this page
// End of page start up coding
if (! signedin())
	Response.Redirect("jtour2006.asp");
%>
<!--#include file="junhead.asp" -->
<h3>
	<font face="Verdana"><b>Junior Tournament Results - Summer 2006 </b></font>
</h3>
<A NAME="thetop">
	<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
		<tr>
			<td>
				<table  width="100%" border="1" cellspacing="2" cellpadding="5">
					<tr>
						<td class="tdfont" >
							<font face="Verdana" size="2"><b>Hampton-In-Arden 
                            Tennis Club Senior Tennis Tournament Finals Day was 
                            held on Saturday 8 July at the club. The finalsists from the Junior Club Tournament
                            held on Saturday June 17th played their finals matches on this
                            day as well. The results are displayed below. </b>  </font>
                            <table  width="596" border="1" cellspacing="2" cellpadding="5">
								<tr>
									<td bgcolor=#c0c0c0 width="213">
										<font face="Verdana" size="2">
										<b>
											Category
										</b>
									    </font>
									    <p>
										<font face="Verdana" size="2">
										<b>
											Winner<br><i>Runner-Up</i></a></b></font></td>
									<td bgcolor=#c0c0c0 width="152">
										<font face="Verdana" size="2">
										<b>
											Winner(s)<br>&nbsp;</b></font></td>
									<td bgcolor=#c0c0c0 width="185">
										<font face="Verdana" size="2"><b>
                                        Runner(s)-Up</b></font></td>
								</tr>
								<tr>
									<td class=tdfont valign=center width="213">
										<b>
										<font face="Verdana" size="2">Under 12 Boys Singles
                                        </font>
									    </b>
									    <p>
										<font face="Verdana" size="2">Oliver Davies<br><i>Jamie Turpin</i></font></a></td>
									<td class=tdfont align=center valign="center" width="152">
										<font face="Verdana" size="2">No picture</font></td>
									<td class=tdfont align=center valign="center" width="185">
										<font face="Verdana" size="2">No picture</font></td>
								</tr>
								<tr valign=center>
									<td class=tdfont width="213">
										<b>
										<font face="Verdana" size="2">Under 16 Boys Singles
                                        </font>
									    </b>
									    <p>
										<font face="Verdana" size="2">Jacob Pratt<br>
                                        <i>Connor Jones</i></font></a></td>
									<td class=tdfont valign=center width="152">
                                        <img border="0" src="Images/tn_u16b2006w.JPG"></b></a></td>
									<td class=tdfont align=center valign="center" width="185">
										<font face="Verdana" size="2">No picture</font></td>
								</tr>
								<tr>
									<td class=tdfont width="213">
										<b>
										<font face="Verdana" size="2">Under 12 Girls Singles</font></b><p>
										<font face="Verdana" size="2">Emily Hodge<br><i>Emily Cable</i></font></a></td>
									<td class=tdfont valign=center width="152">
                                        <img border="0" src="Images/tn_u12g2006w.JPG"></b></a></td>
									<td class=tdfont align=center valign="center" width="185">
										<font face="Verdana" size="2">No picture</font></td>
								</tr>
								<tr>
									<td class=tdfont width="213">
										<b>
										<font face="Verdana" size="2">Under 16 Girls Singles
                                        </font>
									    </b>
									    <p>
										<font face="Verdana" size="2">Rachel Finch<br><i>Emily Hodge</i></font></a></td>
									<td class=tdfont align=center valign="center" width="152">
										<font face="Verdana" size="2">No picture</font></td>
									<td class=tdfont valign=center width="185">
                                        <img border="0" src="Images/tn_u16g2006ru.JPG"></b></td>
								</tr>
							</table>
							<b>
							<br>
							<font face="Verdana" size="2">
                            <img border="0" src="Images/tn_DennisthePratt.JPG" align="left">Many thanks to Dennis 
                            Pratt for taking the time to take the photos and 
                            letting us use them - same time again next year 
                            Dennis?</font></b><p><b>
							<font face="Verdana" size="2">Refreshments (coffees, teas, sweets 
                            and the famous Phil McCracken punch etc) were available 
            as normal from the clubhouse kitchen .... + the ever faithful BBQ 
                            outside. Many grateful thanks to all the volunteers!!<br>&nbsp;<br>
				&nbsp;A great day for everyone, both players and spectators - our league team players 
                            have some stiff competition for their team places in 
                            the not-too-distant future!</font> </b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<b>
	<br>
	<!--#include file="textnav.asp" -->
</BODY>
</HTML>
</b>
</a>
<%
%>