package com.hostel.student.room;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/StudentRoomServlet")
public class StudentRoomServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String regno=(String)session.getAttribute("reg_no");
		StudentGenderDao studentroomnumber= new StudentGenderDao();
		try {
			if(studentroomnumber.Roomnumber(regno)==null) {
				response.sendRedirect("StudentRoomBook.jsp");
			}
			else {
				response.sendRedirect("StudentRoomDetails.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
