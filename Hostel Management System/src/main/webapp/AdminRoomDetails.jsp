<%@page import="com.hostel.student.room.StudentGenderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#add{
background-color:green;
}
#edit{
background-color:orange;
}
#delete{
background-color:red;
}
</style>

<link rel="stylesheet"  type="text/css" href="style/table.css">
</head>
<body>
<button class="logout" onclick="window.location.href='AdminLogoutPage.jsp'">Logout</button>

<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("username")==null){
	   response.sendRedirect("AdminLoginPage.jsp");
}
%>
<div>
<label id="heading">Room Details </label>
  <button id="add" onclick="window.location.href='AdminAddStudentRoom.jsp'">Add</button>
  <button id="edit" onclick="window.location.href='AdminEditStudentRoom.jsp'">Edit</button>
  <button id="delete" onclick="window.location.href='AdminDeleteStudentRoom.jsp'">Delete</button>
  </div>
 
       <%
       String sql = "select *  from   studentroom";
       StudentGenderDao connect= new StudentGenderDao();
       Connection con=connect.getConnection();
     PreparedStatement st=con.prepareStatement(sql);
     ResultSet rs =st.executeQuery();
       %> 
      <TABLE  BORDER="1">
      <TR>
      <TH>Room Number</TH>
      <TH>Gender</TH>
      <TH>Seat Available</TH>
      <TH>Students Registernumber</TH>
      
      
      </TR>
    
     <%while(rs.next()){ %>
      <TR>
       <TD><%=rs.getString(1) %></TD>
       <TD><%=rs.getString(2) %></TD>
       <TD><%=rs.getString(3) %></TD>
       <TD><%=rs.getString(4) %><br><%=rs.getString(5) %><br><%=rs.getString(6) %><br><%=rs.getString(7) %><br><%=rs.getString(8) %></TD>
      
      </TR>
    <%} %>
     </TABLE>
  
</body>
</html>