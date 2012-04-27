while (!jQuery) {}

try {
  var REDMOI_HOME = 'http://127.0.0.1:3000/';
  var forceRemove = function() {
   $("#REDMOI_SIDEBAR").remove();
  }
  forceRemove();

  var core = function() {
    this.isInit = false;


    this.shadowHeight = 4;
  }

  core.prototype =
  {
    exitTime : 5000,
    build : function() {
      var scale = window.innerWidth / screen.availWidth;
      if (scale < 1) scale = 1;
      var boxHeight = window.innerHeight;
      var boxWidth = 200;
      var positionX = window.innerWidth - boxWidth;

      var styles = '\
      \
      #REDMOI_SIDEBAR\
      {\
      position: fixed;\
      margin: 0;\
      padding: 10px;\
      top: 0px;\
      left: ' + positionX + 'px;\
      width: ' + boxWidth + 'px;\
      height: ' + boxHeight + 'px;\
      border-left:1px solid white;\
      -webkit-box-shadow:0px 0px '+this.shadowHeight+'px rgba(0,0,0,0.4);\
      -moz-box-shadow:0px 0px '+this.shadowHeight+'px rgba(0,0,0,0.4);\
      -o-box-shadow:0px 0px '+this.shadowHeight+'px rgba(0,0,0,0.4);\
      box-shadow:0px 0px '+this.shadowHeight+'px rgba(0,0,0,0.4);\
      z-index: 999999999;\
      font: 14px arial,sans-serif;\
      color: #000000;\
      line-height: 1.0em;\
      background-color: #f3f3f3;\
      }\
      \
      #REDMOI_CANCEL\
      {\
      margin-left:-6px;\
      margin-top:-8px;\
      }\
      \
      #REDMOI_SIDEBAR h3\
      {\
      margin: 2px;\
      padding: 0px;\
      color: #000000;\
      font: 20px arial,sans-serif;\
      line-height: 1.6em;\
      }\
      \
      #REDMOI_SIDEBAR a\
      {\
      color: #AF2F4F;\
      text-decoration: none;\
      }\
      ';

      var overlay = '<div id="REDMOI_SIDEBAR" style="display:none;"><div id="REDMOI_CANCEL"><a href="#">X</a></div><h3>Redmoi</h3><div id="REDMOI_NOTICE"></div><div id="REDMOI_COUNTDOWN"></div></div>';
      overlay += '<div id="REDMOI_RUNNER"></div>';
      document.body.innerHTML += '<style>'+styles+'</style>' + overlay;

      // bind remove method
      $('#REDMOI_CANCEL').click(forceRemove);
    },

    checkAuth : function() {
      var self = this;
      if (this.img && this.img.width > 0) {
	var w = this.img.width;
	clearInterval(this.imgHandler);
	$('#REDMOI_SIDEBAR').slideDown();

	if (w == 1) // Success
	{
	  $('#REDMOI_NOTICE').html('Saved!');
	  self.exit();
	}
       	else if (w == 2) // Failed
	{
	  $('#REDMOI_NOTICE').html('Falied, try again...');
	}
	else // Not login
	{
	  $('#REDMOI_NOTICE').html('Please <a href="' + REDMOI_HOME + '" target="_blank">login</a>');
	}
	this.img.style.display = 'none';
      }
    },

    save : function() {
      var self = this;
      var func = function(){self.checkAuth()};
      this.url = encodeURIComponent(document.location.href);
      this.img = new Image();
      this.img.onload = func;
      this.img.src = REDMOI_HOME+'gathers/extadd?url='+this.url;
      document.body.appendChild(this.img);

      this.imgHandler = setInterval(func, 300);
    },

    exit : function() {
      var leftSeconds = this.exitTime / 1000;
      $('#REDMOI_COUNTDOWN').html('Close in <span id="REDMOI_CLOCK">' + leftSeconds + '</span> seconds...');
      var clockHandler = setInterval(function() {$('#REDMOI_CLOCK').html(leftSeconds)}, 500);
      var countdownHandler = setInterval(function() {leftSeconds--;}, 1000);
      setTimeout(function() {clearInterval(clockHandler);}, this.exitTime + 1000);
      setTimeout(function() {clearInterval(countdownHandler);}, this.exitTime + 1000);

      var block = document.createElement('script');
      block.type = 'text/javascript';
      block.innerHTML += 'setTimeout(\'$("#REDMOI_SIDEBAR").slideUp(500, function(){$(this).remove();});\', ' + (this.exitTime + 500) + ');';
      document.getElementById('REDMOI_RUNNER').appendChild(block);
    },

  };
  var REDMOI_CORE = new core;
  REDMOI_CORE.build();
  REDMOI_CORE.save();

  void(0); } catch(e) { alert(e); }
