<%@ page language="java" import="com.SitWith.Request.*" pageEncoding="GBK"%>
<%@ page language="java" import="com.SitWith.Restaurant.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Object LoginedEmail=session.getAttribute("LoginedEmail");
boolean logined;
if(LoginedEmail!=null&&!LoginedEmail.equals(""))
	logined = true;
else logined = false;

String email = (String)LoginedEmail;
ArrayList<Request> req = Request.getRequest(email);

%>
 
<html>
<style type="text/css">
</style>
<head>
<title><%=email %></title>

<meta name="keywords" content="">
<meta name="description" content="">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="layout/style.css" type="text/css">
<link rel="stylesheet" href="layout/tcal.css" type="text/css"/>
<link href='../../fonts.googleapis.com/css@family=Open+Sans_3A400,800italic,800,700,700italic,400italic' rel='stylesheet' type='text/css'>
<link href='../../fonts.googleapis.com/css@family=Fanwood+Text_3A400italic' rel='stylesheet' type='text/css'>
<link href='../../fonts.googleapis.com/css@family=Jura' rel='stylesheet' type='text/css'>

<script type="text/javascript" src="layout/js/main.js"></script>
<script type="text/javascript" src="layout/js/jquery.js"></script>
<script type="text/javascript" src="layout/js/tcal.js"></script> 

	
</script>

</head>

<body>
	<div class="wrapper">
    	<!-- HEADER BEGIN -->
        <header>
            <div id="header">
                <div class="section_top">
                    <div class="inner">
                        <div id="logo"><a href="index.jsp"><img src="layout/images/logo.png" alt="SitWith" title="SitWith"></a></div>
                        
                        <nav>
                            <ul>
                                <li class="one"><a href="index.jsp">Home</a></li>
                   	  	  		<li class="two"><a href="Set_up_a_Lunch.jsp">Begin a Lunch</a></li>
								<li class="three"><a href="">Contacts</a></li>
								<%if(logined==false) {%>
								<li class="four"><a href="Register.jsp">Sign up</a></li>
								<li class="five"><a href="#" onClick="open_login()">Sign in</a></li>
								<%} else{ %>
								<li class="six current_page_item"><a href="Account.jsp">Account</a></li>
								<li class="seven"><a href="#" onClick="open_logout()">Sign Out</a></li>
								<span class="welcomeinfo">Welcome!  <em><%= (String)LoginedEmail%></em></span>
								
								<%} %>
							</ul>
                        </nav>
                        
                        <div class="clearboth"></div>
                    </div>
                </div>
                
            </div>
        </header>
    	<!-- HEADER END -->
        
        <!-- CONTENT BEGIN -->
        <div class="content" id="set_up_content">
        	<div class="inner">
            	<div id="content_main" class="panel">
                    	<h1><p>This is your recent activity</p></h1>
                       
                        <section class="content_details">
                        	<p class="name"></p>
                            
							<div class="show_table">
								<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
							    	<tr>
								    	<td width="30%" height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">Area</span></div></td>
								        <td width="30%" height="22" bgcolor="#FFFFFF" class="STYLE1"><div align="center">Time</div></td>

								    </tr>
									<% 							
	          							for(Iterator<Request> it=req.iterator();it.hasNext(); ){
	         							Request r = it.next();  
	          						%>
	          						<tr>
	            						<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=r.getReqArea() %></span></div></td>
	            						<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=r.getReqTime() %></span></div></td>
	          						</tr>
							        <%
							        }
							        %>
								</table>
								<br>
							</div>
						</form>
						</section>
                        <div class="clearboth"></div>
                   
                    <div class="clearboth"></div>
                    
                </div>
            </div>
        </div>
        
    </div>
    <!-- CONTENT END -->
    
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
											<li><a href="https://vimeo.com/85051492"><h3>Check our video</h3></a></li>
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
                                    	<li><a href="https://twitter.com/intent/tweet?screen_name=SitWithCo" id="twitter_logo" data-size="large" data-related="SitWithCo"><img src="images/icon_twitter_1.png" alt="Twitter" title="Twitter"></a></li>
                                        <li><a href="https://www.facebook.com/sitwithco"><img src="images/icon_facebook_1.png" alt="Facebook" title="Facebook"></a></li>
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