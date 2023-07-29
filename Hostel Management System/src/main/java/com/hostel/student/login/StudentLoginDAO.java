package com.hostel.student.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentLoginDAO {
	public Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/hostel";
		String username = "root";
		String password = "i5rtx3050";
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;

	}

	public Boolean check(String reg_no, String psw) {

		try {
			String sql = "select * from studentregister where registernumber =? and password=?";

			Connection con = getConnection();
			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, reg_no);
			st.setString(2, psw);
			ResultSet rs = st.executeQuery();
			if (rs.next())
				return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
}
