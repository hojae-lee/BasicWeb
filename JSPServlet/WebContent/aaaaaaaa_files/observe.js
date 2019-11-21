    /**
    * 폼엘리먼트의 value 가 변화되면 keyup 이벤트 발생시키기
    *
    * @author hooriza at nhncorp.com
    * @version 0.1
    *
    * @created Nov.8.2007.
    */
     
    var Observe = function(oEl) {
     
      if(oEl==null) return false;
      if(jQuery.browser.mozilla != true)	return false;
      this._o = oEl;
      this._value = oEl.value;
     
      this._bindEvents();
     
    };
     
    Observe.prototype._bindEvents = function() {
     
      var self = this;
      var bind = function(oEl, sEvent, pHandler) {
        if (oEl.attachEvent) oEl.attachEvent('on' + sEvent, pHandler);
        else oEl.addEventListener(sEvent, pHandler, false);
      };
     
      bind(this._o, 'focus', function() {
       
        if (self._timer) clearInterval(self._timer);
        self._timer = setInterval(function() {
         
          // window.console.debug('compare : ' + self._value + ' == ' + self._o.value);
          if (self._value != self._o.value) {
            self._value = self._o.value;
            self._fireEvent();
          }
         
        }, 50);
       
      });
     
      bind(this._o, 'blur', function() {
       
        if (self._timer) clearInterval(self._timer);
        self._timer = null;
       
      });
               
    };
     
    Observe.prototype._fireEvent = function() {
    	
      if(isAutoKeyTrigger){
             
      if (document.createEvent) {
       
        var e;
       
        if (window.KeyEvent) {
         
          e = document.createEvent('KeyEvents');
          e.initKeyEvent('keyup', true, true, window, false, false, false, false, 65, 0);
         
        } else {
         
          e = document.createEvent('UIEvents');
          e.initUIEvent('keyup', true, true, window, 1);
          e.keyCode = 65;
         
        }
       
        this._o.dispatchEvent(e);
       
      } else {
       
        var e = document.createEventObject();
        e.keyCode = 65;
       
        this._o.fireEvent('onkeyup', e);
       
      }
     
      }
    };