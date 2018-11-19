<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("<<pagetitle >>");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
var myname, displaydate;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
myname = new String("").toString();
if (signedin())
	myname = getUserName();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
//
// Now get the dob from the form (or query string) and
// calculate which bit of the competition framework to 
// redirect to
//
var mydob = new String(Request.Form("dob")).toString();
if (mydob == "" || mydob == "null" || mydob == "undefined")
{
  mydob = new String(Request.QueryString("dob")).toString();
  if (mydob == "" || mydob == "null" || mydob == "undefined")
    mydob = new String("");
}
var debug = new String(Request.Form("debug")).toString();
if (debug == "" || debug == "null" || debug == "undefined")
{
  debug = new String(Request.QueryString("debug")).toString();
  if (debug == "" || debug == "null" || debug == "undefined")
    debug = new String("N");
}
debugging = false;
// if (mydob == "")
//  Response.Redirect("framework.asp");
var dobday, dobmonth, dobyear;
var dobparts = mydob.split("/");
if (dobparts.length != 3)
  Response.Redirect("framework.asp");
dobday = new Number(dobparts[0]).toString();
dobmonth = new Number(dobparts[1]).toString();
dobyear = new Number(dobparts[2]).toString();
var dobdate = new Date(dobparts[2],(dobparts[1]-1),dobparts[0]);
var today = new Date();
var todayday = today.getDate();
var todaymonth = today.getMonth()+1;
var todayYear = today.getFullYear();
var yearage = todayYear - dobyear;
var myageinmonths; 
if ( todaymonth > dobmonth)
{
  myageinyears = yearage;
  myageinmonths = (myageinyears * 12) + (todaymonth-dobmonth);
}
else
{
  if ( todaymonth < dobmonth)
  {
    myageinyears = yearage - 1;
    myageinmonths = (myageinyears * 12) + (todaymonth);
  }
  else   // todays month = my dob month
  {
    if (todayday < dobday)
    {
      myageinyears = yearage -1;
      myageinmonths = (myageinyears * 12) + (todaymonth);
    }
    else
    {
      if (todayday == dobday)
      {
        myageinyears = yearage;
        myageinmonths = (myageinyears * 12);
      }
     else
     {
        myageinyears = yearage;
        myageinmonths = (myageinyears * 12) + (todaymonth - 1);
     }
    }
  }
}
var myageinms = today-dobdate;
var oneMinute = 60 * 1000  // milliseconds in a minute
var oneHour = oneMinute * 60
var oneDay = oneHour * 24
var oneWeek = oneDay * 7
var myageinweeks = Math.round((myageinms/oneWeek));
var ydummy = Math.round(myageinweeks % 52);
mydob = dateasstring(dobdate);
// if (ydummy > 0)
//  myageinyears = myageinyears - 1;
//
// Age calculation done - now reroute to required cf page
//
// if (myageinyears < 8)
//  Response.Redirect("minired.asp?dob="+mydob);
// if (myageinyears > 18)
//  Response.Redirect("nomini.asp?zz="+myageinyears+"&dob="+mydob);
// if (myageinyears > 10)
//  Response.Redirect("miniyellow.asp?dob="+mydob);
// if (myageinyears > 9)
//  Response.Redirect("minigreen.asp?dob="+mydob);
// if (myageinyears > 8)
//  Response.Redirect("miniorange.asp?dob="+mydob);
// if (myageinyears == 8)
//  Response.Redirect("minired.asp?dob="+mydob+"&transition=Y");
// End of page start up coding
%>
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Hampton-in-Arden Tennis Club - Where Do I Fit In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="Description" lang="en" content="Hampton in Arden Tennis Club web site">
    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="Hampton in Arden Tennis Club web site">
    <meta itemprop="description" content="Hampton in Arden tennis club is a family-friendly tennis club in the green belt area around Solihull ">
    <meta itemprop="image" content="https://hamptontennis.org.uk/img/logos/logo.gif">
    <!-- Twitter Card data -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@hamptontennis">
    <meta name="twitter:title" content="Hampton in Arden Tennis Club web site">
    <meta name="twitter:description" content="Your family-friendly tennis club in Solihull">
    <meta name="twitter:creator" content="@author_handle">
    <meta name="twitter:image:src" content="https://hamptontennis.org.uk/img/logos/logo.gif">
    <!-- Open Graph meta information -->
    <meta property="og:title" content="Hampton in Arden Tennis Club">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://hamptontennis.org.uk/index.html">
    <meta property="og:image" content="https://hamptontennis.org.uk/img/logos/logo.gif">
    <meta property="og:description" content="Your family-friendly tennis club in Solihull">
    <!-- Apple touch icon links -->
    <link rel="icon" sizes="192x192" href="/img/logos/icon192.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180" href="/img/logos/icon180.png">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="/img/logos/icon152.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/img/logos/icon144.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="/img/logos/icon120.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/img/logos/icon114.png">
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="/img/logos/icon76.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/img/logos/icon72.png">
    <link rel="apple-touch-icon-precomposed" href="/img/logos/apple-touch-icon-precomposed.png">
    <!-- Favicon link -->
    <link rel="shortcut icon" href="/favicon.ico">
    <!-- IE tile icon links -->
    <meta name="msapplication-TileColor" content="#FFFFFF">
    <meta name="msapplication-TileImage" content="/img/logos/icon144.png">
    <meta name="msapplication-square310x310logo" content="/img/logos/icon310.png">
    <meta name="msapplication-wide310x150logo" content="/img/logos/tile-wide.png">
    <meta name="msapplication-square150x150logo" content="/img/logos/icon150.png">
    <meta name="msapplication-square70x70logo" content="/img/logos/icon70.png">
    <!-- CSS links -->

    <link rel="stylesheet" href="/bower_components/foundation/css/normalize.css" />
    <!-- <link rel="stylesheet" href="/css/base.css" />  -->
    <link rel="stylesheet" href="/css/main.css" />
    <script src="/bower_components/modernizr/modernizr.js"></script>
    <!-- page-specific styling if necessary -->

  </head>
  <body>

  <!--   Topbar area (small devices only)    -->

