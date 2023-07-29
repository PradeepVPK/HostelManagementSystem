<%@page import="java.sql.ResultSet"%>
<%@page import="com.hostel.admin.room.AdminDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student Room Details</title>

<link rel="stylesheet"  type="text/css" href="style/leavestyle.css">
</head>
<body>
<button class="logout" onclick="window.location.href='AdminLogoutPage.jsp'">Logout</button>

<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("username")==null){
	   response.sendRedirect("AdminLoginPage.jsp");
}
%>
<div class="container">
<form  method="post">
<label>Register Number :</label>
<%
AdminDAO ret=new AdminDAO();
ResultSet resultSet=ret.reteditregnum();
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
 <input type="submit" value="Edit Details">
</form>
<br><br>


<form action="EditServlet" method="post">

<%
String regno=request.getParameter("registernumber");
session.setAttribute("regno", regno);

if(regno!=null){
	out.println("<label>Register Number : </label>"+regno);
	
	ResultSet resSet=ret.retroomnum(regno);
	 String currGroup = "";
	 out.println("<br><br><label>Room Number: </label>");
     out.println("<select name='roomnumber' >");
     out.println("<option label='select'></option>");
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
<label>Fees Paid :</label>
<input type="number" id="feespaid" name="feespaid" required="required" min="0" max="5000" >
<br><br>



<input type="submit" value="Book Room">
</div>

<%}%>
</form>


</body>
</html>