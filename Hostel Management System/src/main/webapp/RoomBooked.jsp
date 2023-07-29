<%@page import="com.hostel.student.room.StudentGenderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room Booked</title>
</head>
<body bgcolor="orange">
<%   Connection connection = null;
PreparedStatement statement = null;
ResultSet resultSet = null;
String roomnumber=request.getParameter("roomnumber");
String regno=(String)session.getAttribute("reg_no");

try {
	   String url = "jdbc:mysql://localhost:3306/hostel";
    String username = "root";
    String password = "i5rtx3050";
    
  String sql="UPDATE studentroom SET  regnum5 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NOT NULL AND regnum3 IS NOT NULL AND regnum4 IS NOT NULL AND regnum4 IS NULL THEN ? ELSE regnum4 END, regnum4 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NOT NULL AND regnum3 IS NOT NULL AND regnum4 IS NULL THEN ? ELSE regnum4 END,  regnum3 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NOT NULL AND regnum3 IS NULL THEN ? ELSE regnum3 END, regnum2 = CASE WHEN regnum1 IS NOT NULL AND regnum2 IS NULL THEN ? ELSE regnum2 END, regnum1 = CASE WHEN regnum1 IS NULL THEN ? ELSE regnum1 END, seatavailable = CASE WHEN seatavailable!= 0 THEN seatavailable-1 ELSE seatavailable END WHERE (regnum1 IS NULL OR regnum2 IS NULL OR  regnum3 IS NULL OR  regnum4 IS NULL OR regnum5 IS NULL)  and ( roomnumber=?)";
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);
			   statement=connection.prepareStatement(sql);
			   statement.setString(1, regno);
			   statement.setString(2, regno);
			   statement.setString(3, regno);
			   statement.setString(4, regno);
			   statement.setString(5, regno);
			   statement.setString(6, roomnumber);
			   
			   int i=statement.executeUpdate();
			   if(i>0){
				   out.println("<h5>Room Booked Successfully</h5>");
				   out.println("<h5>Room Number : "+roomnumber+ "</h5>");
				   out.println("<h5>Monthly Fees : ₹5000</h5>");
				   String join_date= (String)session.getAttribute("joindate");
				   StudentGenderDao insertroomnum=new StudentGenderDao();
				   insertroomnum.insertroomnumber(regno, roomnumber,join_date);
				   insertroomnum.updateroomnumber(regno, roomnumber);
			   }
			   else{
				   out.println("Sorry! Room Booking failed.");
			   }
			   
} catch (SQLException e) {
   e.printStackTrace();
} catch (ClassNotFoundException e) {
   e.printStackTrace();
} finally {
   try {
      if (resultSet != null) {
         resultSet.close();
      }
      if (statement != null) {
         statement.close();
      }
      if (connection != null) {
         connection.close();
      }
   } catch (SQLException e) {
      e.printStackTrace();
   }

}

%> 
</body>
</html>