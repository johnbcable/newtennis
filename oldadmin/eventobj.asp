<%
//
//  EventObject
//
//  Holds details of an event on the club events calendar
//

function EventObject() {
	var dummy = new Date();
	this.eventdate = new Date();
	this.enddate = new Date();
	this.eventtime = new Now();
	this.endtime = new Now();
	this.eventyear = dummy.getFullYear();
	this.eventtype = new String("EVENT").toString();
	this.eventnote = new String("").toString();
	this.eventreport = new String("").toString();
	this.fixturelink = -1;
	this.tourlink = -1;
	this.holidaylink = new String("").toString();
	this.advert = new String("").toString();
};

/* 
EventObject.prototype.addSuccessMessage = function(themessage) {
	this.successmessages.push(themessage);
};
*/

%>
