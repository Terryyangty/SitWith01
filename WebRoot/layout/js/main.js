
/*
 * login and logout
 */
function open_login(){
	document.getElementById('box').style.display='block';
	document.getElementById('loginbg').style.display='block';
	var oBox = document.getElementById("box");
	var oBtn = oBox.getElementsByTagName("h2")[0];
	var disX = 0;
	var disY = 0;
	oBtn.onmousedown = function(ev){
		var oEvent = ev||event;
		disX = oEvent.clientX-oBox.offsetLeft;
		disY = oEvent.clientY-oBox.offsetTop;
		oBox.style.cursor = "crosshair";
		document.onmousemove = function(ev){
			var oEvent = ev||event;
			var l = oEvent.clientX-disX;
			var t = oEvent.clientY-disY;
			oBox.style.margin = 0;
			if(l<0){
				l=0;
			}else if(l>document.documentElement.clientWidth-oBox.offsetWidth){
				l=document.documentElement.clientWidth-oBox.offsetWidth;
			}
			if(t<0){
				t=0;
			}else if(t>document.documentElement.clientHeight-oBox.offsetHeight){
				t=document.documentElement.clientHeight-oBox.offsetHeight;
			}
			oBox.style.left = l+"px";
			oBox.style.top = t+"px";
		}
		document.onmouseup = function(){
			document.onmousemove = null;
			document.onmouseup = null;
			oBox.style.cursor = "default";
		}
		return false;
	}
}

function close_login(){
	document.getElementById('box').style.display='none';
	document.getElementById('loginbg').style.display='none';
}

function open_logout(){
	document.getElementById('logoutbox').style.display='block';
	document.getElementById('logoutbg').style.display='block';
	var oBox = document.getElementById("logoutbox");
	var oBtn = oBox.getElementsByTagName("h2")[0];
	var disX = 0;
	var disY = 0;
	oBtn.onmousedown = function(ev){
		alert("mousedown!");
		var oEvent = ev||event;
		disX = oEvent.clientX-oBox.offsetLeft;
		disY = oEvent.clientY-oBox.offsetTop;
		oBox.style.cursor = "crosshair";
		document.onmousemove = function(ev){
			var oEvent = ev||event;
			var l = oEvent.clientX-disX;
			var t = oEvent.clientY-disY;
			oBox.style.margin = 0;
			if(l<0){
				l=0;
			}else if(l>document.documentElement.clientWidth-oBox.offsetWidth){
				l=document.documentElement.clientWidth-oBox.offsetWidth;
			}
			if(t<0){
				t=0;
			}else if(t>document.documentElement.clientHeight-oBox.offsetHeight){
				t=document.documentElement.clientHeight-oBox.offsetHeight;
			}
			oBox.style.left = l+"px";
			oBox.style.top = t+"px";
		}
		document.onmouseup = function(){
			document.onmousemove = null;
			document.onmouseup = null;
			oBox.style.cursor = "default";
		}
		return false;
	}
}

function close_logout(){
	document.getElementById('logoutbox').style.display='none';
	document.getElementById('logoutbg').style.display='none';
}


/*
 * twitter
 */

!function(d,s,id){
	var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';
	if(!d.getElementById(id)){
		js=d.createElement(s);
		js.id=id;
		js.src=p+'://platform.twitter.com/widgets.js';
		fjs.parentNode.insertBefore(js,fjs);
	}
}(document, 'script', 'twitter-wjs');


/**
  * The registration javascript code
  */

//This help submit the list of the restaurant
function resFormSubmit(){
	document.getElementById("restaurantForm").submit();
}

//This submit the 
function setuplunchFormSubmit(){
	
	document.getElementById("setuplunchForm").submit();
}