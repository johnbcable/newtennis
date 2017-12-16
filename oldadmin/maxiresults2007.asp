<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("MAXI-Tennis Results - Spring 2007");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<h3>Spring 2007 MAXI-Tennis Summary Results</h3>
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
    <td>
		<table align="center" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="90%">
    <tr>
      <td align="left" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0">
      <font face="Verdana" size="2"><b>Sunday 
      21 January</b></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">England</font></td>
      <td align="center" width="20%">153</td>
      <td align="center" width="20%">152</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">Italy</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=englandvitaly2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px" bgcolor="#FFFF00"><font face="Verdana" size="2">Scotland</font></td>
      <td align="center" width="20%" bgcolor="#FFFF00">142</td>
      <td align="center" width="20%" bgcolor="#FFFF00">152</td>
      <td align="left" style="margin-left:20px" bgcolor="#FFFF00"><font face="Verdana" size="2">Wales</font></td>
      <td width="20%" bgcolor="#FFFF00"><font face="Verdana" size="2">&nbsp; *</font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">Ireland</font></td>
      <td align="center" width="20%">126</td>
      <td align="center" width="20%">163</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">France</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=irelandvfrance2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="left" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0">
      <font face="Verdana" size="2"><b>
      Sunday 4 February</b></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">Italy</font></td>
      <td align="center" width="20%">156</td>
      <td align="center" width="20%">133</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">France</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=italyvfrance2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">England</font></td>
      <td align="center" width="20%">171</td>
      <td align="center" width="20%">114</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">Scotland</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=englandvscotland2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">Wales</font></td>
      <td align="center" width="20%">148</td>
      <td align="center" width="20%">149</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">Ireland</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=walesvireland2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="left" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0">
      <font face="Verdana" size="2"><b>Sunday 
      25 February</b></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">Scotland</font></td>
      <td align="center" width="20%">128</td>
      <td align="center" width="20%">162</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">Italy</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=scotlandvitaly2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">Ireland</font></td>
      <td align="center" width="20%">142</td>
      <td align="center" width="20%">148</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">England</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=irelandvengland2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">Wales</font></td>
      <td align="center" width="20%">159</td>
      <td align="center" width="20%">138</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">France</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=walesvfrance2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="left" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0">
      <font face="Verdana" size="2"><b>Sunday 11 March</b></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">Scotland</font></td>
      <td align="center" width="20%">141</td>
      <td align="center" width="20%">159</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">Ireland</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=scotlandvireland2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">Italy
      </font> </td>
      <td align="center" width="20%">149</td>
      <td align="center" width="20%">141</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">Wales</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=italyvwales2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">England</font></td>
      <td align="center" width="20%">125</td>
      <td align="center" width="20%">154</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">France</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=englandvfrance2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="left" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0">
      <font face="Verdana" size="2"><b>
      Sunday 25 March</b></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">Italy</font></td>
      <td align="center" width="20%">153</td>
      <td align="center" width="20%">137</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">Ireland</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=italyvireland2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">France</font></td>
      <td align="center" width="20%">160</td>
      <td align="center" width="20%">137</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">Scotland</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=francevscotland2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="right" style="margin-left:20px"><font face="Verdana" size="2">Wales</font></td>
      <td align="center" width="20%">155</td>
      <td align="center" width="20%">130</td>
      <td align="left" style="margin-left:20px"><font face="Verdana" size="2">England</font></td>
      <td width="20%"><font face="Verdana" size="2"><a href="showmaxiresult.asp?thefile=walesvengland2007.htm">[DETAILS]</a></font></td>
    </tr>
    <tr>
      <td align="center" style="margin-left:10px" colspan="5" bgcolor="#c0c0c0">
      <font face="Verdana" size="2"><br><b>MAXI-Tennis Finals day was on Saturday 
      31 March, 4.30pm to 6.00pm between Italy and Wales</b><br>The details of the result can be found <a href="showmaxiresult.asp?thefile=maxifinals2007.htm">here</a>&nbsp;</font></td>
    </tr>
  </table>
		<p align="center">*<font face="Verdana" size="2"> No score sheet was 
        available for the Scotland - Wales match. The scores have been estimated 
        given team captains recollection of a 10-point difference</font><br>
		</p>
		<p align="center">
			<font face="Verdana" size="2">For a summary MAXI-Tennis league table 
            for the above season please click <a href="maxileague2007.asp">here</a>.
            </font>
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
