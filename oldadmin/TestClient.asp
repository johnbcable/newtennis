<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="MemberApi.asp" -->
<%	
	var xmlDoc = null;
	var cmd = Request.QueryString("Cmd");
	if (cmd == "Add") {
	
		var theName = Request.Form("Name").Item(1);
		var theAddr1 = Request.Form("Address1").Item(1);
		var theAddr2 = Request.Form("Address2").Item(1);
		var theAddr3 = Request.Form("Address3").Item(1);
		var thePostCode = Request.Form("PostCode").Item(1);
		
		var ok = memberAdd(theName, theAddr1, theAddr2, theAddr3, thePostCode);
	}
	else if (cmd == "Fetch") {
		// Fetch the members details. Once it is returned 
		// as an xml DOM then it can be accessed in any way 
		// required eg (using an XSLT transform to generate html)
		xmlDoc = memberFetch();
	}		
%>

<html>
<body>
	<hr>
	<form action="TestClient.asp?Cmd=Add" method="post"> <!-- PostBack to self -->
		<table>
		<tr>
			<td>Name:</td>
			<td><input name="Name" type="text" id="Name"></td>
		</tr>
		<tr>
			<td>Addr1:</td>
			<td><input name="Address1" type="text"></td>
		</tr>
		<tr>
			<td>Addr1:</td>
			<td><input name="Address2" type="text"></td>
		</tr>
		<tr>
			<td>Addr1:</td>
			<td><input name="Address3" type="text"></td>
		</tr>
		<tr>
			<td>PostCode:</td>
			<td><input name="PostCode" type="text"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="    Add    " id="submitMemberAdd"></td>
		</tr>
		</table>
	</form>
	<br>
	<hr>
	<form action="TestClient.asp?Cmd=Fetch" method="post"> <!-- PostBack to self -->
		<input type="submit" value="Fetch Members" ID="submitMemberFetch"><br>
	</form>
	<hr>
	<textarea rows=10 cols=40><%if (xmlDoc != null) { Response.Write(xmlDoc.xml);}%></textarea>
</body>
</html>