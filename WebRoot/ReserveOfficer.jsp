<%@ page language="java" import="com.SitWith.User.*" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Object LoginedEmail=session.getAttribute("LoginedEmail");
boolean logined;
if(LoginedEmail!=null&&!LoginedEmail.equals(""))
	logined = true;
else logined = false;
 %>
<html>

<head>
<title>SitWith - Main</title>


<link rel="stylesheet" href="layout/style.css" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,800italic,800,700,700italic,400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Fanwood+Text:400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Jura' rel='stylesheet' type='text/css'>

<script type="text/javascript" src="layout/js/jquery.js"></script>


<!-- Anything Slider begin -->
<link rel="stylesheet" href="layout/plugins/anything_slider/anythingslider.css" type="text/css"/>

<script type="text/javascript" src="layout/plugins/anything_slider/jquery.anythingslider.js"></script>
<!-- Anything Slider end -->

<!-- Galleriffic start -->
<script type="text/javascript" src="layout/plugins/galleriffic/jquery.galleriffic.js"></script>
<script type="text/javascript" src="layout/plugins/galleriffic/jquery.history.js"></script>
<script type="text/javascript" src="layout/plugins/galleriffic/jquery.opacityrollover.js"></script>
<!-- Galleriffic end -->

<!-- PrettyPhoto start -->
<link rel="stylesheet" href="layout/plugins/prettyphoto/css/prettyPhoto.css" type="text/css"/>
<script type="text/javascript" src="layout/plugins/prettyphoto/jquery.prettyPhoto.js"></script>
<!-- PrettyPhoto end -->

<!-- QuickSand start -->
<script type="text/javascript" src="layout/plugins/quicksand/jquery.quicksand.js"></script>
<!-- QuickSand end -->

<!-- Kwicks start -->
<script type="text/javascript" src="layout/plugins/kwicks/jquery.kwicks-1.5.1.pack.js"></script>
<!-- Kwicks end -->



<script type="text/javascript" src="layout/js/main.js"></script>


</head>

