<%@language="JScript" CODEPAGE="65001"%>
<%	
	function getConnectionString() {
		//return "Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\\Inetpub\\wwwroot\\Members\\Members.mdb;";
		return "Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=d:\\websites\\hampt4\\data\\Members.mdb;";	
	}

	function memberFetchAll(connObj) {		
		var SQLStmt;
		
		SQLStmt = "SELECT * FROM Member";
		return connObj.Execute(SQLStmt);
	}
	
	var ds;
	var xmlResult = new ActiveXObject ("Msxml2.FreeThreadedDOMDocument");
	var connObj = Server.CreateObject("ADODB.Connection");
	
	//xmlResult.async= false;
	//xmlResult.loadXML("<members><member name=\"Jeremy Horgan\"/></members>");
	
	try {
		var root;
		root = xmlResult.createElement("Members");
		
		connObj.Open(getConnectionString());
		ds = memberFetchAll(connObj)
			
		var child;
		while (ds != null && !ds.EOF) {
			child = xmlResult.createElement("Member");
			child.setAttribute("name", ds("Name").Value);
			child.setAttribute("address1", ds("Address1").Value);
			child.setAttribute("address2", ds("Address2").Value);
			child.setAttribute("address3", ds("Address3").Value);
			child.setAttribute("postCode", ds("PostCode").Value);
			
			root.appendChild(child);
			ds.MoveNext();	
		}
		xmlResult.appendChild(root);
		Response.ContentType = "text/xml";
		xmlResult.save(Response);		
	}
	catch (e) {
		Response.Write(e.message);
	}
%>
