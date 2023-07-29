package com.hostel.student.complaint;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentComplaintDTO {
	public int insert(String regno,String area_of_complaint,String complaint ) {
		String insert = "insert into studentcomplaints(registernumber,areaofcomplaint,complaint) values(?,?,?)";
        String url = "jdbc:mysql://localhost:3306/hostel";
        String username = "root";
        String password = "i5rtx3050";
        int i=0;
        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
      PreparedStatement st=con.prepareStatement(insert);
      st.setString(1, regno);
      st.setString(2, area_of_complaint);
      st.setString(3, complaint);
      
     
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
