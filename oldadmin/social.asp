<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Social News");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var kount, thetext, theparas;
var title, issueno, issueseq, author, articletext;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var SQLStmt;
var thearticle = new String("NONE");
thearticle=new String(Request.QueryString("article"));
if (thearticle=="undefined")
	thearticle="NONE";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
    <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
        <td valign="TOP" align="LEFT" width="440">
	 <!--#include file="tickertape.asp" -->
					<br>
					<h2>
						Dates for the Diary
					</h2>
					<div name="thenews" class="tdfont">
<%
if (thearticle == "NONE")
{
		// Generate headings and texts from the database
		// Use the articles table checking on newsitem = "Y"
		// put into descending order of articleid so we get
		// the newest one first
SQLStmt = new String("SELECT title, author, articletext from articles where newsitem = 'Y' and articlesection like 'SOCIAL' order by newspriority asc, articleid desc");
RstObj = ConnObj.Execute(SQLStmt);
while (! RstObj.EOF)
{
thetext=null;
thetext=new String(RstObj("articletext"));
theparas=thetext.split("|");
%>
            <h3><%= RstObj("title") %></h3>
<%
// Loop through the paras
for(i=0; i<theparas.length; i++)
	Response.Write(theparas[i]+"<br><br>");
%>
		<hr align="center" width="50%">
<%
RstObj.MoveNext();
}
%>
					</div>
        </td>
<%
}
%>
    <comment>Column 3 reserved for internal and external advertising</comment>
    </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
