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
<h3>The Championships, Wimbledon</h3><table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
  	<td>
		<img src="images/art1.gif">
  	</td>
    <td class="tdfont">
Wimbledon is underway. Full details on British<BR>matches are 
available on LTA Online or on www.wimbledon.org<BR>&lt;<A class=fixed 
href="http://www.wimbledon.org">http://www.wimbledon.org</A>&gt; 
<BR><BR>TV Coverage<BR><BR>BBC Sport has comprehensive coverage of Wimbledon 
2003, on BBC One and<BR>Two, Radio Five Live, the BBC Sport website and 
interactive television.<BR><BR>Plus, catch our highlights programme, Today at 
Wimbledon, every weekday<BR>night of the Championship at 2130, BBC Two. 
Highlights of the previous<BR>day's play, Yesterday at Wimbledon, can be caught 
every weekday morning<BR>at 0900, BBC Two.<BR><BR>WEEK 1<BR>Monday 23 June: BBC 
One &amp; Two, 1200-2030 <BR>Tuesday 24: BBC One &amp; Two, 1200-2030 
<BR>Wednesday 25: BBC One &amp; Two, 1200-2030 <BR>Thursday 26: BBC One &amp; 
Two, 1200-2030 <BR>Friday 27: BBC One &amp; Two, 1200-2030 <BR><BR>Saturday 
28:<BR>BBC One, Yesterday at Wimbledon, 0600-0700<BR>BBC One, Grandstand, 
1210-1715<BR>BBC Two, 1200-2030, Highlights from 2130 <BR><BR>Sunday 29: BBC 
One, Yesterday at Wimbledon, 0800-0900<BR><BR>WEEK 2<BR>Monday 30: BBC One &amp; 
Two, 1200-2030 <BR>Tuesday 1 July: BBC One &amp; Two, 1200-2030 <BR>Wednesday 2 
BBC One &amp; Two, 1200-2030 <BR>Thursday 3: BBC One &amp; Two, 1200-2030 
<BR>Friday 4: BBC One &amp; Two, 1200-2030 <BR><BR>Saturday 5: BBC One &amp; 
Two, 1200-2030 <BR>BBC One, Yesterday at Wimbledon, 0600-0700<BR>BBC One, 
Grandstand, 1210-1715 (Ladies' final)<BR>BBC Two, 1700-2030, Highlights from 
2210 <BR><BR>Sunday 6: BBC One &amp; Two, 1200-2030 <BR>BBC One, Yesterday at 
Wimbledon, 0600-0700<BR>BBC One, 1330-1830 (Men's final)<BR>BBC Two, 1830-2000 
(Mixed doubles final)<BR>BBC Two, highlights from 2245 <BR><BR>Monday 7: BBC 
One, Highlights from 0600 <BR><BR></P>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>






