package com.tech.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Massage;


@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		s.removeAttribute("currentUser");
		
		Massage m = new Massage("Logout Successfully", "success", "alert-success");
		s.setAttribute("msg", m);
		
		response.sendRedirect("login_page.jsp");
		
	}

	

}