<nav class="top-bar" role="navigation" data-topbar>
    <ul class="title-area">
      <!-- Title Area -->
      <li class="name">
        <a href="index.html"><img src="https://hamptontennis.org.uk/img/small_logo.gif" /></a><br />
        <!-- <h1><a href="#">Hampton-in-Arden Tennis Club </a></h1>   -->
      </li>
      <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
      <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
    </ul>

    <section class="top-bar-section">
      <!-- Right Nav Section -->
      <!--  Need to indicate which of the top-menu choices is currently active -->
      <ul class="right">
        <li><a href="/index.html">Home</a></li>
        <li><a href="javascript: routeMember()">Members</a></li>
        <li><a href="/playing.html">Playing</a>
        <li class="active"><a href="/coaching.html">Coaching</a>
        <li><a href="/holidaycamps.html">Holiday Clubs</a></li>
        <li><a href="javascript: routeMember()">News and Events</a></li>
        <li><a href="/ourclub.html">About Us</a></li>
      </ul>
    </section>

  </nav>

  <!-- Header -->

  <div class="row">
    <div class="large-12 columns">
      <h2>My coaching plan at Hampton in Arden Tennis Club</h2>
      <hr />
    </div>
  </div>

<%
if (debugging)
{
%>

  <div class="row">
    <div class="large-12 columns">
      <p>
        My dob = <%= mydob %><br />
        today is <%= today %>; <br />
        todayYear is <%= todayYear %><br />
        todaymonth is <%= todaymonth %><br />
        todayday is <%= todayday %><br />
        my age today is <%= myageinms %>; <br />
        my age in weeks is <%= myageinweeks %>; <br />
        Birthdate:  day = <%= dobday %>, month = <%= dobmonth %>, year = <%= dobyear %><br />
        Today:      day = <%= todayday %>, month = <%= todaymonth %>, year = <%= todayYear %><br />
        my age in years is <%= myageinyears %><br />
        my age in months is <%= myageinmonths %>
      </p>
    </div>
  </div>

<%
}

 // Age calculation done - now reroute to include required page

if (myageinyears < 5) {
 %>
 <!--#include file="templates/minitots.handlebars" -->
<% 
 }
if (myageinyears == 5) {
 %>
 <!--#include file="templates/minitots-transition.handlebars" -->
<% 
 }
if (myageinyears > 5 && myageinyears < 8) {
 %>
 <!--#include file="templates/minired.handlebars" -->
<% 
 }
   if (myageinyears == 8) {
 %>
 <!--#include file="templates/minired-transition.handlebars" -->
<% 
 }
  if (myageinyears > 17) {
 %>
 <!--#include file="templates/nomini.handlebars" -->
<% 
 }
 if (myageinyears > 10 && myageinyears < 18) {
 %>
 <!--#include file="templates/miniyellow.handlebars" -->
<% 
 }
 if (myageinyears == 10) {
 %>
 <!--#include file="templates/minigreen.handlebars" -->
<% 
 }
 if (myageinyears == 9) {
 %>
 <!--#include file="templates/miniorange.handlebars" -->
<% 
 }

