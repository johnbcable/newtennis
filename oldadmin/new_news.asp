<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Adding a News Item");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
var newscategorylist = new Array("ALL","ADULT","JUNIOR");
var defCategory = new String("ALL").toString();            // default news category
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<!--#include file="dateval.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>Adding a News Item</h3>
		<p>
			Fill in the form below with details of the news item. All boxes must be completed with the exception of 
			the news Starts At box (which may be left blank). Click on Submit when the news item details are ready 
			for submission.
		</p>
		<form method="post" action="set_news.asp">
			<fieldset>
				<legend>Details of News Item</legend>
				<div>
					<label for="newstitle">Name/Title for Item</label>
					<input type="text" name="newstitle" id="newstitle" size="60" maxlength="150" tabindex="1" />
				</div>
				<div>
					<label for="newsfrom">News displayed from:</label>
					<input type="text" name="newsfrom" id="newsfrom" size="10" maxlength="10" tabindex="2" onBlur="javascript:checkdate(this)" />
					<a href="javascript:NewCal('newsfrom','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>&nbsp;(dd/mm/yyyy) e.g. 09/02/2008 = 9 February 2008
				</div>
				<div>
					<label for="newsuntil">News displayed until:</label>
					<input type="text" name="newsuntil" id="newsuntil" size="10" maxlength="10" tabindex="3" />
					<a href="javascript:NewCal('newsuntil','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>&nbsp;(dd/mm/yyyy) e.g. 09/02/2008 = 9 February 2008
				</div>
				<div>
					<label for="newscategory">News category</label>
					<select name="newscategory" id="newscategory" tabindex="4">
<%
for (i=0; i<3; i++)
{
	if (newscategorylist[i]==defCategory)
		Response.Write("<option selected>"+newscategorylist[i]);
	else
		Response.Write("<option>"+newscategorylist[i]);
}
%>
					</select>	
				</div>		
				<div>
					<label for="newsblurb">News item summary:</label>
					<textarea name="newsblurb" rows="4" cols="55" tabindex="5" style="text-align:left;">Replace me with your message</textarea><br />
				</div>
				<div id="submitblock" align="right" style="clear:both;">
							<input type="hidden" name="newsid" value="-1">
							<input type="hidden" name="newone" value="Y">
							<p style="margin-right:50px;">
								<input align="right" type="submit" value="Submit">
							</p>
				</div>
			</fieldset>
		</form>
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">
<!--#include file="home_nav.asp" -->
<!--#include file="memb_nav.asp" -->	
	</div>
	<div id="footer">
<!--#include file="textnav.asp" -->
	</div>
</div>
</body>
</html>
<%
%>
