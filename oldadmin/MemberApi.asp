<script language="JScript" CODEPAGE="65001" runat=Server>

function success(status) {
	return status == "ok";
}

function getUrlBaseName() {
	//return "http://localhost/Members/";
	return "http://hamptonsquash.org.uk/Members/";
}

function memberFetch() {
	var httpRequest = new ActiveXObject("Msxml2.ServerXMLHTTP");
	var xmlDoc = null;

	var url = getUrlBaseName() + "MemberFetch.asp";
			
	try	{
		httpRequest.open("POST", url, false);
		httpRequest.send();
									
		if (httpRequest.responseXML != null) {
			xmlDoc = httpRequest.responseXML;
		}
		return xmlDoc;
	}
	catch (e) {
		Response.Write(e.message);
	}	
}

function memberAdd(name, addr1, addr2, addr3, postCode) {
	var xmlDom = new ActiveXObject ("Msxml2.FreeThreadedDOMDocument");
	var httpRequest = new ActiveXObject("Msxml2.ServerXMLHTTP");
	var xmlDoc = null;
	var ok = false;
	
	var url = getUrlBaseName() + "MemberAdd.asp";
			
	try	{
		var root, child;
		
		root = xmlDom.createElement("Members");
		child = xmlDom.createElement("Member");
		
		child.setAttribute("name", name);
		child.setAttribute("addr1", addr1);
		child.setAttribute("addr2", addr2);
		child.setAttribute("addr3", addr3);
		child.setAttribute("postCode", postCode);
		
		root.appendChild(child);
		xmlDom.appendChild(root);
				
		httpRequest.open("POST", url, false);
		httpRequest.setRequestHeader("Content-Type", "text/xml");
		httpRequest.send(xmlDom);
									
		if (httpRequest.responseXML != null) {
			xmlDoc = httpRequest.responseXML;
			elm = xmlDoc.firstChild;
			
			status = elm.getAttribute("status");
			if (success(status))
				ok = true;			
		}		
	}
	catch (e) {
		Response.Write(e.message);
	}	
	return ok;
}

</script>