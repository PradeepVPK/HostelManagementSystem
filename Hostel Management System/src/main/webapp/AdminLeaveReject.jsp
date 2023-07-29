<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
 <% Class.forName("com.mysql.cj.jdbc.Driver"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leave Rejected</title>
</head>
<body>
<button class="logout" onclick="window.location.href='AdminLogoutPage.jsp'">Logout</button>

<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("username")==null){
	   response.sendRedirect("AdminLoginPage.jsp");
}
%>
<%
    
       int id=Integer.parseInt(request.getParameter("id"));
       String reject="REJECTED";
       String sql = "update studentleave set status=? where id=?;";
       String url = "jdbc:mysql://localhost:3306/hostel";
       String username = "root";
       String password = "i5rtx3050";
       
     
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
     PreparedStatement st=con.prepareStatement(sql);
     st.setString(1, reject);
     st.setInt(2,id);
     st.executeUpdate();
     response.sendRedirect("AdminLeavePage.jsp");
     %> 
</body>
</html>