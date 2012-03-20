// functions

var url     = "{{url}}";
var api_key = "{{api_key}}";

calcHeight = function(){
  return Math.floor( getDocHeight() - defaults.margin*2  - defaults.borderWidth*2 ).toString() + 'px';
}

getDocHeight = function(){
  return window.innerHeight;
  // return Math.max(
  //   Math.min(window.innerHeight, window.scrollHeight),
  //   Math.min(window.offsetHeight, window.offsetHeight),
  //   Math.min(window.clientHeight, window.clientHeight)
  // );
}

window.bsCloseOverlay = function(){
  element = document.getElementById("bs-iframe-container");
  element.parentNode.removeChild(element);
}

getIframe = function(){
  url += "?api_key=" + api_key + "&url=" + encodeURI(window.location.href);

  var m = document.getElementsByTagName('meta');
  for(var i in m){
    if( typeof(m[i].name) !== 'undefined' && m[i].name.toLowerCase() == 'keywords'){
      url += "&tags=" + encodeURI( m[i].content );
      break;
    }
  }
  return '<iframe id="bs-iframe" frameborder="no" width="100%" height="100%" src="' + url + '"></iframe>'
}

// procedural
// set the divs attributes
var defaults = { borderWidth: 11, margin: 5};
var resets   = "background:none; border:none; bottom:auto; clear:none; cursor:default; display:inline; float:none; font-family:Arial, Helvetica, sans-serif; font-size:medium; font-style:normal; font-weight:normal; height:auto; left:auto; letter-spacing:normal; line-height:normal; max-height:none; max-width:none; min-height:0; min-width:0; overflow:visible; position:static; right:auto; text-align:left; text-decoration:none; text-indent:0; text-transform:none; top:auto; visibility:visible; white-space:normal; width:auto; z-index:auto;";

var shadowStyle = "box-shadow: rgb(34, 34, 34) 0px 0px 5px 0px; -webkit-box-shadow: rgb(34, 34, 34) 0px 0px 5px 0px";

var containerStyles = resets + "z-index:10000; width:355px; height:1073px; position:fixed; top:" + defaults.margin + "px; right:" + defaults.margin + "px; background-color:rgb(239, 239, 239); border:"+ defaults.borderWidth +"px solid #000000; -webkit-border-radius: 12px; -moz-border-radius: 12px; border-radius: 12px;" + shadowStyle;

var closeStyles = resets + "width:20px; height:20px; text-align:center; position:absolute; top:-15px; left:-18px; background-color:#000000; border:3px solid #ffffff; -webkit-border-radius: 15px; -moz-border-radius: 15px; border-radius: 15px;" + shadowStyle;

var closeBtn = '<a href="javascript:window.bsCloseOverlay();" style="' + resets + 'cursor:pointer;font-weight:bold;text-align:center;display:block;color:#ffffff;line-height:22px;font-size:17px;">&times;</a>';

var bsDiv = document.createElement('div');
bsDiv.setAttribute('id', 'bs-iframe-container');
bsDiv.setAttribute( 'style', containerStyles );
document.body.appendChild(bsDiv);
bsDiv.innerHTML = getIframe();

var closeContainer = document.createElement('div');
closeContainer.setAttribute('style', closeStyles);
bsDiv.appendChild(closeContainer);
closeContainer.innerHTML = closeBtn;
bsDiv.appendChild(closeContainer);

window.onresize = function(){ bsDiv.style.height = calcHeight(); }
window.onresize();
