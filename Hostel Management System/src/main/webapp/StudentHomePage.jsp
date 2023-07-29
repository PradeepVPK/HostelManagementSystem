<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


.logout{
position: fixed;
right: 5%;
top:5%;
}

button {
	justify-content: center;
	cursor: pointer;
	outline: 0;
	color: #fff;
	background-color: #0d6efd;
	border-color: #0d6efd;
	display: inline-block;
	font-weight: 400;
	line-height: 1.5;
	text-align: center;
	border: 1px solid transparent;
	padding: 6px 12px;
	font-size: 16px;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

button :hover {
	color: #fff;
	background-color: #0b5ed7;
	border-color: #0a58ca;
}

.container {
	display: flex;
	flex-direction: column;
	height: 100vh;
}

.top {
	flex: 1;
	display: flex;
	justify-content: center;
}

.bottom {
	flex: 1;
	display: flex;
	justify-content: center;
}

.box {
	width: 20%;
	height: 100%;
	background-color: black;
	text-align: center;
}

.image-frame {
	height: 200px;
	width: 200px;
	text-align: center;
}

input {
	background-color: cyan;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 30px;
	border: none;
	height: 200px;
	width: 200px
}
.logout{
position: fixed;
right: 3%;
top:3%;
}
</style>

</head>
<body bgcolor="black">

 <button class="logout" onclick="window.location.href='StudentLogout.jsp'">Logout</button>


<%

   response.setHeader("cache-control","no-cache,no-store, must-revalidate");

   if(session.getAttribute("reg_no")==null){
	   response.sendRedirect("StudentLoginPage.jsp");
}
%>

	<div class="container">

		<div class="top">
			<div class="box">
				<form action="StudentLeaveStatus.jsp">
					<br> <input type="submit" value="Leave ">
				</form>
			</div>
			<div class="box">
				<form action="StudentComplainPage.jsp">
					<br> <input type="submit" value="Complaint ">
				</form>
			</div>

		</div>

		<div class="bottom">

			<div class="box">
				<form action="StudentPersonalDetails.jsp">
					<br> <input type="submit" value="My Data ">
				</form>
			</div>
			<div class="box">
				<form action="StudentRoomServlet" method="post">
					<br> <input type="submit" value="Room ">
				</form>
			</div>

		</div>
	</div>
</body>
</html>