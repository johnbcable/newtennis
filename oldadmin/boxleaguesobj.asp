<%
//
//  BoxLeagueObject
//
//  Holds set of matches and results for one or more box leagues 
//

function BoxLeagueObject(name,start,finish) {

	this.boxleaguename = new String(name).toString() || new String("").toString();
	this.boxpartner = new String("").toString();
	this.boxstart = new String(start).toString() || new String("").toString();
	this.boxend = new String(finish).toString() || new String("").toString();
	this.boxmatches = new Array();
};

BoxLeagueObject.prototype.setBoxPartner = function(boxpartner) {
	this.boxpartner = boxpartner;
};

BoxLeagueObject.prototype.setName = function(name) {
	this.boxleaguename = name;
};

BoxLeagueObject.prototype.setStart = function(start) {
	this.boxStart = start;
};

BoxLeagueObject.prototype.setFinish = function(finish) {
	this.boxend = finish;
};

BoxLeagueObject.prototype.addBoxMatch = function(opponent, myscore, theirscore) {
	var newmatch = {
		opponent: opponent,
		myscore: myscore,
		theirscore: theirscore
	};
	this.boxmatches.push(newmatch);
};


%>
