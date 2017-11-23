<script language="JScript" CODEPAGE="65001" runat=Server>
// List of function prototypes
//
// showXML
//==================================================
<!-- XML content starts here -->
//
function showXML(xmlfile, xsltfile) {
var source, stylesht;
// Load the XML document
source = Server.CreateObject("Microsoft.XMLDOM")
source.async = false
source.load(Server.MapPath(xmlfile))

// Load the XSL stylesheet
stylesht = Server.CreateObject("Microsoft.XMLDOM")
stylesht.async = false
stylesht.load(Server.MapPath(xsltfile))

//  Write out the page contents
Response.Write(source.transformNode(stylesht))

//  Destroy all object references
source=null;
style=null;
}
//
<!-- XML content ends here -->
</script>