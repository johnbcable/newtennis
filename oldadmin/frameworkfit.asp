<%
%>
		<a name="whereifitin">&nbsp;</a>
		<h3>What playing initiatives would suit me?</h3>
		<form action="cfdecide.asp" method="GET">
			<fieldset>
				<div id="mydateofbirth">
					<label for="dob">My date of birth is:</label>&nbsp;
					<input type="text" name="dob" id="dob" size="12" maxlength="10" onBlur="javascript:checkdate(this)" value="<%= mydob %>">
					<span>&nbsp;&nbsp;&nbsp;(dd/mm/yyyy)</span>
				</div>
				<div id="submitblock" align="right">
					<p style="margin-right:10px;">
						<input style="text-align:right; display:inline;" type="submit" value="Show me where I can fit in">
					</p>
				</div>
			</fieldset>
		</form>
<%
%>
