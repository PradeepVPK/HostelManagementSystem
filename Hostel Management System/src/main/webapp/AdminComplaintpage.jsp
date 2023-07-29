<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Complaints and Feedbacks</title>

<link rel="stylesheet" type="text/css" href="style/table.css">
</head>
<body >
<button class="logout" onclick="window.location.href='AdminLogoutPage.jsp'">Logout</button>

<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("username")==null){
	   response.sendRedirect("StudentLoginPage.jsp");
}
%>
<H1>Complaints and Feedbacks </H1>
       <%
       String sql = "select *  from   studentcomplaints  ";
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
      <TH>Area Of Complaint</TH>
      <TH>Complaint</TH>
     
      
      </TR>
    
     <%while(rs.next()){ %>
      <TR>
       <TD><%=rs.getString(1) %></TD>
       <TD><%=rs.getString(2) %></TD>
       <TD><%=rs.getString(3) %></TD>
       
      
      </TR>
    <%} %>
     </TABLE>
  
</body>
</html>