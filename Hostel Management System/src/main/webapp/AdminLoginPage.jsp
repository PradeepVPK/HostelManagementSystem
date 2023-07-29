<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<link rel="stylesheet"  type="text/css" href="style/loginstyle.css">
</head>
<body>
<div class="login">
<h2>ADMIN LOGIN</h2>
<form action="AdminLoginServlet" method="post">
<div class="content">

<div class="input-box">
<label>Username  </label> <br>
<input type="text" placeholder="Enter Username" name="uname" required><br><br>
</div>
<div class="input-box">
 <label>Password  </label> <br>
 <input type="password" placeholder="Enter Password" name="psw" required><br><br>
 </div>
 <input type="submit" value="Login">
</div>
</form>
</div>
</body>
</html>