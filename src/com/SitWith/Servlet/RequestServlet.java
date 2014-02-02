package com.SitWith.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SitWith.Request.Request;

public class RequestServlet extends HttpServlet{
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
		
		String email = request.getParameter("reqEmail");
		String area = request.getParameter("resarea");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		
		out.println("alert('Please first sign in or sign up');");
		
		if(email == ""||email.equals("")||email==null||email == "/"||email.equals("/")){
			out.println("<script language=javascript>alert('Please first sign in or sign up');</script>");
			out.println("<script language=javascript>window.location.href='Set_up_a_Lunch.jsp'</script>");
		}else if(area == ""||area.equals("")||area==null){
			out.println("<script language=javascript>alert('Please choose the area');</script>");
			out.println("<script language=javascript>window.location.href='Set_up_a_Lunch.jsp'</script>");
		}else if(date == ""||date.equals("")||date==null){
			out.println("<script language=javascript>alert('Please choose the date');</script>");
			out.println("<script language=javascript>window.location.href='Set_up_a_Lunch.jsp'</script>");
		}else if(time == ""||time.equals("")||time==null){
			out.println("<script language=javascript>alert('Please choose the time');</script>");
			out.println("<script language=javascript>window.location.href='Set_up_a_Lunch.jsp'</script>");
		}else{
		
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy hh:mm a");
			String requestEmail = email.substring(0, email.length()-1);
			Date dd;
			try {
				dd = sdf.parse(date + " "+ time);
				java.sql.Timestamp sqlDate=new java.sql.Timestamp(dd.getTime());
				System.out.println(sqlDate);
				Request r = new Request();
				r.setReqArea(area);
				r.setReqEmail(requestEmail);
				r.setReqTime(sqlDate);
				r.save();
				out.println("<script language=javascript>alert('You have successfully made a request!');</script>");
				out.println("<script language=javascript>window.location.href='Set_up_a_Lunch.jsp'</script>");
			} catch (ParseException e) {
				e.printStackTrace();
			}
		
		}
		
		
	}
}
