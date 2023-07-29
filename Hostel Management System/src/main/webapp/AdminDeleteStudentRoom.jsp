<%@page import="com.hostel.admin.room.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Student from Room</title>

<link rel="stylesheet"  type="text/css" href="style/leavestyle.css">
</head>
<body >
<button class="logout" onclick="window.location.href='AdminLogoutPage.jsp'">Logout</button>

<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("username")==null){
	   response.sendRedirect("AdminLoginPage.jsp");
}
%>
<div class="container">
<form action="" method="post">
<br><br>
<h3>Remove Student From Hostel !</h3>
<br>
<div class="input-box">
<label for="regno">Register Number :</label>
<input type="text" name="regno" required="required" id="regno" >
</div>
<br><br><input type="submit" value="Delete">
</form>
<%
String registernumber=request.getParameter("regno");
AdminDAO delete=new AdminDAO();
if(delete.deleteroom(registernumber)>0&& delete.deleteStatus(registernumber)>0){
	%>
	<h1>Success!</h1>
	<br><br><a href='AdminStudentData.jsp'>Redirect to Student Details Page</a>
	<% 
}


%>
</div>

</body>
</html>