package com.SitWith.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SitWith.Restaurant.Restaurant;

public class RestaurantServlet {
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
		
		String area = request.getParameter("restaurantSelect");
		ArrayList<Restaurant> res = Restaurant.getAreaRestaurant(area);
		
		request.setAttribute("res", res);  
        request.getRequestDispatcher("Set_up_a_Lunch.jsp").forward(request, response);
		
		
	}
}
