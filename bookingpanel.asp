<ol id="bookingpanel">
	<div id="bookingheader">
		<h3><a href="facilities.asp">Booking Facilities</a></h3>
	</div>

	<table id="bookthings" cellspacing="5" cellpadding="5" style="margin: 0 auto; width: 95%">
		<tr>
			<td width="95%" class="calltoaction" style="background-color: inherit; text-align: center">
				<form id="bookingform" method="post" action="https://ebookingonline.net/box/box3.php?id=29">
				<input type="hidden" name="user" value="<%= ebookinguserid %>"/>
				<input type="hidden" name="password" value="<%= ebookingpin %>"/>
				<input name="login_submitted" type="hidden" value="TRUE" />
				<!-- <input type="submit"/> -->
	 			<a href="javascript: bookingform.submit();" style="display:block; width: 95%; margin: 0 auto;">Book a Tennis Court</a>
				</form>
	 		</td>
<!--
	 		<td width="45%" class="calltoaction" style="background-color: inherit; text-align: center;">
	 			<a href="bookastroturf.asp" style="display:block; width: 95%; margin: 0 auto;">Book the Astro Turf</a>
	 		</td>
-->
	 	</tr>
	 </table>
</ol>
<!--
	<p style="height:10px;">&nbsp;</p>
-->  