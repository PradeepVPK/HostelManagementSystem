package com.hostel.student.complaint;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

/**
 * Servlet implementation class StudentComplaintServlet
 */
@WebServlet("/StudentComplaintServlet")
public class StudentComplaintServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * HttpSession session=request.getSession(); String reg_no= (String)
		 * session.getAttribute("reg_no");
		 */

		String area_of_complaint= request.getParameter("area_of_complaint");

		String complaint= request.getParameter("complaint");
		HttpSession session = request.getSession();
String reg_no=(String)session.getAttribute("reg_no");
		StudentComplaintDTO studentcomplaintdto= new StudentComplaintDTO();
		
		if(studentcomplaintdto.insert(reg_no, area_of_complaint, complaint)>0) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.println("Complaint updated  successfully!");
			out.println("<br><br><a href='StudentComplainPage.jsp'>Redirect to Complaint Page</a>");
		}
		else {
			response.sendRedirect("StudentComplainPage.jsp");
		}
		
		
	}

}
