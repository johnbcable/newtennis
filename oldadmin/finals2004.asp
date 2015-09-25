<style>
<!--
 table.MsoNormalTable
	{mso-style-parent:"";
	font-size:10.0pt;
	font-family:"Verdana"}
-->
</style>
<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("<<pagetitle >>");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
    <td>
    <p class="MsoNormal" style="margin-right: -0.75pt" align="center"><b>
    <font color="#0000FF" size="6">Finals Day -
    Saturday 10 July<br>
    Order of Play</font></b></p>
    <div align="center">
      <table class="MsoNormalTable" style="BORDER-COLLAPSE: collapse" cellSpacing="0" cellPadding="0" border="0">
        <tr>
          <td style="width: 400.25pt; padding-left: 3.75pt; padding-right: 3.75pt; padding-top: 0cm; padding-bottom: 0cm; background: #ffff99" vAlign="top" width="515" bgColor="#ffff99">
          <font size="3">
          <h5 style="MARGIN: 0cm 0cm 0pt" align="center"><font face="Verdana" size="3" color="#FF0000">&nbsp;</font></h5>
          <table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" height="162" style="border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: silver" fpstyle="9,011111100">
            <tr>
              <td width="14%" height="19" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon">
              <font face="Verdana" size="2">Time</font></td>
              <td width="33%" height="19" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon">
              <font face="Verdana" size="2">Match</font></td>
              <td width="10%" align="center" height="19" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon">
              <font face="Verdana" size="2">Court</font></td>
              <td width="43%" height="19" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon">
              <font face="Verdana" size="2">Players</font></td>
            </tr>
            <tr>
              <td width="14%" height="22" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">1:30 pm</font></td>
              <td width="33%" height="22" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Men's Singles</font></td>
              <td width="10%" align="center" height="22" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">1</font></td>
              <td width="43%" height="22" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Andy Williamson v Chester Barnes</font></td>
            </tr>
            <tr>
              <td width="14%" height="19" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">1:30 pm</font></td>
              <td width="33%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Mixed Doubles</font></td>
              <td width="10%" align="center" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">3</font></td>
              <td width="43%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Jane Hodge/Steve Ray v Terri 
              Mason/Malcolm Brumwell or Kath and Matthew Hunt</font></td>
            </tr>
            <tr>
              <td width="14%" height="19" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">3:00 pm</font></td>
              <td width="33%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Ladies Singles</font></td>
              <td width="10%" align="center" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">1</font></td>
              <td width="43%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Jane Hodge v Lara Bates or Chris 
              Durbin</font></td>
            </tr>
            <tr>
              <td width="14%" height="19" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">3:00 pm</font></td>
              <td width="33%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Mixed Plate</font></td>
              <td width="10%" align="center" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">2</font></td>
              <td width="43%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">TBA</font></td>
            </tr>
            <tr>
              <td width="14%" height="19" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">3:00 pm</font></td>
              <td width="33%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Men's Veteran Doubles</font></td>
              <td width="10%" align="center" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">3</font></td>
              <td width="43%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Phil McCracken/Dave Teasdale v 
              Chester Barnes/Steve Ray</font></td>
            </tr>
            <tr>
              <td width="14%" height="19" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">4:30 pm</font></td>
              <td width="33%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Ladies Doubles</font></td>
              <td width="10%" align="center" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">1</font></td>
              <td width="43%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Terri Mason/Kathy Hunt v Carol 
              Grant/Jane Hodge</font></td>
            </tr>
            <tr>
              <td width="14%" height="19" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">4:30 pm</font></td>
              <td width="33%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Men's Doubles</font></td>
              <td width="10%" align="center" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">3</font></td>
              <td width="43%" height="19" style="color: black; border-style: none; background-color: #FFFFEF">
              <font face="Verdana" size="2">Bert Bodfish/Chester Barnes v Rob 
              Yates/Steve Ray</font></td>
            </tr>
          </table>
          <h5 style="MARGIN: 0cm 0cm 0pt" align="left">&nbsp;</h5>
          </font>
          <font size="2">
          <p style="MARGIN: 0cm 0cm 0pt" align="left"><font face="Verdana">Notes</font></p>
          <ol>
            <li>
          <p style="MARGIN: 0cm 0cm 0pt" align="left"><font face="Verdana">
          Players should arrive in good time for play to commence promptly</font></li>
          <li>
          <p style="MARGIN: 0cm 0cm 0pt" align="left"><font face="Verdana">
          Trophy presentations to take place at 6:00 pm</font></li>
          <li>
          <p style="MARGIN: 0cm 0cm 0pt" align="left"><font face="Verdana">After 
          the start of the first matches, subsequent timings are approximate</font></li>
        <li>
          <p style="MARGIN: 0cm 0cm 0pt" align="left"><font face="Verdana">The 
          timing of the Mixed Plate may change dependent upon the finalists</font></li>
      </ol>
          </font>
          <font size="3">
          <h5 style="MARGIN: 0cm 0cm 0pt" align="center">
          <font face="Verdana" size="3">Come along and support your club-mates.</font></h5>
          <p style="MARGIN: 0cm 0cm 0pt" align="center">&nbsp;</p>
          <p style="MARGIN: 0cm 0cm 0pt" align="center"><font face="Verdana"><b>
          Volunteers required to supervise the BBQ</b><br>
          </font>
          </font><font face="Verdana">
          <font size="2">
          (anyone willing to volunteer, please contact Steve Ray on Hampton 
          (01675) 442132)</font><font size="3"><br>
          <b>All BBQ profits will go to Sports Relief</b><br>
&nbsp;</font></font><font size="3"></p>
          <p style="MARGIN: 0cm 0cm 0pt" align="center"><u><i><b>
          <font face="Verdana" color="#FF0000">Don't forget to wear your one red 
          sock!!</font></b></i></u></p>
          <p style="MARGIN: 0cm 0cm 0pt" align="center">&nbsp;</p>
          </font></td>
        </tr>
      </table>
    </div>
    <p>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
