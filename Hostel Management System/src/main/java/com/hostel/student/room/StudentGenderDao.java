
package com.hostel.student.room;
import java.sql.*;

public class StudentGenderDao {
	
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
	
	   public String Gender(String registernumber) throws ClassNotFoundException {
		   String gender = null;
	   try {
		  
	       
	          String sql = "select gender from studentprofile where registernumber=?";
				Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			     st.setString(1, registernumber);
			     ResultSet rs =st.executeQuery();
	      if(rs.next()) {
	    	  gender=rs.getString(1);
	      }
	   
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   
	return gender;
}
	   public String Roomnumber(String registernumber) throws ClassNotFoundException {
		   String roomnumber = null;
	   try {
		  
	       
	          String sql = "select roomnumber from studentprofile where registernumber=?";
				Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			     st.setString(1, registernumber);
			     ResultSet rs =st.executeQuery();
	      if(rs.next()) {
	    	  roomnumber=rs.getString(1);
	      }
	   
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   
	return roomnumber;
}
	   public String insertroomnumber(String registernumber,String roomnumber,String join_date) throws ClassNotFoundException {
	
	   try {
		  
	       
	          String sql = "insert into studentfees (registernumber,roomnumber,totalfees,feespaid,feesbalance,joindate) values(?,?,5000,0,5000,?)";
				Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			     st.setString(1, registernumber);
			     st.setString(2, roomnumber);
			     st.setString(3, join_date);
			   
			     st.executeUpdate();
	     
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
	   return registernumber;
	   }
	   

	   public String updateroomnumber(String registernumber,String roomnumber) throws ClassNotFoundException {
	
	   try {
		  
	       
	          String sql = "update studentprofile set roomnumber=? where registernumber=?";
				Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			    
			     st.setString(1, roomnumber);
			     st.setString(2, registernumber);
			     st.executeUpdate();
	     
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
	   return registernumber;
	   }
	  
}
