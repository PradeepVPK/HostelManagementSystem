package com.hostel.admin.profile;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hostel.admin.AdminprofileDAO;
import com.hostel.student.profile.StudentProfileDTO;

/**
 * Servlet implementation class EditStudentProfile
 */
@WebServlet("/EditProfileServlet")
public class EditStudentProfile extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String regno= request.getParameter("registernumber");
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
		
		AdminprofileDAO studentprofiledto =new AdminprofileDAO();
		
		if(studentprofiledto.updatestudentprofile( regno,fullname, fathername, mothername, parent_mob, dob, gender, degree, bloodgroup, house_no, areaname, pincode, state, district)>0) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.println("Profile updated  successfully!");
			out.println("<br><br><a href='AdminStudentData.jsp'>Redirect to Student Details Page</a>");
	
		}
		else {
			response.sendRedirect("StudentProfilepage.jsp");
		}
	}

}
