package com.hostel.admin.login;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginServ"
		+ "let")
public class AdminLoginServlet extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname= request.getParameter("uname");
		String psw =request.getParameter("psw");
		 AdminLoginDAO adminlogindao = new AdminLoginDAO();
		if(adminlogindao.check(uname, psw))
		{
			HttpSession session =request.getSession();
			session.setAttribute("username", uname);
			response.sendRedirect("AdminHomePage.jsp");
		}
		else {
			response.sendRedirect("AdminLoginPage.jsp");
		}
		}

}
