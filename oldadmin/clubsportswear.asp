<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Club Sports Wear Catalogue");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if runniung in production -->
<%
if (debugging)
{
%>
<link rel="stylesheet" media="screen" type="text/css" href="borders.css" />
<%
}
%>
<style type="text/css">
<!--
#menswear div, #womenswear div, #childrenswear div {
					padding: 10px 0; 
					border-bottom: 1px dashed #666; 
					overflow: hidden;
					position: relative;
					clear: both;
					width: 100%;
}
#menswear div.photo, #womenswear div.photo, #childrenswear div.photo {
					float: left;
					width: 20%;
					min-width: 120px;
					margin: 0 20px 0 0;
					border: 0;
}
#menswear div.itemdetails, #womenswear div.itemdetails, #childrenswear div.itemdetails {
					float: right;
					margin: 0 20px 0 0;
					clear: none;
					width: 70%;
					border: 0;
}
#menswear div.itemdetails p, #womenswear div.itemdetails p, #childrenswear div.itemdetails p {
					margin-left: 20px;
}
#menswear div.itemdetails p.garmenttitle, #womenswear div.itemdetails p.garmenttitle, #childrenswear div.itemdetails p.garmenttitle {
					font-weight: bold;
					font-size: 1.1em;
}
-->
</style>

</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
	<h1>Hampton-In-Arden Sports Club</h1>
	<h2>Tennis Section</h2>

<!--   2.  Navigation   -->
	<div id="nav_main">
		<ul id="topmenu">
			<li id="nav_ourclub"><a href="aboutus.asp">Our Club</a></li>
			<li id="nav_coaching"><a href="juniors/coaching.html">Coaching</a></li>
			<li id="nav_playing"><a href="playing.asp">Playing</a></li>
			<li id="nav_links"><a href="juniors/index.html">Juniors</a></li>
			<li id="nav_contact"><a href="juniors/contact.html">Contact</a></li>
			<li id="nav_members"><a href="members.asp">Members</a></li>
		</ul>
		<p id="today">
			<%= displaydate %>&nbsp;<%= strtime %>
		</p>
	</div>
	
</div>

<div id="wrapper">

