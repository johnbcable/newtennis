<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("MAXI-Tennis Results - Spring 2006");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<h3>Spring 2006 MAXI-Tennis Summary Results</h3>
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
    <td>
		<table align="center" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="90%">
    <tr>
      <td align="left" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0"><b>Sunday 5 February</b></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">Ireland</td>
      <td align="center" width="20%">118</td>
      <td align="center" width="20%">157</td>
      <td align="left" style="margin-left:20px">Italy</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=irelandvitaly2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">England</td>
      <td align="center" width="20%">151</td>
      <td align="center" width="20%">134</td>
      <td align="left" style="margin-left:20px">Wales</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=englandvwales2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">Scotland</td>
      <td align="center" width="20%">158</td>
      <td align="center" width="20%">150</td>
      <td align="left" style="margin-left:20px">France</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=scotlandvfrance2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="left" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0"><b>Sunday 26 February</b></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">France</td>
      <td align="center" width="20%">147</td>
      <td align="center" width="20%">159</td>
      <td align="left" style="margin-left:20px">Italy</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=francevitaly2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">Scotland</td>
      <td align="center" width="20%">108</td>
      <td align="center" width="20%">173</td>
      <td align="left" style="margin-left:20px">England</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=scotlandvengland2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">Ireland</td>
      <td align="center" width="20%">154</td>
      <td align="center" width="20%">142</td>
      <td align="left" style="margin-left:20px">Wales</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=irelandvwales2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="left" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0"><b>Sunday 5 March</b></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">France</td>
      <td align="center" width="20%">143</td>
      <td align="center" width="20%">131</td>
      <td align="left" style="margin-left:20px">Ireland</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=francevireland2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">Italy</td>
      <td align="center" width="20%">142</td>
      <td align="center" width="20%">154</td>
      <td align="left" style="margin-left:20px">England</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=italyvengland2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">Wales</td>
      <td align="center" width="20%">163</td>
      <td align="center" width="20%">109</td>
      <td align="left" style="margin-left:20px">Scotland</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=walesvscotland2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="left" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0"><b>Sunday 12 March</b></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">Wales</td>
      <td align="center" width="20%">162</td>
      <td align="center" width="20%">137</td>
      <td align="left" style="margin-left:20px">Italy</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=walesvitaly2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">Ireland</td>
      <td align="center" width="20%">141</td>
      <td align="center" width="20%">139</td>
      <td align="left" style="margin-left:20px">Scotland</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=irelandvscotland2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">France</td>
      <td align="center" width="20%">142</td>
      <td align="center" width="20%">150</td>
      <td align="left" style="margin-left:20px">England</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=francevengland2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="left" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0"><b>Sunday 19 March</b></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">Italy</td>
      <td align="center" width="20%">158</td>
      <td align="center" width="20%">133</td>
      <td align="left" style="margin-left:20px">Scotland</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=italyvscotland2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">Wales</td>
      <td align="center" width="20%">168</td>
      <td align="center" width="20%">130</td>
      <td align="left" style="margin-left:20px">France</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=walesvfrance2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px">England</td>
      <td align="center" width="20%">130</td>
      <td align="center" width="20%">151</td>
      <td align="left" style="margin-left:20px">Ireland</td>
      <td width="20%"><a href="showmaxiresult.asp?thefile=englandvireland2006.htm">[DETAILS]</a></td>
    </tr>
    <tr>
      <td align="center" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0"><br><b>MAXI-Tennis Finals day is Saturday 1 April</b><br>&nbsp;</td>
    </tr>
  </table>
		<br>
		<p align="center">
			For a summary MAXI-Tennis league table please click <a href="maxileague2006.asp">here</a>.
		</p>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
