<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 <% Class.forName("com.mysql.cj.jdbc.Driver"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLeavePage</title>

<link rel="stylesheet"  type="text/css" href="style/table.css">
</head>
<body >

 <button class="logout" onclick="window.location.href='AdminLogoutPage.jsp'">Logout</button>

<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("username")==null){
	   response.sendRedirect("AdminLoginPage.jsp");
}
%>

<H1>Students Leave Request </H1>
       <%
       String sql = "select *  from   studentleave  where status is null ";
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
       <TH>S No</TH>
      <TH>Register Number</TH>
      <TH>Reason</TH>
      <TH>From Date</TH>
     <TH>To Date</TH>
     <TH>Number Of Leavedays </TH>
     <TH>Accept</TH>
     <TH>Decline </TH>
      
      </TR>
    <%int i=0; %>
     <%while(rs.next()){ %>
      <TR>
      
       <TD><%=++i%></TD>
       <TD><%=rs.getString(2) %></TD>
       <TD><%=rs.getString(3) %></TD>
       <TD><%=rs.getString(4) %></TD>
       <TD><%=rs.getString(5) %></TD>
        <TD><%=rs.getString(6) %></TD>
        <TD><button onclick="window.location.href='AdminLeaveAccept.jsp?id=<%=rs.getInt(1) %>'">Accept</button>
        <TD><button onclick="window.location.href='AdminLeaveReject.jsp?id=<%=rs.getInt(1) %>'">Decline</button>
        
        </TD>
      
      </TR>
    <%} %>
     </TABLE>

</body>
</html>