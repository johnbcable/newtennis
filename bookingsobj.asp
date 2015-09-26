<%
//
//  BookingsObject
//
//  Holds set of court bookings 
//

function BookingsObject() {
	this.bookings = new Array();
};

BookingsObject.prototype.addBooking = function(date, time, court, players) {
	this.bookings.push(new Object({
		bookingdate: date,
		bookingtime: time,
		bookedcourt: court,
		otherplayers: players
	}));
};
%>
