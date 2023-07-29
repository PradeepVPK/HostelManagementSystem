<%@page import="java.sql.ResultSet"%>
<%@page import="com.hostel.admin.AdminprofileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet"  type="text/css" href="style/style.css">
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
<form action="EditProfileServlet" method="post">
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
         //out.println("</optgroup>");
      }
    //  out.println("<optgroup >");
      currentGroup = group;
   }
   out.println("<option value='" + value + "'>" + text + "</option>");
}
if (!currentGroup.equals("")) {
  // out.println("</optgroup>");
}
out.println("</select><br><br>");
%>


<label>Fullname : </label> 
<input type="text" placeholder="Peter Parker" name="fname" required><br><br>

<label>Father Name : </label> 
<input type="text" placeholder="Uncle Ben" name="fathername" required><br><br>

<label>Mother Name : </label> 
<input type="text" placeholder="Aunt may" name="mothername" required><br><br>

<label>Parent Mobile : </label> 
 <input type="tel" placeholder="9876543210" pattern="[0-9]{10}" name="par_mob_no" maxlength="10" required><br><br>


<label>Date of Birth : </label> 
<input type="date" placeholder="15-01-1999" name="dob" max="2008-01-31" required><br><br>

<label>Select Gender : </label> 
<input type="radio" required name="gender" value="Male" />Male
<input type="radio" required name="gender" value="Female" />Female<br/><br/>


<label for="degree">Select Degree:</label>
<select name="degree"  required="required">
<option  value="0">Select</option>
	<optgroup label="ENGINEERING">
		<option value="CSE">CSE</option>
		<option value="ECE">ECE</option>
		<option value="EEE">EEE</option>
		<option value="MECH">MECH</option>
		<option value="CIVIL">CIVIL</option>
	</optgroup>
	<optgroup label="ARTS & SCIENCE">
		<option value="BCA">BCA</option>
		<option value="BBA">BBA</option>
		<option value="B.Sc(CS)">B.Sc(CS)</option>
		<option value="B.Sc(MATHS)">B.Sc(MATHS)</option>
		<option value="B.Com">B.Com</option>
			</optgroup>
</select><br><br>

<label>Select Blood Group : </label> 
<select name="bloodgroup"  required="required">
<option value="A+" selected>A+</option><option value="A-">A-</option>
<option value="B+">B+</option><option value="B-">B-</option>
<option value="O+">O+</option><option value="O-">O-</option>
<option value="AB+">AB+</option><option value="AB-">AB-</option><option value="other">Other</option>
</select><br><br>


<label>House Number : </label> 
<input type="tel" placeholder="202" name="house_no" pattern="{0-9}[3]" required><br><br>


<label>Area name : </label> 
<input type="text" placeholder="wallmart" name="areaname" required><br><br>


<label>Postal Code : </label> 
<input type="text" placeholder="600028" name="pincode" pattern="[0-9]{6}"  required maxlength="6"><br><br>


 <div class="form-group col-md-4">
 <label for="inputState">State</label>
    <select class="form-control" name="state" required="required" id="inputState">
                        <option value="SelectState">Select State</option>
                        <option value="Andra Pradesh">Andra Pradesh</option>
                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                        <option value="Assam">Assam</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Chhattisgarh">Chhattisgarh</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Haryana">Haryana</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Karnataka">Karnataka</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Madya Pradesh">Madya Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Manipur">Manipur</option>
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Mizoram">Mizoram</option>
                        <option value="Nagaland">Nagaland</option>
                        <option value="Orissa">Orissa</option>
                        <option value="Punjab">Punjab</option>
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Sikkim">Sikkim</option>
                        <option value="Tamil Nadu">Tamil Nadu</option>
                        <option value="Telangana">Telangana</option>
                        <option value="Tripura">Tripura</option>
                        <option value="Uttaranchal">Uttaranchal</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="West Bengal">West Bengal</option>
                        <option disabled style="background-color:#aaa; color:#fff">UNION Territories</option>
                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                        <option value="Chandigarh">Chandigarh</option>
                        <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                        <option value="Daman and Diu">Daman and Diu</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Lakshadeep">Lakshadeep</option>
                        <option value="Pondicherry">Pondicherry</option>
                      </select>
  </div><br>
  
  <div class="form-group col-md-4">
    <label for="inputDistrict">District</label>
    <select class="form-control" name="district" required="required" id="inputDistrict">
        <option value="">-- select one -- </option>
    </select>
  </div><br>
  

<input type="submit" value="Submit">

</form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

<script src="stateandcountry.js"></script>
</body>
</html>