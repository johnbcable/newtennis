<%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="3col.css" />
	<link rel="stylesheet" type="text/css" href="softboxes.css" />
	<!--
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" />
	-->
	<link rel="stylesheet" media="print" type="text/css" href="3col.css" />
	<script language="Javascript" src="datetimepicker.js"></script>
	<script language="Javascript" src="minmax.js"></script>
</head>
<body>
<div id="container">
	<div id="masthead">
		<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
		<h2>Hampton-In-Arden Sports Club</h2>
		<h3>Tennis Section</h3>
	</div>
	<div id="navigation">
		<ul id="navlinks">
			<li class="first"><a href="aboutus.asp" alt="An overview of the information we have about our club">Our Club</a></li>
			<li><a href="adult_juniors/coaching.html" alt="An introduction to the adult coaching provision within the club">Coaching</a></li>
			<li><a href="playing.asp" alt="A guide to the various playing opportunities that exist at the club for adults">Playing</a></li>
			<li><a href="juniors/index.html" alt="A special section of the web site dealing with matters most relevant to junior members">Juniors</a></li>
			<li class="last"><a href="members.asp" alt="A section of the site providing further information for existing club members">Members</a></li>
		</ul>
		<p id="today">
			<%= strdate %>
		</p>		
	</div>

