/*------------------------------------------------------------------------------
Function:       TabInterface()
Author:         Aaron Gustafson (aaron at easy-designs dot net)
Creation Date:  7 December 2006
Version:        0.3
Homepage:       http://github.com/easy-designs/tabinterface.js
License:        MIT License (see MIT-LICENSE)
Note:           If you change or improve on this script, please let us know by
                emailing the author (above) with a link to your demo page.
------------------------------------------------------------------------------*/
function TabInterface( _cabinet, _i ){
  this.Version = '0.3';
  var
  _active  = false,
  _index   = document.createElement( 'ul' ),
  _els     = {
    div: document.createElement( 'div' ),
    li:  document.createElement( 'li' )
  };
  function initialize()
  {
    var _id, node, nextNode,
    headers = [ 'h1', 'h2', 'h3', 'h4', 'h5', 'h6' ],
    i, len, _tag, rexp,
    arr, folder, tab, heading;
    _id = _cabinet.getAttribute( 'id' ) || 'cabinet-' + _i;
    if( !_cabinet.getAttribute( 'id' ) ) _cabinet.setAttribute( 'id', _id );
    node = _cabinet.firstChild;
    while( node ){
      nextNode = node.nextSibling;
      if( node.nodeType == 3 &&
          !( /\S/ ).test( node.nodeValue ) )
        _cabinet.removeChild( node );
      node = nextNode;
    }
    for( i=0, len=headers.length; i<len; i++ ){
      if( _cabinet.firstChild.nodeName.toLowerCase() == headers[i] ){
        _tag = headers[i];
        break;
      }
    }
    rexp = new RegExp( '<(' + _tag + ')', 'ig' );
    arr  = _cabinet.innerHTML.replace( rexp, "||||<$1" ).split( '||||' );
    arr.shift();
    _cabinet.innerHTML = '';
    addClassName( _cabinet, 'tabbed-on' );
    removeClassName( _cabinet, 'tabbed' );
    for( i=0, len=arr.length; i<len; i++ ){
      folder = _els.div.cloneNode( true );
      folder.setAttribute( 'id', _id + '-' + i );
      folder.innerHTML = arr[i];
      addClassName( folder, 'folder' );
      _cabinet.appendChild( folder );
      heading = folder.getElementsByTagName( _tag )[0];
      addClassName( heading, 'hidden' );
      tab = _els.li.cloneNode( true );
      tab.setAttribute( 'id', _id + '-' + i + '-tab' );
      tab.onclick = swap;
      tab.innerHTML = heading.innerHTML;
      _index.appendChild( tab );
      if( i === 0 ){
        addClassName( folder, 'visible' );
        _active = _id + '-' + i;
        addClassName( tab, 'active' );
      }
    }
    addClassName( _index, 'index' );
    _cabinet.appendChild( _index );
  }
  function swap( e )
  {
    e = ( e ) ? e : event;
    var tab = e.target || e.srcElement;
    var folder_id = tab.getAttribute( 'id' ).replace( '-tab', '' );
    removeClassName( document.getElementById( _active + '-tab' ), 'active' );
    removeClassName( document.getElementById( _active ), 'visible' );
    addClassName( tab, 'active' );
    addClassName( document.getElementById( folder_id ), 'visible' );
    _active = folder_id;
  }
  function addClassName( e, c )
  {
    var classes = ( !e.className ) ? [] : e.className.split( ' ' );
    classes.push( c );
    e.className = classes.join( ' ' );
  }
  function removeClassName( e, c )
  {
    var classes = e.className.split( ' ' );
    for( var i=classes.length-1; i>=0; i-- ){
      if( classes[i] == c ) classes.splice( i, 1 );
    }
    e.className = classes.join( ' ' );
  }
  initialize();
};