%>

  <!--   Define the footer area  -->
  
  <!-- First row contains big footer menu and social mdeia stuff -->

  <!--   Define the footer area  -->

  <footer class="footer" role="contentinfo">

    <div class="row joinus">
      <div class="large-3 medium-3 small-12 columns">
        <a class="large fullwidth info button" href="/joinus.html">Join Us</a>
      </div>
      <div class="large-9 medium-9 small-12 columns">
        <p>
          There are many benefits to becoming a member of Hampton-in-Arden Tennis Club, whether you are an adult or a child. These include preferential pricing on certain activities, booking courts and web access to club communications. See what we have to offer - click Join Us now!
        </p>
      </div>
    </div>

      <div class="row toprow">

        <div class="large-12 bigfooter columns">

          <div class="row">

            <div class="large-2 medium-2 small-12 columns">
                <p class="footermenuhead">Membership</p>
                <ul>
                  <li><a href="/joinus.html" title="Benefits of joining the club">Why be a member</a></li>
                  <li><a href="https://clubspark.lta.org.uk/HamptonInArden/Membership/Join" title="Available membership packages">Membership packages</a></li>
                  <li><a href="/aboutus.html" title="Other sports available at Hampton Sports Club">Other sports</a></li>
                  <li><a href="/directory.html" title="Search the club members list">Directory</a></li>
                  <li><a href="#" data-reveal-id="loginModal" title="Sign-in to the members area" id="loginmenu" class="notsignedin noshow">Sign In &raquo;</a></li>
                </ul>
            </div>

            <div class="large-2 medium-2 small-12 columns">
              <p class="footermenuhead">Playing</p>
              <ul>
                <li><a href="/socialtennis.html" title="Provision for social tennis at our club">Social Tennis</a></li>
                <li><a href="/boxleagues.html" title="Internal box leagues">Box Leagues</a></li>
                <li><a href="/league.html" title="Playing for Hampton in the Coventry and District Lawn Tennis League">Coventry League</a></li>
                <li><a href="/tournaments.html" title="Tournaments">Tournaments</a></li>
                <li class="signedin noshow"><a href="/bookacourt.asp" title="Book a court (Signed-in members only)">Book a court</a></li>
              </ul>
            </div>

            <div class="large-2 medium-2 small-12 columns">
              <p class="footermenuhead">Coaching</p>
              <ul>
                <li><a href="/adultcoaching.html" title="Opportunities for coaching at our club whatever your age or ability">Adults</a></li>
                <li><a href="/coaching.html" title="Opportunities for coaching at our club whatever your age or ability">Juniors</a></li>
                <li><a href="/coaches.html" title="get to know our coaches">Our coaches</a></li>
                <li><a href="/one-to-one.html" title="Personal coaching sessions">One&ndash;to&ndash;One</a></li>
                <li><a href="/holidaycamps.html" title="Holiday camps">Holiday camps</a></li>
              </ul>
            </div>

            <div class="large-2 medium-2 small-12 columns">
              <p class="footermenuhead">News/Events</p>
              <ul>
                <li><a href="/events.html" title="Full event calendar for the club">Event Calendar</a></li>
                <li><a href="/socialevents.html" title="Social events at our club">Facilities</a></li>
                <li><a href="/news.html" title="Club news">News</a></li>
                <li><a href="/galleryindex.html" title="Photo galleries">Galleries</a></li>
              </ul>
            </div>

            <div class="large-2 medium-2 small-12 columns">
              <p class="footermenuhead">About Us</p>
              <ul>
                <li><a href="/contact.html" title="Contact the club">Contact Us</a></li>
                <li><a href="/ourclub.html" title="Facilities at our club">Facilities</a></li>
                <li><a href="/joinus.html" title="Join the club">Join Us</a></li>
                <li><a href="/awards.html" title="Our awards and achivements">Awards</a></li>
                <li><a href="/clubmark.html" title="Policies and procedures for running the club">Policies &amp; Procedures</a></li>
              </ul>
            </div>

            <div class="large-2 medium-2 small-12 columns">
              <p class="footermenuhead">&nbsp;</p>
            </div>
 
          </div>

        </div>

      </div>

    <!-- Second row - with copyright info etc -->
    <div class="row bottomrow hide-for-small">
      <div class="large-4 medium-4 small-12 columns">
        <p>
          <a href="https://hamptontennis.org.uk/index.html"><img src="./img/small_logo.gif" style="margin-top:10px;" /></a>&nbsp;&nbsp;
          Hampton-in-Arden Tennis Club
      </p>
      </div>
      <div class="large-4 medium-4 small-12 social columns" align="center">
        <p>
        <ul class="inline-list">
          <li class="facebook"><a href="http://facebook.com/hamptontennis" title="Facebook"></a></li>
          <li class="twitter"><a href="http://twitter.com/hamptontennis" title="Twitter"></a></li>
          <li class="wordpress"><a href="http://hamptontennis.wordpress.com" title="Wordpress"></a></li>
          <li class="flickr"><a href="http://www.flickr.com/photos/103781054@N07/" title="Flickr"></a></li>
        </ul>
      </p>
      </div>
      <div class="large-4 medium-4 small-12 columns">
          <p style="margin-top:10px;">&copy; JC 2018. All rights reserved</p>
      </div>
    </div>

  </footer>

  <!--  end of footer definition  -->

  <!--    Start of area for any Handlebars templates    -->



  <!--    End of area for any Handlebars templates    -->

  <!--    Reveal Modals begin                         -->

  <div id="loginModal" class="reveal-modal small" data-reveal>

    <h2>Sign-In</h2>
    <p>
      Plesae sign-in below with your User ID and PIN (that you use for booking courts)
    </p>
    <div id="signinpanel">
      <form id="signin" name="signin" action="/signin.asp" method="POST" data-abide>
        <div class="userid-field">
          <label>User ID:
            <input type="number" name="frmUserId" id="frmUserId" placeholder="Your User ID" min="1" max="9999" maxlength="4" size="5" required pattern="[0-9]+" autofocus />
          </label>
          <small class="error">Your User ID must be a number</small>
        </div>
        <div class="pin-field">
          <label>PIN:
            <input type="password" name="frmPassword" id="frmPassword" placeholder="Your PIN number" required pattern="[0-9]+" maxlength="4" size="5" />
          </label>
          <small class="error">Your PIN number must be a 4-digit number</small>
        </div>
        <input type="hidden" id="refurl" name="refurl" value="/members.html" />
        <a href="javascript: logMeIn()" name="loginSubmit" id="loginSubmit" class="medium button">Sign-In</a>
      </form>   
      <p>
        <a href="#" data-reveal-id="forgotPasswordModal" title="Forgotten User ID or password"> I have forgotten my User ID and/or password&raquo;</a>
      </p><p style="position:absolute; left:-2250px; top:-1150px;"> Unlike other Daytona series, Paul Newman is uniquely designed to <a href="http://www.newwatchesoutlet.co.uk">replica watches uk</a> show only the four-digit number at the earliest date, including Ref.6239,6241,6262,6263,6264 Or above 6265. There are <a href="http://www.rolexreplicasstore.uk.com">rolex replica watches</a> so-called "dice" in the small window, and the second window at the 9 o'clock is <a href="http://www.channel-ferries.co.uk">hublot replica</a> marked with 15,30,45,60, which is  different from the general "20", and part The model is  not engraved with Daytona words, and this one is engraved on <a href="http://www.rolexreplicauk.co.uk">replica rolex</a> Daytona, located at 6 o'clock on the small window above. </p>
    </div>    <!--    /signinpanel    -->

      <a class="close-reveal-modal">&#215;</a>
  </div>   <!--    /loginModal    -->

  <!--   forgotPasswordModal    -->

    <div id="forgotPasswordModal" class="reveal-modal small" data-reveal>

    <h3>Forgot User ID or PIN</h3>
    <p>
      Complete and submit the form below and your User ID and PIN will be sent to your email address.
    </p>
    <div id="forgotpanel">
      <form id="forgot" name="forgot" action="reminduser.asp" method="POST" data-abide>
        <div class="forename-field">
          <label>First name:
            <input type="text" name="frmForename" id="frmForename" placeholder="Your first name" required />
          </label>
          <small class="error">Your first name must be completed</small>
        </div>
        <div class="surname-field">
          <label>Surname:
            <input type="text" name="frmSurname" id="frmSurname" placeholder="Your surname" required />
          </label>
          <small class="error">You must supply your surname</small>
        </div>
        <div class="email-field">
          <label>Email address from your application / renewal form:
            <input type="text" name="frmEmail" id="frmEmail" placeholder="Your email address that you supplied when joining or renewing your membership" required />
          </label>
          <small class="error">You must supply the email address you gave us when joining or renewing your membership at the club</small>
        </div>
        <button name="forgotSubmit" id="forgotSubmit">Remind Me</button>
      </form>   
      <a class="close-reveal-modal">&#215;</a>
    </div>    <!--    /forgotpanel    -->

  </div>   <!--    /forgotPasswordModal    -->
  
  <!--    Reveal Modals end                           -->

    <script src="/bower_components/jquery/dist/jquery.js"></script>
    <script src="/bower_components/foundation/js/foundation.min.js"></script>
    <script src="/bower_components/handlebars/handlebars.js"></script>
    <script src="/bower_components/sammy/lib/sammy.js"></script>

    <script src="/js/app.js"></script>
    <script src="/js/sessions.js"></script> 

    <!--    page-specific JS code -->

    <script src="/js/whatcanisee.js"></script> 


    <!--    Google Analytics    -->

    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-65278110-1', 'auto');
      ga('send', 'pageview');

    </script>
    
</body>
</html>
<%
%>
