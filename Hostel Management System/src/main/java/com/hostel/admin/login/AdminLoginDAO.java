package com.hostel.admin.login;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminLoginDAO {

	public Boolean check(String uname, String psw) {
		String sql = "select * from adminlogin where username =? and password=?";
        String url = "jdbc:mysql://localhost:3306/hostel";
        String username = "root";
        String password = "i5rtx3050";
        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
      PreparedStatement st=con.prepareStatement(sql);
      st.setString(1, uname);
      st.setString(2, psw);
      ResultSet rs =st.executeQuery();
      if(rs.next())
			   return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
        return false;
	}
}
