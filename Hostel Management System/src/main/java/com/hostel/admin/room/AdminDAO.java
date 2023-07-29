package com.hostel.admin.room;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.plaf.synth.Region;

import org.apache.tomcat.jni.Global;

public class AdminDAO {
	int profilestatus=0;
	 int roomstatus=0;
	   int feesstatus=0;
	   
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
	
	  public boolean editfees( String registernumber, int feespaid) throws ClassNotFoundException {
		   
	   try {
		  
	       
	          String sql = "update studentfees set feespaid=feespaid+? ,feesbalance=totalfees-feespaid where registernumber=?";
				Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			     st.setInt(1, feespaid);
			     st.setString(2, registernumber);
			    if(st.executeUpdate()>0) {
			    	return true;
			    }
	    
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   
	return false;
} 

	  public boolean editfeeswithroomnum( String roomnumber,String registernumber, int feespaid) throws ClassNotFoundException {
		   
	   try {
		  
	       
	          String sql = "update studentfees set roomnumber=?,feespaid=feespaid+? ,feesbalance=totalfees-feespaid where registernumber=?";
				Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			     st.setString(1, roomnumber);
			     st.setInt(2, feespaid);
			     st.setString(3, registernumber);
			    if(st.executeUpdate()>0) {
			    	return true;
			    }
	    
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   
	return false;
} 
	  public boolean editroomsetnull(String registernumber) throws ClassNotFoundException {
		  
			try {
				  
			    

			     String sql = "update studentroom set regnum1=case when (regnum1=?) then (regnum1=null) else regnum1 end,regnum2=case when (regnum2=?) then (regnum2=null) else regnum2 end,regnum3=case when (regnum3=?) then (regnum3=null) else regnum3 end,regnum4=case when (regnum4=?) then (regnum4=null) else regnum4 end,regnum5=case when (regnum5=?) then (regnum5=null) else regnum5 end, seatavailable= seatavailable+1 where roomnumber=(select roomnumber from studentprofile where registernumber=?)";
						Connection con = getConnection();
					     PreparedStatement st=con.prepareStatement(sql);
					     st.setString(1, registernumber);
					     st.setString(2, registernumber);
					     st.setString(3, registernumber);
					     st.setString(4, registernumber);
					     st.setString(5, registernumber);
					     st.setString(6, registernumber);
					     if(st.executeUpdate()>0) {
					    	 return true;
					     }
			 
				      } catch (SQLException e) {
				         e.printStackTrace();
				      }
				   
			return false;
			}
	  public boolean editroominstroomnum(String registernumber, String roomnumber) throws ClassNotFoundException {
				  
				try {
					  
				    



					 String sql = "UPDATE studentroom SET  regnum5 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NOT NULL AND regnum3 IS NOT NULL AND regnum4 IS NOT NULL AND regnum4 IS NULL THEN ? ELSE regnum4 END, regnum4 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NOT NULL AND regnum3 IS NOT NULL AND regnum4 IS NULL THEN ? ELSE regnum4 END,  regnum3 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NOT NULL AND regnum3 IS NULL THEN ? ELSE regnum3 END, regnum2 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NULL THEN ? ELSE regnum2 END, regnum1 = CASE WHEN regnum1 IS NULL THEN ? ELSE regnum1 END, seatavailable = CASE WHEN seatavailable!= 0 THEN seatavailable-1 ELSE seatavailable END WHERE (regnum1 IS NULL OR regnum2 IS NULL OR  regnum3 IS NULL OR  regnum4 IS NULL OR regnum5 IS NULL)  and ( roomnumber=?)";
							Connection con = getConnection();
						     PreparedStatement st=con.prepareStatement(sql);
						     st.setString(1, registernumber);
						     st.setString(2, registernumber);
						     st.setString(3, registernumber);
						     st.setString(4, registernumber);
						     st.setString(5, registernumber);
						     st.setString(6, roomnumber);
						   if(st.executeUpdate()>0) {
							   return true;
						   }
					      } catch (SQLException e) {
					         e.printStackTrace();
					      }
					   
				return false;
				}
 public boolean editprofile( String roomnumber, String registernumber) throws ClassNotFoundException {

try {
	  
    
       String sql = "update studentprofile set roomnumber= ? where registernumber=?";
			Connection con = getConnection();
		     PreparedStatement st=con.prepareStatement(sql);
		     st.setString(1, roomnumber);
		     st.setString(2, registernumber);
		    if(st.executeUpdate()>0) {
		    	return true;
		    }
 
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   
return false;
}
 
 
 public void deletefees(String registernumber) throws ClassNotFoundException {
	
 try {
	  
     
        String sql = "delete from studentfees where registernumber=?";
			Connection con = getConnection();
		     PreparedStatement st=con.prepareStatement(sql);
		     st.setString(1, registernumber);
		   feesstatus=  st.executeUpdate();
		 
		   
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }

 } 
 
public int deleteroom(String registernumber) throws ClassNotFoundException {
	
try {
	  
  
     String sql = "update studentroom set regnum1=case when (regnum1=?) then (regnum1=null) else regnum1 end,regnum2=case when (regnum2=?) then (regnum2=null) else regnum2 end,regnum3=case when (regnum3=?) then (regnum3=null) else regnum3 end,regnum4=case when (regnum4=?) then (regnum4=null) else regnum4 end,regnum5=case when (regnum5=?) then (regnum5=null) else regnum5 end, seatavailable= seatavailable+1 where roomnumber=(select roomnumber from studentprofile where registernumber=?)";
			Connection con = getConnection();
		     PreparedStatement st=con.prepareStatement(sql);
		     st.setString(1, registernumber);
		     st.setString(2, registernumber);
		     st.setString(3, registernumber);
		     st.setString(4, registernumber);
		     st.setString(5, registernumber);
		     st.setString(6, registernumber);
		     
		     roomstatus= st.executeUpdate();

	      } catch (SQLException e) {
	         e.printStackTrace();
	 }
return roomstatus;
}
public void deleteprofile(String registernumber) throws ClassNotFoundException {

try {


 String sql = "update studentprofile set roomnumber= null where registernumber=?";
		Connection con = getConnection();
	     PreparedStatement st=con.prepareStatement(sql);
	     st.setString(1, registernumber);
	     profilestatus=st.executeUpdate();

    } catch (SQLException e) {
       e.printStackTrace();
    }

}

public int deleteStatus(String regno) throws ClassNotFoundException {
	
	deletefees(regno);
	deleteprofile(regno);
	
	
	if(profilestatus>0 && feesstatus>0) {
		return 1;
	}
return 0;	
}

public ResultSet retregnum() {
     ResultSet rs=null;
	try {
		  
	    
	       String sql = "select registernumber from studentprofile where roomnumber is "
	       		+ ""
	       		+ ""
	       		+ "null";
				Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			 
			     rs =st.executeQuery();
	 
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   
	return rs;
}


public ResultSet reteditregnum() {
     ResultSet rs=null;
	try {
		  
	    
	       String sql = "select registernumber from studentprofile where roomnumber is not null ";
	       		
				Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			 
			     rs =st.executeQuery();
	 
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   
	return rs;
}

public ResultSet retroomnum(String regno) {
     ResultSet rs=null;
	try {
		String sql = "select roomnumber from studentroom where gender=(select gender from studentprofile where registernumber=?) and seatavailable>0";
				 Connection con = getConnection();
			     PreparedStatement st=con.prepareStatement(sql);
			     st.setString(1,regno );
			     rs =st.executeQuery();
	 
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		  
	return rs;
}



public boolean insertfees(String regnum,String roomnum,String join_date,int feespaid) {
	  
	
		try {
			String sql = "insert into studentfees values(?,?,?,?,?,?)";
					 Connection con = getConnection();
				     PreparedStatement st=con.prepareStatement(sql);
				     st.setString(1,regnum );
				     st.setString(2,roomnum);
				     st.setInt(3,5000 );
				     st.setInt(4,feespaid );
				     st.setInt(5,5000-feespaid);
				     st.setString(6,join_date );
				     if(st.executeUpdate()>0) {
				    	 return true;
				     }
				  
		 
			      } catch (SQLException e) {
			         e.printStackTrace();
			      }
	
	return false;
}
public boolean insertprofile(String roomnumber,String registernumber) throws ClassNotFoundException {

try {


 String sql = "update studentprofile set roomnumber= ? where registernumber=?";
		Connection con = getConnection();
	     PreparedStatement st=con.prepareStatement(sql);
	     st.setString(1, roomnumber);
	     st.setString(2, registernumber);
	   if(st.executeUpdate()>0) {
		   return true;
	   }

    } catch (SQLException e) {
       e.printStackTrace();
    }
return false;
}

public boolean insertroom(String roomnumber,String registernumber) throws ClassNotFoundException {

try {


 String sql = "UPDATE studentroom SET  regnum5 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NOT NULL AND regnum3 IS NOT NULL AND regnum4 IS NOT NULL AND regnum4 IS NULL THEN ? ELSE regnum4 END, regnum4 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NOT NULL AND regnum3 IS NOT NULL AND regnum4 IS NULL THEN ? ELSE regnum4 END,  regnum3 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NOT NULL AND regnum3 IS NULL THEN ? ELSE regnum3 END, regnum2 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NULL THEN ? ELSE regnum2 END, regnum1 = CASE WHEN regnum1 IS NULL THEN ? ELSE regnum1 END, seatavailable = CASE WHEN seatavailable!= 0 THEN seatavailable-1 ELSE seatavailable END WHERE (regnum1 IS NULL OR regnum2 IS NULL OR  regnum3 IS NULL OR  regnum4 IS NULL OR regnum5 IS NULL)  and ( roomnumber=?)";
		Connection con = getConnection();
	     PreparedStatement st=con.prepareStatement(sql);
	     st.setString(1, registernumber);
	     st.setString(2, registernumber);
	     st.setString(3, registernumber);
	     st.setString(4, registernumber);
	     st.setString(5, registernumber);
	     st.setString(6, roomnumber);
	   if(st.executeUpdate()>0) {
		   return true;
	   }

    } catch (SQLException e) {
       e.printStackTrace();
    }
return false;
}


}
