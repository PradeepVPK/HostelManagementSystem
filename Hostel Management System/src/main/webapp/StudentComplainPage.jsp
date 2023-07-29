<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Complaints</title>
<style type="text/css">

</style>

 <link rel="stylesheet"  href="style/chatgpt.css">
 <style type="text/css">
 .logout{
 position: fixed;
right:3%;
top:3%;
 }
 
 </style>
</head>
<body >
 <button class="logout" onclick="window.location.href='StudentLogout.jsp'">Logout</button>
<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("reg_no")==null){
	   response.sendRedirect("StudentLoginPage.jsp");
}
%>
<br>
<h2>Student Complaint and Feedbacks</h2>
<h4>You can give your feedbacks and also mention your needs in the Complain form given below.<br>We will try to resolve your problems as sson as possible.</h4>
<br>

<fieldset>
<legend>Student Complaint and Feedbacks Form :</legend>
<br>


<div>

<form action="StudentComplaintServlet" method="post">

<label>Area Of Complaint: </label> 
<select name="area_of_complaint" required="required">
<option value="Room" >Room</option>
<option value="Electricity">Electricity</option>
<option value="Water">Water</option>
<option value="Food">Food</option>
<option value="other">Other</option>
</select><br><br>

<label >Complaint :</label><br>
<textarea  name="complaint" required="required" rows="5" cols="100"></textarea>
<br><br>
<input type="submit" value="Submit">
</form>
</div>
</fieldset>

</body>
</html>