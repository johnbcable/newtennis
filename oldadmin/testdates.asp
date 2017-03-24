<%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Page to test date input</title>
	<script language="Javascript" src="datetimepicker.js"></script>
	<style type="text/css">
	/*  Now for forms interface elements styles */
	input {
		margin-right: 10px;
	}
input.txt {
  color: #00008B;
  background-color: #E3F2F7;
  border: 1px inset #00008B;
  width: 200px;
}
input.btn {
  color: #00008B;
  background-color: #ADD8E6;
  border: 1px outset #00008B;
}
form div {
  clear: left;
  margin: 0;
  padding: 0;
  padding-top: 0.25em;
  line-height: 18px;
}
form div label {
  float: left;
  width: 30%;
  font: bold 1.0em Verdana, Arial, Helvetica, sans-serif;
  padding-left: 20px;
}
form div textarea {
  display: block;
  float: right;
  clear: both;
  margin-bottom: 5px;
}
fieldset {
	width: 75%;
	border: 1px solid #000000;
	margin: 0.4em auto 0 auto;
	padding: 0.4em;
}
legend {
  font: bold 1.0em Verdana Arial, Helvetica, sans-serif;
  background-color: #686397; 
  color: #FFFFFF;
}
.akey {
  text-decoration: underline;
}
/* styles for form elements that contain a date picker capability */
/*
.datepicker input {
	float: left;
	width: 10%;
}
.datepicker a img{        
	position:relative;
}
*/
/* End of forms interface elements styles */
	</style>
</head>
<body>
	<div id="formdiv">
		<form name="MemberForm" action="set_memb.asp" method="post">
				<fieldset>
					<legend>Dates</legend>
						<div class="datepicker">
							<label for="MemberDOB">Date of Birth:</label>
							<input type="text" name="MemberDOB" id="MemberDOB" size="10" maxlength="10" value="<%= mDob %>" onBlur="javascript:checkdate(this)" />
							<a href="javascript:NewCal('MemberDOB','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>
						</div>
						<div class="datepicker">
							<label for="MemberJoined">Date Joined Club:</label>
							<input type="text" name="MemberJoined" id="MemberJoined" size="10" maxlength="10" value="<%= mJoined %>" onBlur="javascript:checkdate(this)" />
							<a href="javascript:NewCal('MemberJoined','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>
						</div>
						<div class="datepicker">
							<label for="MemberLeft">Date Left Club:</label>
							<input type="text" name="MemberLeft" id="MemberLeft" size="10" maxlength="10" value="<%= mLeft %>" onBlur="javascript:checkdate(this)" />
							<a href="javascript:NewCal('MemberLeft','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>
						</div>
				</fieldset>
		</form>
	</div>
</body>
</html>
<%
%>		