<!--   3. Content    -->
	<div id="content">
		<h1>Sports Club:&nbsp;<b>Available Sports Wear</b></h1>
		<p>
		From 1 May, 2010 Hampton In Arden Tennis Club will have items of club-branded sportswear available 
		for members to purchase at attractive prices. Ranges are available for <a href="#mens">Men</a>, 
		<a href="#womens">Ladies</a> and <a href="#childrens">children</a>. Click on any individual thumbnail 
		picture to see a larger version. 
		</p>
		
		<div id="menswear">
			<h2><a id="mens" name="mens">Men's Active Sport Collection</a></h2>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=v03sj1&caption=Sports warm-up jacket">
								 <img src="images/tn_v03sj1.jpg" alt="Sports warm-up jacket" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Sports Warm-Up Jacket</p>
							 <p>Available sizes:&nbsp;XS, S, M, L, XL, XXL</p>
							 <p>Price:&nbsp;&pound;29</p>
							 <p>
							 		zip burst technology enables wearer to detach sleeves whilst running; sleeve storage pocket to rear;
							    reflective trim for evening exercise; water resistant; breathable; lightweight design.
							 </p>
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=v02ps&caption=Polo shirt">
								 <img src="images/tn_v02ps.jpg" alt="Polo shirt" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Polo shirt</p>
							 <p>Available sizes:&nbsp;XS, S, M, L, XL, XXL</p>
							 <p>Price:&nbsp;&pound;11</p>
							 <p>Shoulder venting for flexibility; rocket red detail to placket; made from polycool pique.
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=v03st3&caption=Sports T-shirt">
								 <img src="images/tn_v03st3.jpg" alt="Sports T-shirt" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Sports T-shirt</p>
							 <p>Available sizes:&nbsp;XS, S, M, L, XL, XXL</p>
							 <p>Price:&nbsp;&pound;12</p>
							 <p>
							 		large breathable panels to sides; rocket red detail to seams; made from four way 
									stretch standard knit polyester and elastane with moisture management.
	 					 	</p>
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=v02t3&caption=Sports T-shirt">
								 <img src="images/tn_v02t3.jpg" alt="Sports T-shirt" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Sports T-shirt</p>
							 <p>Available sizes:&nbsp;XS, S, M, L, XL, XXL</p>
							 <p>Price:&nbsp;&pound;9</p>
							 <p>
							 		Active branding to front; rocket red trim; polyester with 5% Lycra for
									ease of movement and comfort.
	 					 	</p>							 
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=v03stro&caption=Sports Trousers">
								 <img src="images/tn_v03stro.jpg" alt="Sports Trousers" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Sports Trousers</p>
							 <p>Available sizes:&nbsp;XS, S, M, L, XL, XXL</p>
							 <p>Price:&nbsp;&pound;21</p>
							 <p>
							 		micro fibre lightweight polyester fabric; adjustable waist; quickly converted to 3/4 length
									legs with zip; anti wrinkle finish.
							 </p>
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=adulthoodie&caption=Adult Unisex Hooded Sweater">
								 <img src="images/tn_adulthoodie.jpg" alt="Adult Unisex Hooded Sweater" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Adult Unisex Hooded Sweater</p>
							 <p>Available sizes:&nbsp;XS, S, M, L, XL, XXL</p>
							 <p>Price:&nbsp;&pound;16</p>
							 <p>
							 		50% combed ringspun cotton; 50% polyester.
							</p>
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=adcap&caption=Baseball Cap">
								 <img src="images/tn_adcap.jpg" alt="Baseball Cap" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Baseball Cap</p>
							 <p>Available sizes:&nbsp;One-size</p>
							 <p>Price:&nbsp;&pound;6</p>
							 <p>
							 		White baseball cap; logo-embroidered.
							</p>
					</div>
			</div>
		</div>
		
		<div id="womenswear">
			<h2><a id="womens" name="womens">Women's Active Sport Collection</a></h2>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=v03slj1&caption=Sports warm-up jacket">
								 <img src="images/tn_v03slj1.jpg" alt="Sports warm-up jacket" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Sports Warm-Up Jacket</p>
							 <p>Available sizes:&nbsp;XS, S, M, L</p>
							 <p>Price:&nbsp;&pound;27</p>
							 <p>
							 		'zip burst' technology enables wearer to detach sleeves whilst running; reflective 
									trim for evening exercise; water resistant; breathable; lightweight design.
 						 	</p>
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=v03sls&caption=Sweat shirt">
								 <img src="images/tn_v03sls.jpg" alt="Swaet shirt" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Sweat shirt</p>
							 <p>Available sizes:&nbsp;XS, S, M, L</p>
							 <p>Price:&nbsp;&pound;23</p>
							 <p>
							 		rocket red trim and zip; reflective detail to back of garment; powerstretch 
									polyester providing stretch and support.
							</p>
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=adulthoodie&caption=Adult Unisex Hooded Sweater">
								 <img src="images/tn_adulthoodie.jpg" alt="Adult Unisex Hooded Sweater" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Adult Unisex Hooded Sweater</p>
							 <p>Available sizes:&nbsp;XS, S, M, L, XL, XXL</p>
							 <p>Price:&nbsp;&pound;16</p>
							 <p>
							 		50% combed ringspun cotton; 50% polyester.
							</p>
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=v03slt3&caption=Sports T-shirt">
								 <img src="images/tn_v03slt3.jpg" alt="Sports T-shirt" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Sports T-shirt</p>
							 <p>Available sizes:&nbsp;XS, S, M, L</p>
							 <p>Price:&nbsp;&pound;10</p>
							 <p>
							 		breathable panels to sides; rocket red detail to seams and zip; made from standard knit
									four way stretch polyester and elastane.
							</p>	 
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=v03slv&caption=Sports Vest">
								 <img src="images/tn_v03slv.jpg" alt="Sports Vest" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Sports Vest</p>
							 <p>Available sizes:&nbsp;XS, S, M, L</p>
							 <p>Price:&nbsp;&pound;11</p>
							 <p>
							 		Body-hugging cut, with moisture management to keep the skin cool and dry; breathable;
									rocket red detail to seams.
							</p>
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=v03sleg&caption=Training Leggings">
								 <img src="images/tn_v03sleg.jpg" alt="Training Leggings" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Training Leggings</p>
							 <p>Available sizes:&nbsp;XS, S, M, L</p>
							 <p>Price:&nbsp;&pound;14</p>
							 <p>
							 		multi functional, ideal for gym and leisure wear; zip pocket to back perfect for locker key;
									boot-cut design with flattering low cut hip.
							 </p>
					</div>
			</div>
		</div>
		
		<div id="childrenswear">
			<h2><a id="childrens" name="childrens">Children's Active Sport Collection</a></h2>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=chilcap&caption=Baseball Cap">
								 <img src="images/tn_chilcap.jpg" alt="Baseball Cap" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Baseball Cap</p>
							 <p>Available sizes:&nbsp;One-size</p>
							 <p>Price:&nbsp;&pound;6</p>
							 <p>
							 		White cotton cap; logo-embroidered.
							</p>
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=chilts&caption=Childrens Plain T-Shirt">
								 <img src="images/tn_chilts.jpg" alt="Childrens Plain T-Shirt" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Childrens Plain T-Shirt</p>
							 <p>Available size ranges (years):&nbsp;3-4, 5-6, 7-8, 9-10, 11-12</p>
							 <p>Price:&nbsp;&pound;6</p>
							 <p>
							 		White 100% cotton T-Shirt
							</p>
					</div>
			</div>
			<div>
					<div class="photo">
					 		<a href="show_pic.asp?photo=chilths&caption=Children's Unisex Hooded Sweater">
								 <img src="images/tn_chilths.jpg" alt="Children's Unisex Hooded Sweater" width="100" height="100">
							</a>
					</div>
					<div class="itemdetails">
							 <p class="garmenttitle">Children's Unisex Hooded Sweater</p>
							 <p>Available size ranges (years):&nbsp;3-4, 5-6, 7-8, 9-10, 11-12</p>
							 <p>Price:&nbsp;&pound;10</p>
							 <p>
							 		50% combed ringspun cotton; 50% polyester.
							</p>
					</div>
			</div>
		</div>
		<div class="seealso">
				 <h3>See Also:</h3>
				 <ul>
				 		 <li><a href="sizingguide.asp">Sizing guide</a></li>
				 		 <li><a href="clubsportswear.xls">Order form (Excel)</a></li>
				 		 <li><a href="clubsportswear.ppt">Original proposal to the tennis club (Powerpoint) - LARGE file</a></li>
				 </ul>
		</div>

	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="home_nav.asp" -->
		<!--#include file="memb_nav.asp" -->
	</div>

<!--    5.   Supplementary content     -->	
	<div id="rightcolumn">
		<!--#include file="searchpanel.asp" -->
		<!--#include file="addresspanel.asp" -->
		<!--#include file="newspanel.asp" -->
		<!--#include file="emailpanel.asp" -->
	</div>
</div>

<!--     6.    Site info     -->
<!--#include file="footer.asp" -->

</body>
</html>
<%
%>

