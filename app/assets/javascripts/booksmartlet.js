var bsDiv = document.createElement('div');
var docHeight = Math.max(
    Math.max(document.body.scrollHeight, document.documentElement.scrollHeight),
    Math.max(document.body.offsetHeight, document.documentElement.offsetHeight),
    Math.max(document.body.clientHeight, document.documentElement.clientHeight)
);

bsDiv.setAttribute('id', 'bs-iframe-container');

var borderWidth                = 10;
var margin                     = 5;

bsDiv.style.width              = '300px';
bsDiv.style.height             = Math.floor(docHeight - margin*2 - borderWidth*2).toString() + 'px';
bsDiv.style.position           = "fixed";
bsDiv.style.top                = margin.toString() + 'px';
bsDiv.style.right              = margin.toString() + 'px';
bsDiv.style.background         = "#efefef";
bsDiv.style.border             = borderWidth.toString() + "px solid #000";

bsDiv.style.borderRadius       = '10px';
bsDiv.style.MozBorderRadius    = '10px';
bsDiv.style.WebkitBorderRadius = '10px';

bsDiv.style.boxShadow          = '0px 0px 10px 0px #222222';
bsDiv.style.MozBoxShadow       = '0px 0px 10px 0px #222222';
bsDiv.style.WebkitBoxShadow    = '0px 0px 10px 0px #222222';

bsDiv.innerHTML                = "nothing";

document.body.appendChild(bsDiv);
