package com.SitWith.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SitWith.User.User;

public class LogoutServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			   throws ServletException, IOException {
			  doPost(request, response);

	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			   throws ServletException, IOException {
			  response.setCharacterEncoding("gbk");
			  response.setContentType("text/html");
			  request.setCharacterEncoding("gbk");
			  
			  PrintWriter out = response.getWriter();
			  
			  HttpSession session = request.getSession();
			  
	
			  session.setAttribute("LoginedEmail","");
			  out.println("<script language=javascript>window.location.href='index.jsp'</script>");
		}
}
