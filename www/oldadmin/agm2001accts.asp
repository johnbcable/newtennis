<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Tennis Club Accounts 2000/2001");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <comment>Column 1 reserved for navigation menu - not implemented on this page</comment>
    <comment>Replaced by a fixed width spacer column</comment>
		<td width="50">
			&nbsp;
		</td>
    <td>
    <comment>Content for each page placed into middle column</comment>
	<u><b>Hampton-In-Arden Tennis Club</b></u><br>
	<u><b>Analysis of Income and Expenditure 1 November 2000 to 31 October 2001</b></u>
	<br><br>
	<table border="0" width="100%" cellpadding="5">
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><b>2000/2001<br>£</b></td>
    <td class="tdfont" align="right" width="20%">1999/2000<br>£</td>
    <td class="tdfont" align="right" width="20%"><i>1997/1998<br>£</i></td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%"><b><u>Subscription fees</u></b></td>
    <td class="tdfont" align="right" width="20%"><b>8,354&nbsp;</b></td>
    <td class="tdfont" align="right" width="20%">7,510&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>4,558&nbsp;</i></td>
  </tr>
  <tr>
    <td colspan="4"><u><b>Coaching</b></u></td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Coaching income</td>
    <td class="tdfont" align="right" width="20%"><b>4,733</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">3,402&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>1,677</i>&nbsp;</td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Coaching fees&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><b>(3,391)</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">(2,123)&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>(1,495)</i>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#c0c0c0" class="tdfont" align="left" width="40%">&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%"><b>1,342</b>&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%">1,279&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%"><i>182</i>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4"><u><b>Social events</b></u></td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Proceeds</td>
    <td class="tdfont" align="right" width="20%"><b>1,195</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">934&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>699</i>&nbsp;</td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Costs&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><b>(850)</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">(624)&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>(328)</i>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#c0c0c0" class="tdfont" align="left" width="40%">&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%"><b>345</b>&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%">310&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%"><i>371</i>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4"><u><b>Grants</b></u></td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Funds received</td>
    <td class="tdfont" align="right" width="20%"><b>400</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">0&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>0</i>&nbsp;</td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Application of funds&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><b>(400)</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">0&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>0</i>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#c0c0c0" class="tdfont" align="left" width="40%">&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%"><b>0</b>&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%">0&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%"><i>0</i>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4"><u><b>Other costs</b></u></td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Maintenance &amp; Repairs</td>
    <td class="tdfont" align="right" width="20%"><b>(941)</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">0&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>(1,703)</i>&nbsp;</td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;League/affiliation fees&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><b>(747)</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">(653)&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>(381)</i>&nbsp;</td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tennis balls&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><b>(510)</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">(630)&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>(509)</i>&nbsp;</td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trophies/tournament prizes&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><b>(486)</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">(80)&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>(188)</i>&nbsp;</td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Miscellaneous&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><b>(261)</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">(647)&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>(876)</i>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#c0c0c0" class="tdfont" align="left" width="40%">&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%"><b>(2,945)</b>&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%">(2,010)&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%"><i>(3,657)</i>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4"><u><b>Wimbledon tickets</b></u></td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Income</td>
    <td class="tdfont" align="right" width="20%"><b>572</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">366&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>406</i>&nbsp;</td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Costs&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><b>(572)</b>&nbsp;</td>
    <td class="tdfont" align="right" width="20%">(366)&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>(406)</i>&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#c0c0c0" class="tdfont" align="left" width="40%">&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%"><b>0</b>&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%">0&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%"><i>0</i>&nbsp;</td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%"><b>NET CONTRIBUTION</b></td>
    <td class="tdfont" align="right" width="20%"><b>7,096&nbsp;</b></td>
    <td class="tdfont" align="right" width="20%">7,089&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>1,454&nbsp;</i></td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%"><b>Contribution to Sports Club</b></td>
    <td class="tdfont" align="right" width="20%"><b>(2,274)&nbsp;</b></td>
    <td class="tdfont" align="right" width="20%">(2,550)&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>&nbsp;</i></td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%"><b>Contribution to Sinking Fund</b></td>
    <td class="tdfont" align="right" width="20%"><b>(3,400)&nbsp;</b></td>
    <td class="tdfont" align="right" width="20%">(3,400)&nbsp;</td>
    <td class="tdfont" align="right" width="20%"><i>&nbsp;</i></td>
  </tr>
  <tr>
    <td bgcolor="#c0c0c0" class="tdfont" align="left" width="40%">&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%"><b>1,422</b>&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%">1,139&nbsp;</td>
    <td bgcolor="#c0c0c0" class="tdfont" align="right" width="20%">&nbsp;</td>
  </tr>
  <tr>
    <td class="tdfont" align="left" width="40%" colspan="4"><b>Note: Balance on Sinking Fund at 30 April 2001 was £6,800</b></td>
  </tr>
</table>
    </td>
    <comment>Column 3 reserved for internal and external advertising - not implemented on this page</comment>
    <comment>Replaced by a fixed width spacer column</comment>
		<td width="50">
			&nbsp;
		</td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>


































