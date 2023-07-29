<%@page import="com.hostel.student.room.StudentGenderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Hostel Room</title>
<link rel="stylesheet"  href="style/leavestyle.css">
<style type="text/css">
label {
	font-size: 20px;
}
h6 {
	font-size: 20px;
	color: green;
}
h5 {
	font-size: 20px;
	color: red;
}
</style>
</head>
<body >

 <button class="logout" onclick="window.location.href='StudentLogout.jsp'">Logout</button>

<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("reg_no")==null){
	   response.sendRedirect("StudentLoginPage.jsp");
}
%>
<div class="container">
<form>
<label>Room Number :</label>
<%@ page import="java.sql.*" %>
<%
StudentGenderDao getgender = new StudentGenderDao();
String registernumber= (String)session.getAttribute("reg_no");
String gender=getgender.Gender(registernumber);
   Connection connection = null;
   PreparedStatement statement = null;
   ResultSet resultSet = null;
   try {
	   String url = "jdbc:mysql://localhost:3306/hostel";
       String username = "root";
       String password = "i5rtx3050";
       
     String sql="SELECT roomnumber FROM studentroom where gender=?";
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);
			   statement=connection.prepareStatement(sql);
			   statement.setString(1, gender);
			   resultSet =statement.executeQuery();
      String currentGroup = "";
      out.println("<select name='roomnumber' required >");
      while (resultSet.next()) {
         String group = "roomnumber";
         String value = resultSet.getString("roomnumber");
         String text = resultSet.getString("roomnumber");
         if (!group.equals(currentGroup)) {
            if (!currentGroup.equals("")) {
               out.println("</optgroup>");
            }
            out.println("<optgroup label='" + group + "'>");
            currentGroup = group;
         }
         out.println("<option value='" + value + "'>" + text + "</option>");
      }
      if (!currentGroup.equals("")) {
         out.println("</optgroup>");
      }
      out.println("</select><br><br>");
 
   } catch (SQLException e) {
      e.printStackTrace();
   } catch (ClassNotFoundException e) {
      e.printStackTrace();
   } finally {
      try {
         if (resultSet != null) {
            resultSet.close();
         }
         if (statement != null) {
            statement.close();
         }
         if (connection != null) {
            connection.close();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
%>
<label for="join_date">Joining Date :</label>
<input type="date" name="join_date" id="join_date" required="required" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>" >
<script type="text/javascript">
    var today = new Date();
    var maxDate = new Date();
    maxDate.setDate(today.getDate() + 15);
    document.getElementById("join_date").max = maxDate.toISOString().substring(0,10);
</script>    
<h5></h5>
<input type="submit" value="Check availability">
</form>
</div>
<%
 session.setAttribute("joindate", request.getParameter("join_date"));
%>
<label>
<%
String av="";
String roomnumber= request.getParameter("roomnumber");

try {
	   String url = "jdbc:mysql://localhost:3306/hostel";
    String username = "root";
    String password = "i5rtx3050";
    
  String sql="SELECT seatavailable FROM studentroom where roomnumber=?";
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);
			   statement=connection.prepareStatement(sql);
			   statement.setString(1, roomnumber);
			   resultSet =statement.executeQuery();
			   resultSet.next();
			   if(resultSet.getInt(1)>0){
				   av="<h6>Rooms Available for Booking </h6>";
				   out.println("<br><label>Room Number :</label>"+roomnumber+"<br>");  
					out.println(av);
					out.println("<label>Fees Per Month :</label>"+5000+"<br>");	 
					
					//out.println("<br><button onclick=\"window.location.href='RoomBooked.jsp?roomnumber="+roomnumber+"\">Book Room</button>");
			   }
			   else{
				   av="<h5>Rooms Not Available for Booking </h5>";
				   out.println("<br><label>Room Number :</label>"+roomnumber+"<br>");
					out.println(av);
			   }
   
} catch (SQLException e) {
   e.printStackTrace();
} catch (ClassNotFoundException e) {
   e.printStackTrace();
} finally {
   try {
      if (resultSet != null) {
         resultSet.close();
      }
      if (statement != null) {
         statement.close();
      }
      if (connection != null) {
         connection.close();
      }
   } catch (SQLException e) {
      e.printStackTrace();
   }

}
%><br><br></label>
<%if (roomnumber!=null){ %>

<button onclick="window.location.href='RoomBooked.jsp?roomnumber=<%=roomnumber%>'"> BOOK ROOM</button>
<%}; %>
</body>
</html>