<script language="JScript" CODEPAGE="65001" runat=Server>
// List of function prototypes
//
// blockReplaceAll(string, to_be_replaced, with_this)  ->  HTML String
// getBlogEntriesJSON(thesite,maxnumber)  ->  JSON object
// getBlogEntries(thesite)   ->  HTML String
// getBlogEntriesAfter(thesite, earliestdate)   ->  HTML String
//
//
var debugging = true;

function blockReplaceAll(thestring) {
	var retval = new String (thestring).toString();
	retval = replaceAll(retval,"[\u0000-\u001f]", "");
	retval = replaceAll(retval,"[\u2019]","'");
	retval = replaceAll(retval,"[\u2018]","'");
	retval = replaceAll(retval,"[\u2013]","-");
	retval = replaceAll(retval,"[\u00a0]"," ");
	retval = replaceAll(retval,"[^abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789 .'£@!%&*(){}|/]\u2026","");
	return(retval);
}
function getPostID(wpguid) {
	var postID;

	postID = wpguid.replace("http://hamptontennis.wordpress.com/?p=","");

	return (postID);
}

//==================================================
function getBlogEntriesJSON(thesite,maxnumber) {
	var	RSSURL = "http://"+thesite+".wordpress.com/rss";
	var objHTTP; // this object is used to call the RSS Feed remotely
	var RSSFeed; // this variable holds the Content for the RSS Feed
	var xmlRSSFeed; // this variable hold the XML data in a DOM Object
	var objItems,objItem, objChild; // these variables are used to temporarily hold data from the various RSS Items
	var title,description,link,pubdate,guid; //  these are local variables that will hold the data to be displayed
	var OutputJSON = new Object(); // this variable will hold the HTML that was converted from the RSS Feed
	var targetNode = new String("").toString();
	var nodelist, strDate, wpPostId;
	var dummy, jsonObj;

	// Initialise the JSON return objevct
	OutputJSON.kount = 0;
	OutputJSON.message = "There were no posts to return";
	OutputJSON.posts = new Array();

	// this code requests the raw RSS/XML and saves the response as a string <RSSFeed>
	objHTTP = Server.CreateObject("Msxml2.ServerXMLHTTP");
	objHTTP.open("GET",RSSURL,false);
	objHTTP.send();
	RSSFeed = objHTTP.responseXML;

	// this code takes the raw RSSFeed and loads it into an XML Object
	xmlRSSFeed = new ActiveXObject("MSXML2.DOMDocument.4.0");
	xmlRSSFeed.async = false;
	xmlRSSFeed.load(RSSFeed);

	// this code disposes of the object we called the feed with
	objHTTP = null;

	// this is where you determine how to display the content from the RSS Feed

	// this code grabs all the "items" in the RSS Feed
	objItems = xmlRSSFeed.getElementsByTagName("item");

	// this code disposes of the XML object that contained the entire feed
	xmlRSSFeed = null;
	
	if (debugging) {
		Response.Write("<br />Type of objItems is "+typeof(objItems)+"<br />");
		Response.Write("Length of objItems is "+objItems.length+"<br />");
	}

	// loop over all the items in the RSS Feed
	var x = 0;
	var kount = 0;
	while (x < objItems.length && kount < maxnumber)
	{
		// initialise the JSON object for this post
		jsonObj = new Object();

		// this code places the content from the various RSS nodes into local variables

		objItem = objItems.item(x);
		if (debugging) {
			Response.Write(objItem.xml);
			Response.Write("<br />Type of objItem is "+typeof(objItem)+"<br />");
			Response.Write("Length of objItem is "+objItem.length+"<br />");
		}

		nodeList = objItem.childNodes;
		if (debugging) {
			Response.Write("<br />Type of nodeList is "+typeof(nodeList)+"<br />");
			Response.Write("Length of nodeList is "+nodeList.length+"<br />");
		}

		for (var i=0; i<nodeList.length; i++) 
		{
			targetNode = new String(nodeList(i).nodeName).toString();
			targetNode = targetNode.toLowerCase();
			switch(targetNode)
			{
				case "title":
					title = new String(nodeList(i).text).toString();
					title = blockReplaceAll(title);
					break;
				case "link":
					link = new String(nodeList(i).text).toString();
					link = blockReplaceAll(link);
					break;
				case "description":
					description = new String(nodeList(i).text).toString();
					description = blockReplaceAll(description);
					break;
				case "pubdate":
					pubdate = new String(nodeList(i).text).toString();
					pubdateDate = new Date(nodeList(i).text)
					strDate = ddmmyyyy(pubdateDate);
					strTime = timeasstring(pubdateDate);
					pubdate = blockReplaceAll(pubdate);
					break;
				case "guid":
					guid = new String(nodeList(i).text).toString();
					guid = blockReplaceAll(guid);
					// wpPostId = getPostID(guid);
					wpPostId = guid;
					break;
			}   // end switch

		}

		objItem = null;

		jsonObj.title = title;
		jsonObj.link = link;
		jsonObj.description = description;
		jsonObj.pubdate = pubdateDate;
		jsonObj.postid = wpPostId;

		// Add new object to the array
		OutputJSON.posts.push(jsonObj);
		OutputJSON.kount += 1;    // incrment count

		x += 1;
		kount += 1;
	}

	if (OutputJSON.kount > 0) {
		OutputJSON.message = "There were "+OutputJSON.kount+" posts found.";
	} 
	
	return(OutputJSON);

}

