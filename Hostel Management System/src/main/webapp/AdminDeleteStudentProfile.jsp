<%@page import="java.sql.ResultSet"%>
<%@page import="com.hostel.admin.AdminprofileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button class="logout" onclick="window.location.href='AdminLogoutPage.jsp'">Logout</button>

<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("username")==null){
	   response.sendRedirect("AdminLoginPage.jsp");
}
%>
<form  method="post">

<label>Register Number : </label> 
<%
AdminprofileDAO returnreg=new AdminprofileDAO();
ResultSet resultSet=returnreg.retregnumto_dlt();
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


<input type="submit" value="Submit">

</form>
<%
String regno=request.getParameter("registernumber");
AdminprofileDAO deleteprofile=new AdminprofileDAO();
if(deleteprofile.deleteprofile(regno)){
	%>
	<script type="text/javascript">
	alert("Deletion Successfull!");
	</script>
<%
}
%>
</body>
</html>