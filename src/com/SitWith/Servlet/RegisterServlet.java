package com.SitWith.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SitWith.User.User;

public class RegisterServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			   throws ServletException, IOException {
			  doPost(request, response);

	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			   throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("gbk");
		request.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();  
		HttpSession session = request.getSession();
		
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String Email = request.getParameter("Email");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String usertype = "ruser";
		User u = new User();
		boolean ok=true;
		
		if(fName==null||fName.equals("")||fName==""){
			out.println("<script language=javascript>alert('Please type in your First Name');</script>");
	  		out.println("<script language=javascript>window.location.href='Register.jsp'</script>");
	  		ok = false;
		}
		if(lName==null||lName.equals("")||lName==""){
			out.println("<script language=javascript>alert('Please type in your Last Name');</script>");
	  		out.println("<script language=javascript>window.location.href='Register.jsp'</script>");
	  		ok = false;
		}
		if(Email==null||Email.equals("")||Email==""){
			out.println("<script language=javascript>alert('Please type in your Email');</script>");
	  		out.println("<script language=javascript>window.location.href='Register.jsp'</script>");
	  		ok = false;
		}
		if(u.RegistercheckExist(Email)){
			out.println("<script language=javascript>alert('Email already exist');</script>");
	  		out.println("<script language=javascript>window.location.href='Register.jsp'</script>");
	  		ok = false;
		}
		if(password==null||password.equals("")||password==""){
			out.println("<script language=javascript>alert('Please type in your password!');</script>");
	  		out.println("<script language=javascript>window.location.href='Register.jsp'</script>");
	  		ok = false;
		}
		if(password2==null||password2.equals("")||password2==""){
			out.println("<script language=javascript>alert('Please type in your Confirmation password!');</script>");
	  		out.println("<script language=javascript>window.location.href='Register.jsp'</script>");
	  		ok = false;
		}
		if(!password.equals(password2)){
			out.println("<script language=javascript>alert('Password and Confirm password must match!');</script>");  
		    out.println("<script language=javascript>window.location.href='Register.jsp'</script>");
		    ok = false;
		}
		if(ok){
			System.out.println(ok);
			u.setfName(fName);
			u.setlName(lName);
			u.setEmail(Email);
			u.setPassword(password);
			u.setUsertype(usertype);
			u.save();
			out.println("<script language=javascript>alert('Success')</script>");  
		    out.println("<script language=javascript>window.location.href='index.jsp'</script>");
		}
	}
}
