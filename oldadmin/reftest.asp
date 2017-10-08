<%@ LANGUAGE="VBSCRIPT" %>
<%
Dim referrer
Dim refdomain
Dim mypos
Dim myendpos
Dim mylen
referrer = Request.ServerVariables("HTTP_REFERRER")
mylen = Len(referrer)
mypos = InStr(1,referrer,"//",1)
refdomain = Right(referrer,(mylen-mypos))
myendpos = InStr(1,refdomain,"/",1)
' refdomain = Left(refdomain,(myendpos-1))
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<TITLE>Server Variables</TITLE>
</HEAD>
<BODY>
mypos = [<%= mypos %>]
myendpos = [<%= myendpos %>]
mylen = [<%= mylen %>]
referrer = [<%= referrer %>]
refdomain = [<%= refdomain %>]
</BODY></HTML>
<%
%>
