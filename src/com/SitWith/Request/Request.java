package com.SitWith.Request;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import com.SitWith.Util.DataBase;

public class Request {
	
	private int reqId;

	private String reqEmail;
	
	private String reqArea;
	
	private Timestamp reqTime;

	public int getReqId() {
		return reqId;
	}

	public void setReqId(int reqId) {
		this.reqId = reqId;
	}

	public String getReqEmail() {
		return reqEmail;
	}

	public void setReqEmail(String reqEmail) {
		this.reqEmail = reqEmail;
	}

	public String getReqArea() {
		return reqArea;
	}

	public void setReqArea(String reqArea) {
		this.reqArea = reqArea;
	}

	public Date getReqTime() {
		return reqTime;
	}

	public void setReqTime(Timestamp reqTime) {
		this.reqTime = reqTime;
	}
	
	public static ArrayList<Request> getRequest() {
		ArrayList<Request> Requests = new ArrayList<Request>();
		Connection conn = DataBase.getConn();
		String sql = "select * from request";
		Statement stmt = DataBase.getStatement(conn);
		ResultSet rs = DataBase.getResultSet(stmt, sql);
		try {
			while (rs.next()) {
				Request rq = new Request();
				rq.setReqId(rs.getInt("ReqId"));
				rq.setReqEmail(rs.getString("ReqEmail"));
				rq.setReqTime(rs.getTimestamp("ReqTime"));
				rq.setReqArea(rs.getString("ReqArea"));
				Requests.add(rq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(rs);
			DataBase.close(stmt);
			DataBase.close(conn);
		}
		return Requests;
	}
	
	public static ArrayList<Request> getRequest(String email) {
		ArrayList<Request> Requests = new ArrayList<Request>();
		Connection conn = DataBase.getConn();
		String sql = "select * from request where ReqEmail like '"+email +"'";
		Statement stmt = DataBase.getStatement(conn);
		ResultSet rs = DataBase.getResultSet(stmt, sql);
		try {
			while (rs.next()) {
				Request rq = new Request();
				rq.setReqId(rs.getInt("ReqId"));
				rq.setReqEmail(rs.getString("ReqEmail"));
				rq.setReqTime(rs.getTimestamp("ReqTime"));
				rq.setReqArea(rs.getString("ReqArea"));
				Requests.add(rq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(rs);
			DataBase.close(stmt);
			DataBase.close(conn);
		}
		return Requests;
	}
	
	public void save() {
		Connection conn = DataBase.getConn();
		String sql = "insert into request values (null,?, ?, ?);";
		PreparedStatement pstmt = DataBase.prepare(conn, sql);
		try {
			pstmt.setString(1, reqEmail);
			pstmt.setString(2, reqArea);
			pstmt.setTimestamp(3, reqTime);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(pstmt);
			DataBase.close(conn);
		}

	}
	
	public static void main(String[] args){
		Request r = new Request();
		ArrayList<Request> req = r.getRequest();
		System.out.println(req);
		
	}
}
