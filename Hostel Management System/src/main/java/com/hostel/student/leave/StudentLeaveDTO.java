package com.hostel.student.leave;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentLeaveDTO {
	public int insert(String regno,String reason,String from_date,String to_date, int no_of_leavedays ) {
		String insert = "insert into studentleave(registernumber,reason,from_date,to_date,no_of_leavedays) values(?,?,?,?,?)";
        String url = "jdbc:mysql://localhost:3306/hostel";
        String username = "root";
        String password = "i5rtx3050";
        int i=0;
        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
      PreparedStatement st=con.prepareStatement(insert);
      st.setString(1, regno);
      st.setString(2, reason);
      st.setString(3, from_date);  
      st.setString(4, to_date);
      st.setInt(5, no_of_leavedays);
      
     
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
