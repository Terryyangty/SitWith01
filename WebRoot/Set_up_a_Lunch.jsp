<%@ page language="java" import="com.SitWith.Restaurant.*" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Object LoginedEmail=session.getAttribute("LoginedEmail");
boolean logined;
if(LoginedEmail!=null&&!LoginedEmail.equals(""))
	logined = true;
else logined = false;
String area = "";
if(request.getParameter("restaurantSelect")!=null)
	area = request.getParameter("restaurantSelect");
else area = "";
ArrayList<Restaurant> res = Restaurant.getAreaRestaurant(area);
 %>
<html>
<style type="text/css">
</style>
<head>
<title>SitWith-Set up a lunch</title>

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


<script type="text/javascript">	
	
	
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
                   	  	  		<li class="two current_page_item"><a href="Set_up_a_Lunch.jsp">Begin a Lunch</a></li>
								<li class="three"><a href="">Contacts</a></li>
								<%if(logined==false) {%>
								<li class="four"><a href="Register.jsp">Sign up</a></li>
								<li class="five"><a href="#" onClick="open_login()">Sign in</a></li>
								<%} else{ %>
								<li class="six"><a href="Account.jsp">Account</a></li>
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
                    	<h1><p>Get a Lunch</p></h1>
                       
                        <section class="content_details">
                        	<p class="name">Details</p>
                            <p class="detail">Talking to new people and forming connections can be tricky. We unknowingly place a number of pressures and expectations when we meet someone new. If there was a way to reduce this pressure, we would be free to have great conversations in a way we don't experience often enough. SitWith creates conversation and connections by bringing users together over a meal, and just a meal. By having a clear start and finish to the interaction and no expectation to form a lasting connection, SitWith creates the ideal setting for memorable interactions with new people.</p>
                            
							<form name="restaurantForm" id="restaurantForm" method="post">
								<div id="select_area">
									<p class="name">Please select the area:</p>
									<select id="restaurantSelect" name="restaurantSelect" onChange="resFormSubmit()">
										<option value="" selected='selected'></option>									
										<option <%=area.equals("Shadyside")?"selected='selected'":"" %> value="Shadyside">Shadyside</option>
										<option <%=area.equals("Squirrel Hill")?"selected='selected'":"" %> value="Squirrel Hill">Squirrel Hill</option>
										<option <%=area.equals("Oakland")?"selected='selected'":"" %> value="Oakland">Oakland</option>
									</select>
								</div>
								<div id="show_res">
									<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
							        	<tr>
								            <td width="14%" height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">Name</span></div></td>
								            <td width="15%" height="22" bgcolor="#FFFFFF" class="STYLE1"><div align="center">Address</div></td>
								            <td width="10%" height="22" bgcolor="#FFFFFF" class="STYLE1"><div align="center">Street</div></td>
								            <td width=6%" height="22" bgcolor="#FFFFFF" class="STYLE1"><div align="center">City</div></td>
								            <td width=8%" height="22" bgcolor="#FFFFFF" class="STYLE1"><div align="center">Area</div></td>
								            <td width=6%" height="22" bgcolor="#FFFFFF" class="STYLE1"><div align="center">Zip</div></td>
								        </tr>
										<% 							
	          								for(Iterator<Restaurant> it=res.iterator();it.hasNext(); ){
	         								Restaurant r = it.next();  
	          							%>
	          							<tr>
	            							<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=r.getRName() %></span></div></td>
	            							<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=r.getRAdress() %></span></div></td>
	            							<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=r.getRStreet() %></span></div></td>
	            							<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=r.getRCity() %></span></div></td>
	            							<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=r.getRArea() %></span></div></td>
	            							<td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=r.getRzip() %></span></div></td>
	          							</tr>
							            <%
							            }
							            %>
									</table>
									<br>
								</div>
							</form>
							<form name="setuplunchForm" id="setuplunchForm" method="post" action="Request">
								<div>
									<input type="hidden" name="reqEmail" id="reqEmail" value=<%= logined?(String)LoginedEmail:""%>/>
									<p class="name">Please select the date:</p>
									<input type="text" name="date" id="date" class="tcal" value="" />&nbsp;&nbsp;&nbsp;&nbsp;
									<select id="time" name="time">
										<option value="" selected="selected"></option>
										<option value="10:00 am">10:00 am</option>
										<option value="10:30 am">10:30 am</option>
										<option value="11:00 am">11:00 am</option>
										<option value="11:30 am">11:30 am</option>
										<option value="12:00 pm">12:00 pm</option>
										<option value="12:30 pm">12:30 pm</option>
										<option value="01:00 pm">01:00 pm</option>
										<option value="05:00 pm">05:00 pm</option>
										<option value="05:30 pm">05:30 pm</option>
										<option value="06:00 pm">06:00 pm</option>
										<option value="06:30 pm">06:30 pm</option>
										<option value="07:00 pm">07:00 pm</option>
										<option value="07:30 pm">07:30 pm</option>
										<option value="08:00 pm">08:00 pm</option> 
									</select>
								</div><br/>
								<input type="hidden" id="resArea" name="resarea" value="<%=area %>">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="general_button" value="Join us for lunch!"><br><br>
							</form>
						</section>
                        <div class="clearboth"></div>
                   
                    <div class="clearboth"></div>
                    
                </div>
                <div>
                	
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