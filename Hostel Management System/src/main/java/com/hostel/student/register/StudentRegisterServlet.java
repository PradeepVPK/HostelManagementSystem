package com.hostel.student.register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentRegisterServlet
 */
@WebServlet("/StudentRegisterServlet")
public class StudentRegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String fname =request.getParameter("fname");
	    	String uname=request.getParameter("uname");
	    	String reg_no=request.getParameter("reg_no");
	    	String psw =request.getParameter("psw");
	    	String rpt_psw =request.getParameter("rpt_psw");
	    	String mobile_no =request.getParameter("mob_no");
	    	String email =request.getParameter("email");
	    	
	    	if(psw.equals(rpt_psw)) {
	    		StudentRegisterDAO studentregisterdao = new StudentRegisterDAO();
		    	int j=studentregisterdao.insert(fname,reg_no, uname, psw, email, mobile_no);
		    	if (j > 0) {
		    		PrintWriter out=response.getWriter();
		            out.println("alert(\"Registration Successfull!\")");
		            response.sendRedirect("StudentLoginPage.jsp");
		           
		         } else {
		             response.sendRedirect("StudentRegisterPage.jsp");
		         }
	    	}
	    	else {
	    		
	    	}
	    	
	}

}
