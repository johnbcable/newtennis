<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Maxi-Tennis 2008");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var ConnObj;
var RS, RS2, RS3;
var SQL1, SQL2, SQL3;
var myid, mymaxiteam, mymaxiteamtext;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// Now go and get Maxi-Tennis team memebership if the user has signed-in
myid = getUserCode();
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
mymaxiteam = new String("").toString();
mymaxiteamtext = new String("").toString();
SQL1 = new String("SELECT maxiteam from allmembers where uniqueref = "+myid).toString();
RS = ConnObj.Execute(SQL1);
if (! RS.EOF)
{
	mymaxiteam = new String(RS("maxiteam")).toString();
	if (mymaxiteam == "" || mymaxiteam == "null" || mymaxiteam == "undefined")
		mymaxiteamtext = new String("");
	else
	    mymaxiteamtext = new String("You are currently a member of "+mymaxiteam);
}
RS.Close();
//
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3><%= pagetitle %></h3>
		<div id="overlayboxquote" class="boxright">
			<div class="boxheader">
				It's Social!
			</div>
			<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
			<p>
				Yes, Maxi-Tennis IS a tennis competition BUT its primary aim is as a social event. 
				The club raises no money from these events; no-one is subjected to gruelling 3-hour tennis 
				matches and the tennis you do play focuses on your team effort as a whole and not on 
				you as an individual.<br /><br />
				On the social side, dress up (in primarily your team colours) to play (as long as you 
				can still safely move around the courts); watch some of the 6-Nations rugby which may be on 
				in the clubhouse; enjoy a social drink in the clubhouse bar either watching and cheering on 
				your team or as a drink well-earned when your match is over. And don't forget: the home 
				side is responsible for entertaining you (which usually includes food in some form).
			</p>
			<p class="boxsignature">Chris Barnes</p>
		</div>
		<p>
			Ready to blow-away those Christmas and New Year cobwebs? What better way than to join with  
			other tennis playing people in some team-tennis .... and enjoy it! Yes, Maxi-Tennis is Back!
		</p>
		<p>
			2008 is the third year that Hampton-In-Arden Tennis Club has run a full Maxi_tennis tournament. 2006 and 2007 
			were both great years for people involvement and enjoyment and with many new members joining the club 
			in 2007, this is an ideal way for them to get to know other club members. Your team captains have been briefed 
			and all of them will be looking to win the coveted Maxi-Tennis crown this year. England won in 2006; 2007 was 
			claimed by Italy
		</p>
		<p>
			Timetabled to run from late January until the end of March 2008, most Maxi-Tennis matches are held on Sunday 
			afternoons at Hampton-In-Arden Tennis Club. Each match lasts approx. 90 minutes and 3 matches are played 
			on each of the nominated Sunday afternoons.
		</p>
<%
if (! (mymaxiteamtext == ""))
{
%>
		<p class="borderboth">
			<span class="blueheading"><%= mymaxiteamtext %></span>
		</p>
<%
}
%>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="maxileague2008.asp">Current Maxi-Tennis league table</a></li>
				<li><a href="maxiresults2008.asp">Maxi-Tennis match results for current tournament</a></li>
				<li><a href="maxirules.asp">Maxi-Tennis rules</a></li>
			</ul>
		</div>
		<p>
			&nbsp;
		</p>
		<div id="maxitennisteambanner" class="centered">
			<!--#include file="maxitennisflags.htm" -->	
		</div>
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
