package com.SitWith.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.SitWith.Util.DataBase;


public class User {
	
	private String fName;

	private String lName;
	
	private String Email;
	
	private String password;

	private String usertype;
		
	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsertype(){
		return usertype;
	}
	
	public void setUsertype(String usertype){
		this.usertype = usertype;
	}

	public void save() {
		Connection conn = DataBase.getConn();
		String sql = "insert into ruser values (?, ?, ?, ?, ?);";
		PreparedStatement pstmt = DataBase.prepare(conn, sql);
		try {
			//System.out.println("save()!");
			pstmt.setString(1, fName);
			pstmt.setString(2, lName);
			pstmt.setString(3, Email);
			pstmt.setString(4, password);
			pstmt.setString(5, usertype);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(pstmt);
			DataBase.close(conn);
		}

	}

	public static List<User> getUsers() {
		List<User> users = new ArrayList<User>();
		Connection conn = DataBase.getConn();
		String sql = "select * from user";
		Statement stmt = DataBase.getStatement(conn);
		ResultSet rs = DataBase.getResultSet(stmt, sql);
		try {
			while (rs.next()) {
				User u = new User();
				u.setfName(rs.getString("FName"));
				u.setlName(rs.getString("LName"));
				u.setEmail(rs.getString(rs.getString("Email")));
				u.setPassword(rs.getString("password"));
				users.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(rs);
			DataBase.close(stmt);
			DataBase.close(conn);
		}
		return users;
	}

	/**
	 * 
	 * @param users
	 * @param pageNo
	 * @param pageSize
	 * @return 
	 */
	public static int getUsers(List<User> users, int pageNo, int pageSize) {

		int totalRecords = -1;

		Connection conn = DataBase.getConn();
		String sql = "select * from user limit " + (pageNo - 1) * pageSize
				+ "," + pageSize;
		Statement stmt = DataBase.getStatement(conn);
		ResultSet rs = DataBase.getResultSet(stmt, sql);

		Statement stmtCount = DataBase.getStatement(conn);
		ResultSet rsCount = DataBase.getResultSet(stmtCount,
				"select count(*) from user");

		try {
			rsCount.next();
			totalRecords = rsCount.getInt(1);

			while (rs.next()) {
				User u = new User();
				u.setfName(rs.getString("FName"));
				u.setlName(rs.getString("LName"));
				u.setEmail(rs.getString(rs.getString("Email")));
				u.setPassword(rs.getString("password"));
				users.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(rsCount);
			DataBase.close(stmtCount);
			DataBase.close(rs);
			DataBase.close(stmt);
			DataBase.close(conn);
		}

		return totalRecords;
	}
	
	public static List<User> getPageData(int pageNo, int pageSize){
		
		List<User> pageData = new ArrayList<User>();
		Connection conn = DataBase.getConn();
		String sql = "select * from ruser limit " + (pageNo-1)*pageSize+ "," + pageSize;
		Statement stmt = DataBase.getStatement(conn);
		ResultSet rs = DataBase.getResultSet(stmt, sql);

		try {
			while (rs.next()) {
				User u = new User();
				u.setfName(rs.getString("FName"));
				u.setlName(rs.getString("LName"));
				u.setEmail(rs.getString(rs.getString("Email")));
				u.setPassword(rs.getString("password"));
				pageData.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(rs);
			DataBase.close(stmt);
			DataBase.close(conn);
		}
		return pageData;
	}

	public static boolean delete(int id) {
		boolean b = false;
		Connection conn = DataBase.getConn();
		String sql = "delete from user where id = " + id;
		Statement stmt = DataBase.getStatement(conn);

		try {
			DataBase.executeUpdate(stmt, sql);
			b = true;
		} finally {
			DataBase.close(stmt);
			DataBase.close(conn);
		}
		return b;
	}

	public static boolean RegistercheckExist(String Email)
			throws UserEmailDuplicateException {
		boolean Exist = false;
		User u = null;
		Connection conn = DataBase.getConn();
		String sql = "select * from ruser where Email = '" + Email + "'";
		Statement stmt = DataBase.getStatement(conn);
		ResultSet rs = DataBase.getResultSet(stmt, sql);
		try {
			if(rs.next()) {
				Exist = true;
			} else {
				Exist = false;
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(rs);
			DataBase.close(stmt);
			DataBase.close(conn);
		}
		return Exist;
	}
	
	/*public static void update(User u) {
		u.update();
	}*/
	
	public void updatePassword() {
		
	}
	
	public static void updatePassword(User u) {
		u.updatePassword();
	}
	
	public static void updatePassword(int userId, String newPassword) {
		
	}
	
	/*public void update() {
		Connection conn = DataBase.getConn();
		String sql = "update user set position = ? where id = ?";
		PreparedStatement pstmt = DataBase.prepare(conn, sql);
		try {
			pstmt.setString(1, position);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(pstmt);
			DataBase.close(conn);
		}
	}*/
	
	public static String logincheck(String email, String password){
		String type = "";
		Connection conn = DataBase.getConn();
		String sql = "select * from ruser where Email = '"+email+"' and Password = '" + password + "'";
		Statement stmt = DataBase.getStatement(conn);
		ResultSet rs = DataBase.getResultSet(stmt, sql);
		try {
			if(!rs.next()) {
				type = "";
			}else type = "user";
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(rs);
			DataBase.close(stmt);
			DataBase.close(conn);
		}
		return type;
	}
	
	
	public static int getTotalRecord(){
		int totalRecords = -1;

		Connection conn = DataBase.getConn();
		Statement stmtCount = DataBase.getStatement(conn);
		ResultSet rsCount = DataBase.getResultSet(stmtCount,
				"select count(*) from ruser");
		
		try {
			rsCount.next();
			totalRecords = rsCount.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBase.close(rsCount);
			DataBase.close(stmtCount);
			DataBase.close(conn);
		}
		return totalRecords;
	}

	public static void main(String[] args) {
		//List<User> users = new ArrayList<User>();
		//int totalRecords = User.getUsers(users, 1, 10);
		/*for (int i = 0; i < users.size(); i++) {

		}*/
	}
	
}
