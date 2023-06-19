package com.tech.blog.servlets;

import java.io.IOException;
import java.sql.*;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		// fetch all form data
		
		String check =request.getParameter("check");
		
        if(check==null) {
        	out.println("box not checked");
        }else {
        	
        	String name = request.getParameter("user_name");
        	String email = request.getParameter("user_email");
        	String password = request.getParameter("user_password");
        	String gender = request.getParameter("gender");
        	String about = request.getParameter("about");
        	
        	User user = new User(name,email,password,gender,about);
        	
        	UserDao dao = new UserDao(ConnectionProvider.getConnection());
        	
        	if(dao.SaveUser(user)) {
        		out.println("Done");
        	}else {
        		out.println("error");
        	}
        }
	}

}
