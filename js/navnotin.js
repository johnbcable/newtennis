if(typeof(loc)=="undefined"||loc==""){var loc="";if(document.body&&document.body.innerHTML){var tt=document.body.innerHTML.toLowerCase();var last=tt.indexOf("navbar.js\"");if(last>0){var first=tt.lastIndexOf("\"",last);if(first>0&&first<last)loc=document.body.innerHTML.substr(first+1,last-first-1);}}}

var bd=0
document.write("<style type=\"text/css\">");
document.write("\n<!--\n");
document.write(".navbar_menu {border-color:#000000;border-style:solid;border-width:"+bd+"px 0px "+bd+"px 0px;background-color:#006600;position:absolute;left:0px;top:0px;visibility:hidden;}");
document.write("a.navbar_plain:link, a.navbar_plain:visited{text-align:left;background-color:#006600;color:#ffffff;text-decoration:none;border-color:#000000;border-style:solid;border-width:0px "+bd+"px 0px "+bd+"px;padding:2px 0px 2px 0px;cursor:hand;display:block;font-size:9pt;font-family:Arial, Helvetica, sans-serif;}");
document.write("a.navbar_plain:hover, a.navbar_plain:active{background-color:#9cacc1;color:#000000;text-decoration:none;border-color:#000000;border-style:solid;border-width:0px "+bd+"px 0px "+bd+"px;padding:2px 0px 2px 0px;cursor:hand;display:block;font-size:9pt;font-family:Arial, Helvetica, sans-serif;}");
document.write("\n-->\n");
document.write("</style>");

var fc=0x000000;
var bc=0x9cacc1;
if(typeof(frames)=="undefined"){var frames=0;}

startMainMenu("navbar_left.gif",22,1,2,0,0)
mainMenuItem("navbar_b1",".gif",22,108,loc+"oldwayin.asp","","All about our club and how to join it",2,2,"navbar_plain");
mainMenuItem("navbar_b2",".gif",22,108,loc+"news.asp","","News",2,2,"navbar_plain");
mainMenuItem("navbar_b3",".gif",22,108,loc+"juniors.asp","","Junior section home page",2,2,"navbar_plain");
mainMenuItem("navbar_b4",".gif",22,108,loc+"fixtures.asp","","Fixtures for the Hampton Tennis Teams",2,2,"navbar_plain");
mainMenuItem("navbar_b5",".gif",22,108,loc+"links.asp","","Links to other sites",2,2,"navbar_plain");
mainMenuItem("navbar_b6",".gif",22,108,loc+"members.asp","","Members area",2,2,"navbar_plain");
endMainMenu("navbar_right.gif",22,1)

startSubmenu("navbar_b6","navbar_menu",108);
submenuItem("Sign-In",loc+"login.asp","","navbar_plain");
endSubmenu("navbar_b6");

startSubmenu("navbar_b4","navbar_menu",108);
submenuItem("League",loc+"league.asp","","navbar_plain");
submenuItem("Friendlies",loc+"friendly.asp","","navbar_plain");
submenuItem("Tournaments",loc+"tourneys.asp","","navbar_plain");
submenuItem("MAXI-Tennis",loc+"maxifix2007.asp","","navbar_plain");
endSubmenu("navbar_b4");

startSubmenu("navbar_b3","navbar_menu",108);
submenuItem("Play Tennis Day",loc+"pt2006.asp","","navbar_plain");
submenuItem("Coaching",loc+"coaching.asp","","navbar_plain");
submenuItem("Mini-Tennis League",loc+"jleague.asp","","navbar_plain");
submenuItem("Nth Warcks Dbls League",loc+"nwdblsleague.asp","","navbar_plain");
submenuItem("Tournaments",loc+"jtourney.asp","","navbar_plain");
submenuItem("Mini-Tennis",loc+"minitennis.asp","","navbar_plain");
endSubmenu("navbar_b3");

startSubmenu("navbar_b2","navbar_menu",133);
submenuItem("MAXI-Tennis",loc+"maxitennis.asp","","navbar_plain");
submenuItem("Play Tennis Day",loc+"pt2006.asp","","navbar_plain");
submenuItem("The Arden 9-Mile Run",loc+"9milehome.asp","","navbar_plain");
submenuItem("Event Diary",loc+"eventlist.asp","","navbar_plain");
endSubmenu("navbar_b2");

startSubmenu("navbar_b1","navbar_menu",108);
submenuItem("Location",loc+"location.asp","","navbar_plain");
submenuItem("Facilities",loc+"aboutus.asp","","navbar_plain");
submenuItem("200 Club",loc+"200club.asp","","navbar_plain");
submenuItem("FAQ's",loc+"faq.asp","","navbar_plain");
submenuItem("About Us",loc+"aboutus.asp","","navbar_plain");
submenuItem("Joining",loc+"joinus.asp","","navbar_plain");
endSubmenu("navbar_b1");

loc="";
