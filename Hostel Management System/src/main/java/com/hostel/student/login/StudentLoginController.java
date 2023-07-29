package com.hostel.student.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hostel.admin.room.AdminDAO;

/**
 * Servlet implementation class StudentLoginController
 */
@WebServlet("/StudentLoginController")
public class StudentLoginController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String reg_no = request.getParameter("reg_no");
		String psw = request.getParameter("psw");
		AdminDAO login = new AdminDAO();
//		response.sendRedirect("index.jsp");
	StudentLoginDAO studentlogindao = new StudentLoginDAO();
		if (studentlogindao.check(reg_no, psw)) {
			HttpSession session = request.getSession();
			session.setAttribute("reg_no", reg_no);
			response.sendRedirect("StudentHomePage.jsp");
		} else {
			response.sendRedirect("StudentLoginPage.jsp");
		}

	}

}
