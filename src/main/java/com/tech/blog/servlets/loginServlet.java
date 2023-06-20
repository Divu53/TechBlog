package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Massage;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // login
		response.setContentType("text/html");
		PrintWriter out =response.getWriter();
		
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		User u=dao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if(u==null) {
			
			//out.println("Invalid details.....Try again");
			Massage msg  = new Massage("Invalid ! Details Try with Anthor"," error" , "alert-danger");
			HttpSession s = request.getSession();
		    s.setAttribute("msg", msg);
			
			response.sendRedirect("login_page.jsp");
			
		}else {
			HttpSession h =request.getSession();
			h.setMaxInactiveInterval(0);
			h.setAttribute("CurrentUser", u);
			response.sendRedirect("profile.jsp");
			
		}
	}

	
}
