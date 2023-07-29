package com.hostel.admin.room;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
			HttpSession session=request.getSession();
			String roomnumber="";
			String registernumber=(String) session.getAttribute("regno");
			roomnumber=request.getParameter("roomnumber");
	        int feespaid=Integer.parseInt(request.getParameter("feespaid"));
	      
	        AdminDAO editroom=new AdminDAO();
	        boolean sts1=false;
	        boolean sts2=false;
	        boolean sts3=false;
	        boolean sts4=false;
	        

	        if(roomnumber.length()!=0) {
	        try {
	        	sts1=editroom.editfeeswithroomnum(roomnumber, registernumber, feespaid);
				 sts2=editroom.editroomsetnull(registernumber);
				 sts3=editroom.editroominstroomnum(registernumber, roomnumber);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	        }
	        else {
	        	try {
					sts1=editroom.editfees(registernumber, feespaid);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
	        
	        try {
				 sts4=editroom.editprofile(roomnumber, registernumber);
			} catch (ClassNotFoundException e) {
			    e.printStackTrace();
			}
	        if(sts1||sts4 || (sts1&&sts2&&sts3)) {
	        	response.sendRedirect("AdminRoomDetails.jsp");
	        }
			
			
	}

}


