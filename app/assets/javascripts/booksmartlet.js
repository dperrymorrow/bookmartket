
if(window.dpm == undefined){window.dpm = {};}
window.dpm.Booksmartlet = function(){

  this.bsDiv        = null;
  this.closeBtn    = null;
  this.margin      = 5;
  this.padding     = 0;
  this.width       = 355;
  this.borderWidth = 11;
  this.url         = '';

  this.init = function(url){
    this.url   = url;
    this.bsDiv = document.createElement('div');

    this.bsDiv.setAttribute('id', 'bs-iframe-container');

    this.bsDiv.style.width              = this.width.toString() + 'px';
    this.bsDiv.style.height             = this.calcHeight();
    this.bsDiv.style.position           = "fixed";
    this.bsDiv.style.padding            = this.padding.toString() + 'px';
    this.bsDiv.style.top                = this.margin.toString() + 'px';
    this.bsDiv.style.right              = this.margin.toString() + 'px';
    this.bsDiv.style.backgroundColor        = "#efefef";
    this.bsDiv.style.border             = this.borderWidth.toString() + "px solid #222222";

    this.bsDiv.style.borderRadius       = '10px';
    this.bsDiv.style.MozBorderRadius    = '10px';
    this.bsDiv.style.WebkitBorderRadius = '10px';

    this.bsDiv.style.boxShadow          = '0px 0px 5px 0px #222222, inset 0px 0px 4px 0px #888888';
    this.bsDiv.style.MozBoxShadow       = '0px 0px 5px 0px #222222, inset 0px 0px 4px 0px #888888';
    this.bsDiv.style.WebkitBoxShadow    = '0px 0px 5px 0px #222222, inset 0px 0px 4px 0px #888888';

    this.bsDiv.innerHTML                = this.getIframe();

    document.body.appendChild(this.bsDiv);
    this.buildCloseBtn();

    loc = this;
    window.onresize = function(){
      loc.bsDiv.style.height = loc.calcHeight();
    }

    return this;
  }

  this.buildCloseBtn = function(){
    this.closeBtn                          = document.createElement('div');
    this.closeBtn.style.width              = '20px';
    this.closeBtn.style.height             = '20px';
    this.closeBtn.style.textAlign          = 'center';
    this.closeBtn.style.position           = "absolute";
    this.closeBtn.style.padding            = '0px';
    this.closeBtn.style.top                = '-15px';
    this.closeBtn.style.left               = '-18px';
    this.closeBtn.style.backgroundColor    = "#000000";
    this.closeBtn.style.border             = "3px solid #FFFFFF";

    this.closeBtn.style.borderRadius       = '15px';
    this.closeBtn.style.MozBorderRadius    = '15px';
    this.closeBtn.style.WebkitBorderRadius = '15px';

    this.closeBtn.style.boxShadow          = '0px 0px 10px 0px #222222';
    this.closeBtn.style.MozBoxShadow       = '0px 0px 10px 0px #222222';
    this.closeBtn.style.WebkitBoxShadow    = '0px 0px 10px 0px #222222';
    this.closeBtn.innerHTML                = '<a href="javascript:bsInst.destroy();" style="cursor:pointer;font-family:Arial,sans-serif;padding:0;margin:0;font-weight:bold;text-align:center;display:block;color:#ffffff;line-height:22px;font-size:17px;text-decoration:none;">&times;</a>';

    this.bsDiv.appendChild(this.closeBtn);
  }

  this.getIframe = function(){
    var appendedUrl = this.url;
    appendedUrl+= "&url=" + encodeURI(window.location.href);

    var m = document.getElementsByTagName('meta');
    for(var i in m){
      if( m[i].name.toLowerCase() == 'keywords'){
        appendedUrl+= "&tags=" + encodeURI( m[i].content );
        break;
      }
    }

    return '<iframe id="bs-iframe" frameborder="no" width="100%" height="100%" src="' + appendedUrl + '"></iframe>'
  }

  this.getDocHeight = function(){
    return Math.max(
      Math.max(document.body.scrollHeight, document.documentElement.scrollHeight),
      Math.max(document.body.offsetHeight, document.documentElement.offsetHeight),
      Math.max(document.body.clientHeight, document.documentElement.clientHeight)
    );
  }

  this.calcHeight = function(){
    return Math.floor(this.getDocHeight() - this.margin*2 - this.padding*2 - this.borderWidth*2).toString() + 'px';
  }

  this.destroy = function(){
    document.body.removeChild(this.bsDiv);
  }
}

var bsInst = new window.dpm.Booksmartlet().init('http://localhost:3000/iframe/bookmarks?hash=FQKTLEDD');