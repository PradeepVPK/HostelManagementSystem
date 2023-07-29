<%@page import="java.sql.ResultSet"%>
<%@page import="com.hostel.admin.AdminprofileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Leave Status</title>

<link rel="stylesheet" type="text/css" href="style/table.css">

<style type="text/css">
.logout{
position: fixed;
right: 3%;
top:3%;
}
</style>
</head>
<body>
<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("reg_no")==null){
	   response.sendRedirect("StudentLoginPage.jsp");
}
%>


		<h1>My Leave Status <button  onclick="window.location.href='StudentLeaveForm.jsp'"> Request Leave</button></h1>
      <TABLE BORDER="1">
      <TR>
      <TH>Register Number</TH>
      <TH>leave Reason</TH>
      <TH>From Date</TH>
      <TH>To Date</TH>
      <TH>No.of Days</TH>
      <TH>Status</TH>
     
      </TR>
     <%
     String regno=(String)session.getAttribute("reg_no");
      AdminprofileDAO leavests= new AdminprofileDAO();
      ResultSet rs=leavests.retleavestatus(regno);
    		  
     
     while(rs.next()){ %>
      <TR>
       <TD><%=rs.getString(2) %></TD>
       <TD><%=rs.getString(3) %></TD>
       <TD><%=rs.getString(4) %></TD>
       <TD><%=rs.getString(5) %></TD>
       <TD><%=rs.getInt(6) %></TD>
       <TD><%=rs.getString(7) %></TD>
       
      
      </TR>
    <%} %>
     </TABLE>
  <button class="logout" onclick="window.location.href='StudentLogout.jsp'">Logout</button>
</body>
</html>