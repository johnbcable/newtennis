<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Home Page");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Test Table Layout</title>
	<link rel="stylesheet" media="screen" type="text/css" href="tables.css" />
</head>
<body>
<div id="container">
			<table>
				<caption>Senior Committee Members</caption>
				<thead>
					<tr>
						<th>Name</th>
						<th>Role</th>
						<th>Phone Number</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="33%">Steve Ray</td>
						<td width="33%">Chairman</td>
						<td>01675 442132</td>
					</tr>
					<tr>
						<td>Chris Barnes</td>
						<td>Secretary</td>
						<td>01675 443572</td>
					</tr>
					<tr>
						<td>Carol Grant</td>
						<td>Treasurer</td>
						<td>01675 443610</td>
					</tr>
					<tr>
						<td>Geoff Redfern</td>
						<td>Committee Member</td>
						<td>01675 442447</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">
							This is the footer text to the table
						</td>
					</tr>
				</tfoot>
			</table>
</div>
</body>
</html>
<%
%>
