package com.hostel.admin.room;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session=request.getSession();
	PrintWriter out=response.getWriter();
	String regno=(String)session.getAttribute("regno");
	String joindate=(String)session.getAttribute("joindate");
	String roomnumber=request.getParameter("roomnumber");
	int feespaid=Integer.parseInt(request.getParameter("feespaid"));
	AdminDAO insert=new AdminDAO();
	try {
		if(insert.insertfees(regno, roomnumber, joindate, feespaid)&& insert.insertprofile(roomnumber, regno) && insert.insertroom(roomnumber, regno)) {
		//out.println("<script>alert('Registraion success')</script>");
	response.sendRedirect("AdminRoomDetails.jsp");
		}
		else {
			out.println("fail");	
		}
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}

}
