<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Annual Quiz Night - Results");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
    <td>
    <comment>Content for each page placed into middle column</comment>
    <h2>Friday 26 April, 2002</h2>
<table border="0" cellspacing="2" cellpadding="5" width="440">
  <tr>
    <td class="tdfont" width="100%">At 7.30 p.m. 10 teams of determined men and women met 
    in the Hampton-in-Ardem Sports Club club house to pit their wits against each other in the
    annual Tennis Club Quiz.<br><br>
    As usual, it was a hard-fought contest, but, when the dust had settled at the end of the evening,
    quiz supremos, The Betty Ford Clinic (a.k.a. Julie and Graham Williamson and friends) were 
    runaway winners by the biggest winning margin in recent history. Well done to everyone who 
    put their intellect on the line and participated<br><br>
    Many thanks to Mo Matthews who, once again, set the questions - very challenging and we liked
    your singing really (?!).<br><br>
    Finally, once again, very warm thanks to Julie Williamson for coordinating and providing the
    food (and for succeeding in co-opting Coralie Hammond into the kitchen!). Roll on the next
    event!<br><br>
    For the statistically minded amongst you, the table below shows the scores for each half 
    of the quiz for each team and their overall score and position at the end of the night.<br><br>
    <i>N.B. Goodness knows the motivation for some of the team names - makes you wonder what is
    going on in some peoples heads, doesnt it!</i><br></td>
  </tr>
</table>
<br>
<table border="1" cellspacing="2" cellpadding="5" width="440">
  <tr>
    <td width="40%" bgcolor="#aed2ac"><b>Team Name</b></td>
    <td width="20%" bgcolor="#aed2ac" align="center">1st Half<br>Score</td>
    <td width="20%" bgcolor="#aed2ac" align="center">2nd Half<br>Score</td>
    <td width="20%" bgcolor="#aed2ac" align="center">Overall Score<br>(+position)</td>
  </tr>
  <tr>
    <td width="40%" ><b>Betty Ford Clinic</b></td>
    <td width="20%" align="center">69</td>
    <td width="20%" align="center">65.5</td>
    <td width="20%" align="center">134.5<br>(1st)</td>
  </tr>
  <tr>
    <td width="40%" ><b>Guy's Gorillas</b></td>
    <td width="20%" align="center">51</td>
    <td width="20%" align="center">61.5</td>
    <td width="20%" align="center">112.5<br>(2nd)</td>
  </tr>
  <tr>
    <td width="40%" ><b>Jimmy Neutrons</b></td>
    <td width="20%" align="center">52.5</td>
    <td width="20%" align="center">59</td>
    <td width="20%" align="center">111.5<br>(3rd)</td>
  </tr>
  <tr>
    <td width="40%" ><b>Digitally Challenged</b></td>
    <td width="20%" align="center">53.5</td>
    <td width="20%" align="center">57</td>
    <td width="20%" align="center">110.5<br>(4th)</td>
  </tr>
  <tr>
    <td width="40%" ><b>COD</b></td>
    <td width="20%" align="center">51.5</td>
    <td width="20%" align="center">55.5</td>
    <td width="20%" align="center">107<br>(5th)</td>
  </tr>
  <tr>
    <td width="40%" ><b>Novak&nbsp;&amp;&nbsp;Goode</b></td>
    <td width="20%" align="center">42</td>
    <td width="20%" align="center">59.5</td>
    <td width="20%" align="center">101.5<br>(6th)</td>
  </tr>
  <tr>
    <td width="40%" ><b>Men In Glasses</b></td>
    <td width="20%" align="center">44.5</td>
    <td width="20%" align="center">55</td>
    <td width="20%" align="center">99.5<br>(7th)</td>
  </tr>
  <tr>
    <td width="40%" ><b>Curried Twiglets</b></td>
    <td width="20%" align="center">39.5</td>
    <td width="20%" align="center">54.5</td>
    <td width="20%" align="center">95<br>(8th)</td>
  </tr>
  <tr>
    <td width="40%" ><b>No Hopers</b></td>
    <td width="20%" align="center">41</td>
    <td width="20%" align="center">40</td>
    <td width="20%" align="center">81<br>(9th)</td>
  </tr>
  <tr>
    <td width="40%" ><b>Weeds in the Rough</b></td>
    <td width="20%" align="center">33.5</td>
    <td width="20%" align="center">39</td>
    <td width="20%" align="center">72.5<br>(10th)</td>
  </tr>
</table>
    </td>
    <comment>Column 3 reserved for internal and external advertising</comment>
    <!--#include file="adverts.asp" -->
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
<%
%>
