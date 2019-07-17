<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="json2.js.asp" -->
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Viewing CSV files");
var sMessage = new String("").toString();
var sJSON = new String("");
var whichcsvfile = new String("ClubSparkMembers.csv");
var debugging = true;

// Now for any functions and variables local to this page
function GetEveryThing(thefile)
{
	var fso, f;
	var ForReading = 1, ForWriting = 2;
	var fcontents;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	myfilename = Server.MapPath(thefile);
	if (fso.FileExists(myfilename))
	{
	 	 f = fso.OpenTextFile(myfilename, ForReading);
		 fcontents = new String(f.ReadAll()).toString();
		 f.Close();
	}
	else
	{
	 		fcontents = new String("File not found");
	}
	return(fcontents);
}
function csvJSON(csv){

  var lines=csv.split("\n");

  var result = [];

  var headers=lines[0].split(",");
  // remove embedded spaces from headers
  
  /*
  for (var i=0;i<headers.length;i++) {
  	var str = new String(headers[i]).toString();
	str = str.replace(/[^a-zA-Z0-9+]+/gi, '');
  	headers[i] = new String(str);
  }
  */

  for(var i=1;i<lines.length;i++){

	  var obj = {};
	  var currentline=lines[i].split(",");

	  for(var j=0;j<headers.length;j++){
		  obj[headers[j]] = currentline[j];
	  }

	  result.push(obj);

  }
  
  //return result; //JavaScript object
  return JSON.stringify(result); //JSON
}

// Go and get CSV file contents
sMessage = new String("").toString();
// Now read in contents of CSV file
sMessage = new String(GetEveryThing(whichcsvfile));
sJSON = csvJSON(sMessage);

Response.ContentType = "application/json";

Response.Write(sJSON);

Response.End();
%>
