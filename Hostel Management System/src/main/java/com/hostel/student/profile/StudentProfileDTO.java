package com.hostel.student.profile;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentProfileDTO {

	public int insert(String regno,String fullname,String fathername ,String mothername, String parentmob, String dob,String gender,String degree,String bloodgroup,String housenum,String areaname,String pincode,String state,String district) {
		String insert = "insert into studentprofile(registernumber,fullname,fathername,mothername,parentmobilenumber,dob,gender,degree,bloodgroup,housenumber,areaname,pincode,state,district) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        String url = "jdbc:mysql://localhost:3306/hostel";
        String username = "root";
        String password = "i5rtx3050";
        int i=0;
        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
      PreparedStatement st=con.prepareStatement(insert);
      st.setString(1,regno );
      st.setString(2, fullname);
      st.setString(3, fathername);
      st.setString(4, mothername);
      st.setString(5, parentmob);
      st.setString(6, dob);
      st.setString(7, gender);
      st.setString(8, degree);
      st.setString(9, bloodgroup);
      st.setString(10, housenum);
      st.setString(11, areaname);
      st.setString(12, pincode);
      st.setString(13, state);
      st.setString(14, district);
      
     
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
