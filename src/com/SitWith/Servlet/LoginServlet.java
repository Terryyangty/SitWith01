package com.SitWith.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SitWith.User.User;


public class LoginServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			   throws ServletException, IOException {
			  doPost(request, response);

	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			   throws ServletException, IOException {
			  response.setCharacterEncoding("gb2312");
			  response.setContentType("text/html");
			  request.setCharacterEncoding("gb2312");
			  
			  PrintWriter out = response.getWriter();
			  
			  HttpSession session = request.getSession();
			  
			  String email = request.getParameter("Login_Email");
			  String password = request.getParameter("Login_Password");
			  User u = new User();
			  if(email==null||email==""){
			  		out.println("<script language=javascript>alert('Username must not be null, please input again');</script>");
			  		out.println("<script language=javascript>window.location.href='index.jsp'</script>");
			  } else if(password==null||password==""){
			  		out.println("<script language=javascript>alert('Password must not be null, please input again');</script>");
			  		out.println("<script language=javascript>window.location.href='index.jsp'</script>");
			  } else if(u.logincheck(email, password)==""){
				  	out.println("<script language=javascript>alert('Email or password not right, please input again');</script>");
				  	out.println("<script language=javascript>window.location.href='index.jsp'</script>");
			  }else{	
				  	session.setAttribute("LoginedEmail",email);
				  	out.println("<script language=javascript>window.location.href='index.jsp'</script>");
			  }
		}
	
}