<body>
	<div class="wrapper main">
    	<!-- HEADER BEGIN -->
        <header>
            <div id="header">
                <div class="section_top">
                    <div class="inner">
                        <div id="logo"><a href="index.jsp"><img src="layout/images/logo.png" alt="SitWith" title="SitWith"></a></div>
                        
                        <nav>
                            <ul>
                                <li class="one current_page_item"><a href="index.jsp">Home</a></li>
                   	  	  		<li class="two"><a href="Set_up_a_Lunch.jsp">Begin a Lunch</a></li>
								<li class="three"><a href="">Contacts</a></li>
								<%if(logined==false) {%>
								<li class="four"><a href="Register.jsp">Sign up</a></li>
								<li class="five"><a href="#" onClick="open_login()">Sign in</a></li>
								<%} else{ %>
								<li class="six"><a href="#" onClick="open_logout()">Sign Out</a></li>
								<span class="welcomeinfo">Welcome!  <em><%= (String)LoginedEmail%></em></span>
								
								<%} %>
							</ul>
                        </nav>
							
                        <div class="clearboth"></div>
						
                    </div>
                </div>
                
                
                <div class="section_bottom">
                	<div class="inner">
                        <div class="block_signup_top">
							<div class="text">
                                <form method="post" name="register" action="Register">
                                	<input type="hidden" name="action" value="register"/>
									<p class="title"><span>Sign Up</span></p>
                                    <p class="subtitle">First Name</p>
                                    <div class="field"><input type="text" id="fName" name="fName" placeholder="First Name"></div>
                                    
									<p class="subtitle">Last Name</p>
                                    <div class="field"><input type="text" id="lName" name="lName" placeholder="Last Name"></div>
									
                                    <p class="subtitle">Email</p>
                                    <div class="field"><input type="text" id="Email" name="Email" placeholder="Email Address"></div>
                                            
                                    <p class="subtitle">Password</p>
                                    <div class="field"><input type="password" id="password" name="password" placeholder="Password"></textarea></div>
                                    
									<p class="subtitle">Confirm Password</p>
                                    <div class="field"><input type="password" id="password2" name="password2" placeholder="Re-enter Password"></textarea></div>
                                    <button type="submit" class="general_button" name="websubmit" id="signup_b_1">Sign Up</button>
                                </form>
							</div>
							
                            <div class="picture">
                            	<div class="block_image_w_shadow_1">
                                	<img src="layout/images/landing_pic.jpg" width="500" height="316" frameborder="0"></img>
                                	<img src="layout/images/pic_shadow_3.png" class="shadow" alt="">
                                </div>  
                            </div>
                            
                        	<div class="clearboth"></div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </header>
    	<!-- HEADER END -->
        
        
        
            <div id="footer">
            	<div class="section_bottom">
                	<div class="inner">
                    	<div class="block_footer_widgets">
							<div class="column">
                            	<div class="widgets_set">
                                	<div class="widgets_set">
										<br>
										<ul>
											<li><a href="#"><h3>What is SitWith?</h3></a></li>
											<li><a href="#"><h3>Our Story</h3></a></li>
											<li><a href="#"><h3>FAQ</h3></a></li>
										</ul>
                                	
									</div>   
                                </div>
                            </div>
							
							<div class="column">
                            	<div class="widgets_set">
                                	<div class="widgets_set">
										<br>
										<ul>
											<li><a href="#"><h3>Check our video</h3></a></li>
											<li><a href="#"><h3>Terms of Use</h3></a></li>
											<li><a href="#"><h3>Testimonials</h3></a></li>
										</ul>
									</div>   
                                </div>
                            </div>
							
                        	<div class="column">
                            	<div class="widgets_set">
									<br>
                                	<h3>Follow us on: </h3>
                                    
                                    <ul>
                                    	<li><a href="#"><img src="images/icon_twitter_1.png" alt="Twitter" title="Twitter"><h3>@Twitter</h3></a></li>
                                        <li><a href="#"><img src="images/icon_facebook_1.png" alt="Facebook" title="Facebook"><h3>Facebook</h3></a></li>
                                        <li><a href="#"><img src="images/icon_flickr_1.png" alt="Flickr" title="Flickr"><h3>Flickr</h3></a></li>
                                    </ul>
                                </div>
                                
                                <div class="line_1" style="margin:0px 0px 34px;"></div>
                                
                                
                                
                            </div>
                            
                            
                          
                            
                            <div class="column wide">
                            	<div class="widgets_set">
									<br>
                                	<h3>Contact Us</h3>
                                    
                                    <div class="block_contact_us">
                                    	<form action="#">
                                        	<p>Name</p>
                                            <div class="field"><input type="text"></div>
                                            
                                            <p>Email</p>
                                            <div class="field"><input type="text"></div>
                                            
                                            <p>Message</p>
                                            <div class="textarea"><textarea cols="1" rows="1"></textarea></div>
                                            
                                            <div class="button"><input type="submit" class="general_button alignright" value="Submit"></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="clearboth"></div>
                    </div>
                </div>
            </div>
        <!-- FOOTER END -->
    </div>
    
    <div id="loginbg"></div>
	<div id="box" style="display:none;">
	    <h2 id="Login_title">Login</h2>
		
	    <div class="login">
	    <form action="Login" method = "post">
	        <p><label>Email£º          </label><input type="text" name="Login_Email" id="Login_Email" class="text"></p>
	        <p><label>Password:</label><input type="password" name="Login_Password" id="Login_Password" class="text"></p>
	        <p><input type="submit" name="" id="" value="submit" class="btn"/><input id="login_close_button" type="button" title="cancel" value="cancel" class="btn" onClick="close_login()" /></p>		
	    </form>
	    </div>
	</div>
	
	<div id="logoutbg"></div>
	<div id="logoutbox" style="display:none;">
	    <h2 id="Logout_title">Logout</h2>
		
	    <div class="logout">
	    <form action="Logout" method = "post">
	        <p>Do you really want to log out?</p>
	        <p><input type="submit" name="" id="" value="Yes" class="btn"/><input id="logout_close_button" type="button" title="cancel" value="cancel" class="btn" onClick="close_logout()" /></p>		
	    </form>
	    </div>
	</div>
    
</body>
</html>