//==================================================
function getBlogEntries(thesite) {

	var OutputHTML = new String("").toString(); // this variable will hold the HTML that was converted from the RSS Feed
	var strDate, strTime;
	var wpJSON = getBlogEntriesJSON("hamptontennis",20);  // set upper notional limit of 100 on retrieved posts

	if (wpJSON.kount > 0) {
		var x=0;
		while (x < wpJSON.posts.length) {
			strDate = ddmmyyyy(wpJSON.posts[x].pubdate);
			strTime = timeasstring(wpJSON.posts[x].pubdate);
			OutputHTML += '<div class="wordpresspost"><p class="wptitle"><a href="' + wpJSON.posts[x].link + '">';
			OutputHTML += wpJSON.posts[x].title + '</a></p><p class="wpdesc">' + wpJSON.posts[x].description + '</p><p class="wpdate">Published on:- ' + strDate + ' at ' + strTime + '</p><p class="wppostid">Post ID: '+wpJSON.posts[x].postid+'</p></div>';
			x += 1;
		}
	}

	return(OutputHTML);

}

//==================================================
function getBlogEntriesAfter(thesite, earliestdate) {

	var OutputHTML = new String("").toString(); // this variable will hold the HTML that was converted from the RSS Feed
	var strDate, strTime;
	var wpJSON = getBlogEntriesJSON("hamptontennis",20);  // set upper notional limit of 100 on retrieved posts
	var startDate = new Date(earliestdate);
	var startStr = asSortableDate(startDate);
	if (wpJSON.kount > 0) {
		var x=0;
		while (x < wpJSON.posts.length) {
			strDate = asSortableDate(wpJSON.posts[x].pubdate);
			// Response.Write("earliest date ["+startStr+"], pubdate ["+strDate+"]<br />");
			if (strDate > startStr) {
				strTime = timeasstring(wpJSON.posts[x].pubdate);
				OutputHTML += '<div class="wordpresspost"><p class="wptitle"><a href="' + wpJSON.posts[x].link + '">';
				OutputHTML += wpJSON.posts[x].title + '</a></p><p class="wpdesc">' + wpJSON.posts[x].description + '</p><p class="wpdate">Published on:- ' + strDate + ' at ' + strTime + '</p><p class="wppostid">Post ID: '+wpJSON.posts[x].postid+'</p></div>';
			}
			x += 1;
		}
	}

	return(OutputHTML);

}

//==================================================
function getUrgentBlogEntries(thesite, earliestdate) {

	var OutputHTML = new String("").toString(); // this variable will hold the HTML that was converted from the RSS Feed
	var strDate, strTime;
	var wpJSON = getBlogEntriesJSON("hamptontennis",20);  // set upper notional limit of 100 on retrieved posts
	var startDate = new Date(earliestdate);
	var startStr = asSortableDate(startDate);
	var thetitle;
	if (wpJSON.kount > 0) {
		var x=0;
		while (x < wpJSON.posts.length) {
			strDate = asSortableDate(wpJSON.posts[x].pubdate);
			// Response.Write("earliest date ["+startStr+"], pubdate ["+strDate+"]<br />");
			if (strDate > startStr) {
				// Now we need to check if the blog entry is URGENT or not
				thetitle = new String(wpJSON.posts[x].title).toString();
				thetitle = thetitle.substring(0,6);
				if (thetitle == "URGENT") {
					strTime = timeasstring(wpJSON.posts[x].pubdate);
					OutputHTML += '<div class="wordpresspost"><p class="wptitle"><a href="' + wpJSON.posts[x].link + '">';
					OutputHTML += wpJSON.posts[x].title + '</a></p><p class="wpdesc">' + wpJSON.posts[x].description + '</p><p class="wpdate">Published on:- ' + strDate + ' at ' + strTime + '</p><p class="wppostid">Post ID: '+wpJSON.posts[x].postid+'</p></div>';
				}
			}
			x += 1;
		}
	}

	return(OutputHTML);

}

</script>

