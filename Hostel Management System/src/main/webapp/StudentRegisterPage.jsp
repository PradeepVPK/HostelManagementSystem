<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>
<link rel="stylesheet" type="text/css" href="style/registerstyle.css">
<script type="text/javascript">
var check = function() {
	  if (document.getElementById('psw').value ==
	    document.getElementById('rpt_psw').value) {
	    document.getElementById('message').style.color = 'green';
	    document.getElementById('message').innerHTML = 'matching';
	  } else {
	    document.getElementById('message').style.color = 'red';
	    document.getElementById('message').innerHTML = 'not matching';
	  }
	}</script>
</head>
<body>

	<div class="register">
		<h2>STUDENT REGISTRATION</h2>
		<form action="StudentRegisterServlet" method="post">
			<div class="content">
				<div class="input-box">
					<label>Username </label> <input type="text"
						placeholder="PeterTheSpidey" name="uname" required><br>
					<br>
				</div>
				<div class="input-box">
					<label>Fullname </label> <input type="text"
						placeholder="Peter Parker" name="fname" required><br>
					<br>
				</div>
				<div class="input-box">
					<label>Register Number </label> <input type="tel"
						placeholder="922120104000" name="reg_no" pattern="[0-9]{12}"
						maxlength="12"><br> <br>
				</div>
				<div class="input-box">
					<label>Password <br>
					</label> <input type="password" placeholder="Peter@123" name="psw" id="psw"
						required><br> <br> 
				</div>
				<div class="input-box">
					<label>Confirm Password </label> <input type="password"
						placeholder="Peter@123" name="rpt_psw" id="rpt_psw"
						onkeyup='check();' required><br> <br><span id='message'></span>
				</div>

				<div class="input-box">
					<label>E-Mail </label> <input type="email"
						placeholder="example@gmail.com" name="email" required><br>
					<br>
				</div>

				<div class="input-box">
					<label>Mobile </label> <input type="tel" placeholder="9876543210"
						pattern="[0-9]{10}" name="mob_no" maxlength="10" required>
					
				</div>
				<div class="input-box">
					<label><br><br>Already a User? <a href="StudentLoginPage.jsp">Login</a></label>
				</div>


				<div class="button-container">
					<br>
					<br>
					<input type="submit" value="Register" onclick="alert("Registrationsuccess")"><br>

				</div>

			</div>
		</form>
	</div>
</body>
</html>