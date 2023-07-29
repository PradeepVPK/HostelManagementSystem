package com.hostel.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminprofileDAO {



	
	   
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
	

	public int updatestudentprofile(String regno,String fullname,String fathername ,String mothername, String parentmob, String dob,String gender,String degree,String bloodgroup,String housenum,String areaname,String pincode,String state,String district) {
		
        int i=0;
        try {
  		  
    	    
 	       String sql = "UPDATE studentprofile"
 	       		+ "SET\r\n"
 	       		+ "`registernumber` = ?,\r\n"
 	       		+ "`fullname` = ?,\r\n"
 	       		+ "`fathername` = ?,\r\n"
 	       		+ "`mothername` = ?,\r\n"
 	       		+ "`parentmobilenumber` = ?,\r\n"
 	       		+ "`dob` = ?,\r\n"
 	       		+ "`gender` = ?,\r\n"
 	       		+ "`degree` = ?,\r\n"
 	       		+ "`bloodgroup` = ?,\r\n"
 	       		+ "`housenumber` = ?,\r\n"
 	       		+ "`areaname` = ?,\r\n"
 	       		+ "`pincode` = ?,\r\n"
 	       		+ "`state` = ?,\r\n"
 	       		+ "`district` = ?,\r\n"
 	       	
 	       		+ "WHERE `registernumber` = ?;\r\n"
 	       		+ "";
 				Connection con = getConnection();
 			     PreparedStatement st=con.prepareStatement(sql);
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
 			     st.setString(15,regno );
 			     i =st.executeUpdate();
 	 
 		      } catch (SQLException e) {
 		         e.printStackTrace();
 		      }
		return i;
    
        }
public ResultSet retregnumto_add() {
     ResultSet rs=null;
	try {
		  
	    
	       String sql = "select registernumber from studentregister where registernumber not in (select registernumber from studentprofile) ";
	       		
				Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			 
			     rs =st.executeQuery();
	 
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   
	return rs;

}	
public ResultSet retregnumto_dlt() {
    ResultSet rs=null;
	try {
		  
	    
	       String sql = "select registernumber from studentregister where registernumber  in (select registernumber from studentprofile) ";
	       		
				Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			 
			     rs =st.executeQuery();
	 
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   
	return rs;

}

public boolean deleteprofile(String registernumber) throws ClassNotFoundException {
	
try {
	  
    
       String sql = "delete from studentprofile where registernumber=?";
			Connection con = getConnection();
		     PreparedStatement st=con.prepareStatement(sql);
		     st.setString(1, registernumber);
	        if( st.executeUpdate()>0) {
	        	return true;
	        }
		 
		   
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
return  false;
} 


public ResultSet retleavestatus(String regno) {
    ResultSet rs=null;
	try {
		  
	    
	       String sql = "select* from studentleave where registernumber =? ";
	       		
				Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			     st.setString(1, regno);
			     rs =st.executeQuery();
	 
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   
	return rs;

}

}
