package com.SitWith.Restaurant;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.SitWith.User.User;
import com.SitWith.Util.DataBase;

public class Restaurant {
	private String RName;
	
	private String RAdress;
	
	private String RStreet;
	
	private String RCity;
	
	private int Rzip;
	
	private String RArea;
	
	public String getRName() {
		return RName;
	}
	public void setRName(String rName) {
		RName = rName;
	}
	
	public String getRAdress() {
		return RAdress;
	}
	public void setRAdress(String rAdress) {
		RAdress = rAdress;
	}
	
	public String getRStreet() {
		return RStreet;
	}
	public void setRStreet(String rStreet) {
		RStreet = rStreet;
	}
	
	public String getRCity() {
		return RCity;
	}
	public void setRCity(String rCity) {
		RCity = rCity;
	}
	
	public int getRzip() {
		return Rzip;
	}
	public void setRzip(int rzip) {
		Rzip = rzip;
	}
	
	public String getRArea() {
		return RArea;
	}
	public void setRArea(String rArea) {
		RArea = rArea;
	}
	
	public static ArrayList<Restaurant> getRestaurant() {
		ArrayList<Restaurant> Restaurants = new ArrayList<Restaurant>();
		Connection conn = DataBase.getConn();
		String sql = "select * from restaurant";
		Statement stmt = DataBase.getStatement(conn);
		ResultSet rs = DataBase.getResultSet(stmt, sql);
		try {
			while (rs.next()) {
				Restaurant r = new Restaurant();
				r.setRName(rs.getString("RName"));
				r.setRAdress(rs.getString("RAdress"));
				r.setRStreet(rs.getString("RStreet"));
				r.setRCity(rs.getString("RCity"));
				r.setRzip(rs.getInt("Rzip"));
				r.setRArea(rs.getString("RArea"));
				Restaurants.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(rs);
			DataBase.close(stmt);
			DataBase.close(conn);
		}
		return Restaurants;
	}
	
	public static ArrayList<Restaurant> getAreaRestaurant(String area) {
		ArrayList<Restaurant> areaRestaurants = new ArrayList<Restaurant>();
		Connection conn = DataBase.getConn();
		String sql = "select * from restaurant where RArea = '"+area+"'";
		Statement stmt = DataBase.getStatement(conn);
		ResultSet rs = DataBase.getResultSet(stmt, sql);
		try {
			while (rs.next()) {
				Restaurant r = new Restaurant();
				r.setRName(rs.getString("RName"));
				r.setRAdress(rs.getString("RAddress"));
				r.setRStreet(rs.getString("RStreet"));
				r.setRCity(rs.getString("RCity"));
				r.setRzip(rs.getInt("Rzip"));
				r.setRArea(rs.getString("RArea"));
				areaRestaurants.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(rs);
			DataBase.close(stmt);
			DataBase.close(conn);
		}
		return areaRestaurants;
	}
	
}
