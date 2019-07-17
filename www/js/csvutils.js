
/*
function Upload() {

var fileUpload = document.getElementById("fileUpload");

var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.csv|.txt)$/;

if (regex.test(fileUpload.value.toLowerCase())) {

if (typeof (FileReader) != "undefined") {

var reader = new FileReader();

reader.onload = function (e) {

var table = document.createElement("table");

var rows = e.target.result.split("\n");

for (var i = 0; i < rows.length; i++) {

var row = table.insertRow(-1);

var cells = rows[i].split(",");

for (var j = 0; j < cells.length; j++) {

var cell = row.insertCell(-1);

cell.innerHTML = cells[j];

}

}

var dvCSV = document.getElementById("dvCSV");

dvCSV.innerHTML = "";

dvCSV.appendChild(table);

}

reader.readAsText(fileUpload.files[0]);

} else {

alert("This browser does not support HTML5.");

}

} else {

alert("Please upload a valid CSV file.");

}

}
*/
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



$(document).ready(function() {
  
  showTodaysMatches("#whatcanisee");

})  // end of document.ready
