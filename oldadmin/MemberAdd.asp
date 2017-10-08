<%@language="JScript" CODEPAGE="65001"%>
<%	

	function getConnectionString() {
		//return "Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\\Inetpub\\wwwroot\\Members\\Members.mdb;";
		return "Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=d:\\websites\\hampt4\\data\\Members.mdb;";	
	}

	function memberInsert(connObj, name, addr1, addr2, addr3, postCode) {		
		var SQLStmt;
		var cmdObj;
		
		SQLStmt = "INSERT INTO Member ([Name],Address1,Address2,Address3,PostCode) VALUES(?,?,?,?,?)";
					
		cmdObj = Server.CreateObject("ADODB.Command");
		cmdObj.ActiveConnection = connObj;
		cmdObj.CommandText = SQLStmt;
		cmdObj.CommandType = 1;
		cmdObj.Prepared = true;

		cmdObj.Parameters.Item(0).Value = name;
		cmdObj.Parameters.Item(1).Value = addr1;
		cmdObj.Parameters.Item(2).Value = addr2;
		cmdObj.Parameters.Item(3).Value = addr3;
		cmdObj.Parameters.Item(4).Value = postCode;
			
		cmdObj.Execute(SQLStmt);
		
		return true;
	}

	function memberAdd(name, addr1, addr2, addr3, postCode) {
		var ok;
		var connObj = Server.CreateObject("ADODB.Connection");
		
		connObj.Open(getConnectionString());
		ok = memberInsert(connObj, name, addr1, addr2, addr3, postCode);
		
		connObj.Close();
		return ok;
	}
	
	var ok = false;
	var xmlDoc = new ActiveXObject ("Msxml2.FreeThreadedDOMDocument");
	var xmlResult = new ActiveXObject ("Msxml2.FreeThreadedDOMDocument");
	var elm;
	
	xmlDoc.async = false;
	xmlDoc.load(Request);
	
	try {
		ok = memberAdd("asdsdf ", "asdsdf ", "asdsdf ", "asdsdf ", "asdsdf ");
		if (xmlDoc.firstChild != null) {
			elm = xmlDoc.firstChild.firstChild;
			
			var theName = elm.getAttribute("name");
			var theAddress1 = elm.getAttribute("addr1");
			var theAddress2 = elm.getAttribute("addr2");
			var theAddress3 = elm.getAttribute("addr3");
			var thePostCode = elm.getAttribute("postCode");
			
			ok = memberAdd(theName, theAddress1, theAddress2, theAddress3, thePostCode);
		}
	}
	catch (e) {
		Response.Write(e.message);
	}

	xmlResult.async= false;
	var status = (ok) ? "ok" : "fail";
	xmlResult.loadXML("<result status=\'" + status + "\'/>");
	
	Response.ContentType = "text/xml";
	xmlResult.save(Response);
%>