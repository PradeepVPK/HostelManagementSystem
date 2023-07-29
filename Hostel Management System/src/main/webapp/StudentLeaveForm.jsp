<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Leave Form</title>
 <link rel="stylesheet"  href="style/leavestyle.css">
</head>
<body >
<button class="logout" onclick="window.location.href='AdminLogoutPage.jsp'">Logout</button>

<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("reg_no")==null){
	   response.sendRedirect("StudentLoginPage.jsp");
}
%>
<div class="container">
<form action="StudentLeaveServlet" method="post">
<br>
<div class="content">
<h1>LEAVE FORM</h1>
<div class="input-box">
<label >Reason :</label><br>
</div>
<textarea  name="reason" required="required" rows="5" cols="100"></textarea>

<br><br>
<div class="input-box">
<label >From Date :</label><br>
  <input type="date" name="frm_date" id="dateInput" required="required" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
<br><br>
</div>
<div class="input-box">
<label >To Date :</label><br>

<input type="date" name="to_date" id="date-Input" required="required" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
<br>

</div>
<input type="hidden" id="result" name="result" >

<script>
    var today = new Date();
    var maxDate = new Date();
    maxDate.setDate(today.getDate() + 10);
    document.getElementById("dateInput").max = maxDate.toISOString().substring(0,10);
    document.getElementById("date-Input").max = maxDate.toISOString().substring(0,10);
    function calculate() {
        var startDate = new Date(document.getElementById("dateInput").value);
        var endDate = new Date(document.getElementById("date-Input").value);
        var timeDiff = Math.abs(endDate.getTime() - startDate.getTime());
        var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24))+1; 
        document.getElementById("result").value =  diffDays;
    }
    document.getElementById("dateInput").addEventListener("change", calculate);
    document.getElementById("date-Input").addEventListener("change", calculate);
</script><br><br>
<div class="button-container">
<input type="submit" value="Submit">
</div>
</div>
</form>
</div>

</html>