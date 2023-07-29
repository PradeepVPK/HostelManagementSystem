<%@page import="com.hostel.student.room.StudentGenderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Room Details</title>
<link rel="stylesheet"  href="style/style.css">

<style type="text/css">

.logout{
position: fixed;
right: 3%;
top:3%;
}</style>
</head>
<body >

 <button class="logout" onclick="window.location.href='StudentLogout.jsp'">Logout</button>
<div class="container">
<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("reg_no")==null){
	   response.sendRedirect("StudentLoginPage.jsp");
}
%>
<br>
<h2>Your Room Details !</h2>
<%

try {
	String registernumber=(String)session.getAttribute("reg_no");
    
    String sql = "select * from studentfees where registernumber=?";
    StudentGenderDao connect= new StudentGenderDao();
    Connection con=connect.getConnection();
	     PreparedStatement st=con.prepareStatement(sql);
	     st.setString(1, registernumber);
	  ResultSet   rs =st.executeQuery();
if(rs.next()) {
	%><br><br>
	<p>Register Number :<label><%=rs.getString(1) %></label><br><br>
	<p>Room Number :<label><%=rs.getString(2) %></label><br><br>
	<p>Total Fees :<label><%=rs.getInt(3) %></label><br><br>
	<p>Fees Paid :<label><%=rs.getInt(4) %></label><br><br>
	<p>Fees Balance :<label><%=rs.getInt(5) %></label><br><br>
	<p>Date Joined :<label><%=rs.getString(6) %></label><br><br>
<%	
	 
}

    } catch (SQLException e) {
       e.printStackTrace();
    }
 
%></div>
</body>
</html>