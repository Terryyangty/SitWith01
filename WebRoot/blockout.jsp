<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>JavaScript</title>
<style type="text/css">
* { margin:0; padding:0; }
/*login*/
#loginbg {display: none; position: absolute; top:0; left:0; z-index:200; height:100%; 
width:100%; background: #000000; filter:alpha(opacity=30); -moz-opacity:0.3; opacity:0.3;}
#box { width:400px; height:200px; background:#f9f9f9; border:1px solid #ccc; z-index:201; position:absolute; left:50%; top:50%; margin:-100px 0 0 -200px; border-radius:4px; box-shadow:0 0 15px #ddd; }
.title { padding:10px 20px; background-color:#f1f1f1; border-bottom:1px solid #ddd; font-size:14px; color:#333; }
.login { padding:30px 0 0 50px; }
.login p { margin-bottom:10px; font-size:14px; }
.login input.text { width:200px; padding:5px; border:1px solid #ddd; vertical-align:middle; }
.login input.btn { width:70px; padding:6px; border:1px solid #ddd; margin-left:41px; cursor:pointer; }


</style>
</head>

<body>

<a href="#" onClick="open_login()" style="font-size:24px;">Login</a>
<div id="loginbg"></div>
<div id="box" style="display:none;">
    <h2 id="login_title">Login</h2>
	
    <div class="login">
    <form action="">
        <p><label>UserName：</label><input type="text" name="" id="" class="text"></p>
        <p><label>Password：    </label><input type="text" name="" id="" class="text"></p>
        <p><input type="submit" name="" id="" value="submit" class="btn"/><input id="login_close_button" type="button" title="cancel" value="cancel" class="btn" onClick="close_login()" /></p>		
    </form>
    </div>
</div>


<script type="text/javascript">

	function open_login(){
		document.getElementById('box').style.display='block';
		document.getElementById('loginbg').style.display='block';
		var oBox = document.getElementById("box");
		var oBtn = oBox.getElementById("login_title")[0];
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
	
	

</script>
</body>
</html>