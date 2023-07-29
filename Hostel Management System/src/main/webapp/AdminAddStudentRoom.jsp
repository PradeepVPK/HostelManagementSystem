<%@page import="java.sql.ResultSet"%>
<%@page import="com.hostel.admin.room.AdminDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css" href="style/leavestyle.css">
</head>
<body>
<button class="logout" onclick="window.location.href='AdminLogoutPage.jsp'">Logout</button>

<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("username")==null){
	   response.sendRedirect("StudentLoginPage.jsp");
}
%>
<div class="container">
<br>
<h3>Add New Student </h3>
<br>

<form  method="post">
<div class="content">
<label>Register Number :</label>
<%
AdminDAO ret=new AdminDAO();
ResultSet resultSet=ret.retregnum();
String currentGroup = "";
out.println("<select name='registernumber' required >");
out.println("<option label='select'></option>");
while (resultSet.next()) {
   String group = "registernumber";
   String value = resultSet.getString("registernumber");
   String text = resultSet.getString("registernumber");
   if (!group.equals(currentGroup)) {
      if (!currentGroup.equals("")) {
         out.println("</optgroup>");
      }
      out.println("<optgroup >");
      currentGroup = group;
   }
   out.println("<option value='" + value + "'>" + text + "</option>");
}
if (!currentGroup.equals("")) {
   out.println("</optgroup>");
}
out.println("</select><br><br>");
%>

<div class="input-box">
<label>Joining Date :</label>
<input type="date" id="joindate" name="joindate" required="required"  min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>">
<br><br></div>
<script type="text/javascript">
    var today = new Date();
    var maxDate = new Date();
    maxDate.setDate(today.getDate() + 15);
    document.getElementById("joindate").max = maxDate.toISOString().substring(0,10);
</script>  
<div class="input-box">
  <input type="submit" value="Check Availability ">
  </div>
  </div>
</form>
<br><br>

<form action="AddServlet" method="post">
<div class="content">
<%
String regno=request.getParameter("registernumber");
String joindate=request.getParameter("joindate");
session.setAttribute("regno", regno);
session.setAttribute("joindate", joindate);

if(regno!=null){
	ResultSet resSet=ret.retroomnum(regno);
	 String currGroup = "";
	 out.println("<label>Room Number: </label>");
     out.println("<select name='roomnumber' required >");
     while (resSet.next()) {
        String group = "roomnumber";
        String value = resSet.getString("roomnumber");
        String text = resSet.getString("roomnumber");
        if (!group.equals(currGroup)) {
           if (!currGroup.equals("")) {
              out.println("</optgroup>");
           }
           out.println("<optgroup label='" + group + "'>");
           currGroup = group;
        }
        out.println("<option value='" + value + "'>" + text + "</option>");
     }
     if (!currGroup.equals("")) {
        out.println("</optgroup>");
     }
     out.println("</select><br><br>");
%>
<br>
<div class="input-box">
<label>Fees Paid :</label>
<input type="number" id="feespaid" name="feespaid" required="required" min="0" max="5000" >
<br><br>
</div>
<input type="submit" value="Book Room">
<%}%>
</div>
</form>
</div>


</body>
</html>