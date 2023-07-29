<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>

<link rel="stylesheet" type="text/css" href="style/loginstyle.css">
</head>
<body>
	<div class="login">
		<h2>STUDENT LOGIN</h2>
		<form action="StudentLoginController" method="post">
			<div class="content">

				<div class="input-box">
					<label>Register Number </label> <br> <input type="tel" required
						placeholder="922120104000" name="reg_no" pattern="[0-9]{12}"
						maxlength="12"><br>
					<br>
				</div>
				<div class="input-box">
					<label>Password </label> <br> <input type="password"
						placeholder="Enter Password" name="psw" required><br>
					<br>
				</div>
				<input type="submit" value="Login"><br>
				<br>
				<div class="input-box">
					<label id="label"> New User?<a href="StudentRegisterPage.jsp">Register</a>
					</label>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>