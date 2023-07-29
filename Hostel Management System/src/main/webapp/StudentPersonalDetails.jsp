<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 <% Class.forName("com.mysql.cj.jdbc.Driver"); %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Details</title>

<div class="container">
 
 
 <link rel="stylesheet"  href="style/profilestyle.css">


</head>
<body>

<button class="profile" onclick="window.location.href='StudentProfilePage.jsp'">Update Profile</button>
<button class="logout" onclick="window.location.href='StudentLogout.jsp'">Logout</button>
<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("reg_no")==null){
	   response.sendRedirect("StudentLoginPage.jsp");
}
%>

  <%   String reg_no=(String)session.getAttribute("reg_no");
       String sql = "select *  from   studentregister inner  join studentprofile on studentprofile.registernumber=studentregister.registernumber where studentprofile.registernumber=? order by studentregister.registernumber ";
       String url = "jdbc:mysql://localhost:3306/hostel";
       String username = "root";
       String password = "i5rtx3050";
       
     
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
     PreparedStatement st=con.prepareStatement(sql);
    // String reg_no=(String)session.getAttribute("reg_no");
     st.setString(1, reg_no);
     ResultSet rs =st.executeQuery();
     if(rs.next()){
       %> 
             <br><Br> <label>Name :</label>
         <%=rs.getString(2) %><br>
       <br> 
       <label>Register Number : </label>
       <%=rs.getString(3) %><br>
       <br> 
       <label>Username : </label>
       <%=rs.getString(4) %><br>
       <br> 
       <label>Password : </label>
       <%=rs.getString(5) %><br>
       <br> 
       <label>Email : </label>
       <%=rs.getString(6) %><br>
       <br> 
       <label>Mobile Number : </label>
       <%=rs.getString(7) %><br>
       <br> 
       <label>Date Of Birth : </label>
       <%=rs.getString(13) %><br>
       <br> 
       <label>Gender : </label>
       <%=rs.getString(14) %><br>
       <br> 
       <label>Blood Group : </label>
       <%=rs.getString(16) %><br>
       <br> 
       <h2>Parent Details </h2> <br>
           <label>Father Name : </label><%=rs.getString(10) %><br><br>
           <label>Mother Name : </label><%=rs.getString(11) %><br><br>
           <label>Mobile Number: </label><%=rs.getString(12) %><br><br>

       <br> 
       <h2>Address  </h2><br>
       <%=rs.getString(17) %>,<br>
       <%=rs.getString(18) %>,<br>
       <%=rs.getString(20) %>,<br>   
       <%=rs.getString(21) %>,<br>
       <%=rs.getString(19) %><br>
       <br> 

       </div>
       
       <%} %>
       
</body>
</html>