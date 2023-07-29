package com.hostel.student.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class StudentRegisterDAO {
	
	public int insert(String fname,String regno,String uname ,String psw, String email, String mobile_no) {
		String insert = "insert into studentregister(fullname,registernumber,username,password,email,mobilenumber) values(?,?,?,?,?,?)";
        String url = "jdbc:mysql://localhost:3306/hostel";
        String username = "root";
        String password = "i5rtx3050";
        int i=0;
        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
      PreparedStatement st=con.prepareStatement(insert);
      st.setString(1, fname);
      st.setString(2, regno);
      st.setString(3, uname);
      st.setString(4, psw);
      st.setString(5, email);
      st.setString(6, mobile_no);
     
      i=st.executeUpdate();
      st.close();
      con.close();
      
     
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
        return i;
	}


}
