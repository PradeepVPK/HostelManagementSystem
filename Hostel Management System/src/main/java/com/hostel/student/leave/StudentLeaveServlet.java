package com.hostel.student.leave;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/StudentLeaveServlet")
public class StudentLeaveServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String reason= request.getParameter("reason");
		
		String frm_date= request.getParameter("frm_date");

		String to_date= request.getParameter("to_date");
		
		int no_of_leavedays=Integer.parseInt(request.getParameter("result"));

		
	StudentLeaveDTO studentleavetdto=new StudentLeaveDTO();
	HttpSession session = request.getSession();
	String reg_no=(String)session.getAttribute("reg_no");
		if(studentleavetdto.insert(reg_no, reason,frm_date, to_date,no_of_leavedays)>0) {
			PrintWriter out = response.getWriter();
			response.sendRedirect("StudentLeaveStatus.jsp");
		}
		else {
			response.sendRedirect("StudentLeaveForm.jsp");
		}
		
		
	}

}
