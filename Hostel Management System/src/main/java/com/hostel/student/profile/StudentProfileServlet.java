package com.hostel.student.profile;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/StudentProfileServlet")
public class StudentProfileServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession();
		String reg_no= (String) session.getAttribute("reg_no");
		
		String fullname= request.getParameter("fname");
		String fathername= request.getParameter("fathername");
		String mothername= request.getParameter("mothername");
		String parent_mob= request.getParameter("par_mob_no");
		String dob= request.getParameter("dob");
		String gender= request.getParameter("gender");
		String degree= request.getParameter("degree");
		String bloodgroup= request.getParameter("bloodgroup");
		String house_no= request.getParameter("house_no");
		String areaname= request.getParameter("areaname");
		String pincode= request.getParameter("pincode");
		String state= request.getParameter("state");
		String district= request.getParameter("district");
		
		StudentProfileDTO studentprofiledto =new StudentProfileDTO();
		
		if(studentprofiledto.insert(reg_no, fullname, fathername, mothername, parent_mob, dob, gender, degree, bloodgroup, house_no, areaname, pincode, state, district)>0) {
			PrintWriter out = response.getWriter();
			out.println("Profile updated  successfully!");
		}
		else {
			response.sendRedirect("StudentProfilepage.jsp");
		}
	}

}
