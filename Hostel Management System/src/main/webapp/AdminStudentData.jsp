<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 <% Class.forName("com.mysql.cj.jdbc.Driver"); %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Details</title>

<link rel="stylesheet" type="text/css" href="style/table.css">
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
</head>
<body >
<button class="logout" onclick="window.location.href='AdminLogoutPage.jsp'">Logout</button>

<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("username")==null){
	   response.sendRedirect("AdminLoginPage.jsp");
}
%>
<div >
       <label id="heading">Student Details &nbsp;&nbsp;&nbsp;  
        <button id="add" onclick="window.location.href='AdminAddStudentProfile.jsp'">Add</button>
  <button id="edit" onclick="window.location.href='AdminEditStudentProfile.jsp'">Edit</button>
  <button id="delete" onclick="window.location.href='AdminDeleteStudentProfile.jsp'">Delete</button> </label>
</div>

       <%
       String sql = "select *  from   studentregister inner  join studentprofile on studentprofile.registernumber=studentregister.registernumber order by studentregister.registernumber; ";
       String url = "jdbc:mysql://localhost:3306/hostel";
       String username = "root";
       String password = "i5rtx3050";
       
     
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
     PreparedStatement st=con.prepareStatement(sql);
     ResultSet rs =st.executeQuery();
       %> 
      <TABLE BORDER="1">
      <TR>
      <TH>Register Number</TH>
      <TH>Name Of Student</TH>
      <TH>Course</TH>
      <TH>Date Of Birth</TH>
      <TH>Email</TH>
      <TH>Mobile Number</TH>
      <TH>Parent Details</TH>
      <TH>Address</TH>
      <TH>Gender</TH>
      <TH>Blood Group</TH>
      
      </TR>
    
     <%while(rs.next()){ %>
      <TR>
       <TD><%=rs.getString(3) %></TD>
       <TD><%=rs.getString(2) %></TD>
       <TD><%=rs.getString(15) %></TD>
       <TD><%=rs.getString(13) %></TD>
       <TD><%=rs.getString(6) %></TD>
       <TD><%=rs.getString(7) %></TD>
       <TD><label>Father Name :</label><%=rs.getString(10) %><br><label>Mother Name :</label><%=rs.getString(11) %><br><label>Parent Mobile :</label><%=rs.getString(12) %></TD>
       <TD><%=rs.getString(17) %><br><%=rs.getString(18) %><br><%=rs.getString(21) %><br><%=rs.getString(20) %><br><%=rs.getString(19) %></TD>
       <TD><%=rs.getString(14) %></TD>
       <TD><%=rs.getString(16) %></TD>
      
      </TR>
    <%} %>
     </TABLE>
  
</body>
</html>