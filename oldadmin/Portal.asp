<%@language="JScript" CODEPAGE="65001"%>
<%
var strtime, strdate, greeting, d,usermotd;
function timestring() {
var d, hh, mm, ss, s = ""
var c = ":"
d = new Date();
hh=d.getHours();
mm=d.getMinutes();
ss=d.getSeconds();
if (hh < 10)
s += "0";
s += hh + c;
if (mm < 10)
s += "0";
s += mm + c;
if (ss < 10)
s += "0";
s += ss;
return (s)
}
function datestring(){
   var d, day, x, s = "";
   var x = new Array("Sunday", "Monday", "Tuesday");
   var x = x.concat("Wednesday","Thursday", "Friday");
   var x = x.concat("Saturday");
   d = new Date();
   day = d.getDay();
   s += x[day] + " "
   s += d.getDate() + "/";
   s += (d.getMonth() + 1) + "/";
   s += d.getYear();
   return(s);
}
function timegreeting() {
var d, h, s = "Good "
d = new Date();
h = d.getHours();
if (h < 12)
s += "morning";
else
s += "afternoon";
return (s)
}
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
greeting = timegreeting();
// Set application menu dependent on signedon user
Session("appmenu")="1.xml";
SetSecLevel()
Session("appmenu")=Session("seclevel").concat(".xml")
// Now check and set any current MOTD string for this user
usermotd = ""
// End of page start up coding
%>
<html>
<head>
<title>ICIS Support Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel=STYLESHEET type="text/css" href="menuStyle.css">
<Script Language="JavaScript" src="XMLMenuScript.js"></script>
<SCRIPT LANGUAGE=javascript>
<!--
    if (!document.all)
        alert("Sorry, this feature requires IE4 or higher.");

//-->
</SCRIPT>
</head>
<body id="body" bgcolor="#FFFFFF" style="margin-top:-2 px; margin-left:0 px">
<TABLE BORDER=0 WIDTH=100% BGCOLOR="black" CELLPADDING="0" CELSPACING="0" COLS="*,95">
    <TR>
        <td class="tdfont" ALIGN="LEFT" VALIGN=TOP>
        <center><FONT FACE="Arial" COLOR=#c0c0c0><H3>ICIS - Support Area<BR><%= strtime %> - <%= strdate %></H3></FONT><br></center>
        </TD>
        <TD>
            <IMG SRC="../images/egypt1.jpg" WIDTH="95" HEIGHT="61" ALT="">
        </TD>
    </TR>
</TABLE>
<!--#include file="topmenu.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td class="tdfont" bgcolor="#ffff80" colspan="2">&nbsp;<br>
        <font color="#ff0000" size="3" face="Arial">&nbsp;&nbsp;<b><i><%= greeting %>&nbsp;<%= Session("username") %></i></b></font>
        <center><font size="3" color="#000000" face="Arial"><b>Welcome to the ICIS Support Centre</b></font></center>
		  </h3>
        <%= usermotd %>&nbsp;<br>
        </td>
    </tr>
	<tr>
		<td class="tdfont" width="50" nowrap>
			&nbsp;
		</td>
		<td>
			<br>
			<font size="2" color="#000000" face="Arial">
				The ICIS Support Centre gathers together tools that can help you check out certain information on ICIS. All of these are accessible from the menu bar at the top of each page as follows:<br><br>
			</font>
		</td>
	</tr>
	<tr>
		<td class="tdfont" colspan="2">
	                <table border="0" cellspacing="0" cellpadding="0" cols="4">
      	            <tr align="left" valign="top">
	                    <td class="tdfont" bgcolor="white" nowrap width="50">&nbsp;</td>
      	              <td class="tdfont" bgcolor="black" nowrap><a style="font: 10pt arial; color: #FFFFFF;text-decoration: none;"><b><font color="#FFFFFF">Home</font></b></a></td>
	                    <td class="tdfont" bgcolor="white" nowrap width="50">&nbsp;</td>
				  <td class="tdfont" bgcolor="white"><font  size="2" color="#000000" face="Arial">Re-displays this page</font><br></td>
				</tr>
      	            <tr align="left" valign="top">
	                    <td class="tdfont" bgcolor="white" colspan="4">&nbsp;</td>
				</tr>
      	            <tr align="left" valign="top">
	                    <td class="tdfont" bgcolor="white" nowrap width="50">&nbsp;</td>
		               <td class="tdfont" bgcolor="black" nowrap><a style="font: 10pt arial; color: #FFFFFF;text-decoration: none; cursor: hand"><b><font color="#FFFFFF">Menu</font></b><img src="./images/yellow_arrow_down2.gif" width="20" height="11" border=0></a></td>
	                    <td class="tdfont" bgcolor="white" nowrap width="50">&nbsp;</td>
				  <td class="tdfont" bgcolor="white"><font  size="2" color="#000000" face="Arial">Choose what you want to do from these drop-down menus.</font><br></td>
				</tr>
      	            <tr align="left" valign="top">
	                    <td class="tdfont" bgcolor="white" colspan="4">&nbsp;</td>
				</tr>
      	            <tr align="left" valign="top">
	                    <td class="tdfont" bgcolor="white" nowrap width="50">&nbsp;</td>
      	              <td class="tdfont" bgcolor="black" nowrap><a style="font: 10pt arial; color: #FFFFFF;text-decoration: none;"><b><font color="#FFFFFF">F.A.Q.</font></b></a></td>
	                    <td class="tdfont" bgcolor="white" nowrap width="50">&nbsp;</td>
				  <td class="tdfont" bgcolor="white"><font  size="2" color="#000000" face="Arial">Takes you through to the Frequently Asked Questions page.</font><br></td>
				</tr>
      	            <tr align="left" valign="top">
	                    <td class="tdfont" bgcolor="white" colspan="4">&nbsp;</td>
				</tr>
      	            <tr align="left" valign="top">
	                    <td class="tdfont" bgcolor="white" nowrap width="50">&nbsp;</td>
      	              <td class="tdfont" bgcolor="black" nowrap><a style="font: 10pt arial; color: #FFFFFF;text-decoration: none;"><b><font color="#FFFFFF">ICIS Team</font></b></a></td>
	                    <td class="tdfont" bgcolor="white" nowrap width="50">&nbsp;</td>
				  <td class="tdfont" bgcolor="white"><font  size="2" color="#000000" face="Arial">The ICIS Project Team's information site. Clicking this will take you there.</font><br></td>
				</tr>
	                </table>
	        </td>
       </tr>
       <tr>
		<td>&nbsp;
		</td>
	  </tr>
       <tr>
		<td class="tdfont" align="center" bgcolor="efefef">
             </td>
	 </tr>
</table>
<!--#include file="XMLCreateMenu_Dynamic.asp"-->
<!--#include file="security.asp"-->
<!--#include file="motd.asp"-->
</body>
</html>
