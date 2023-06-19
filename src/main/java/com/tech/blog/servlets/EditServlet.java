package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mysql.cj.jdbc.ha.BestResponseTimeBalanceStrategy;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Massage;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		String userName=request.getParameter("user_name");
		String userEmail=request.getParameter("user_email");
		String userPassword=request.getParameter("user_password");
		String userAbout=request.getParameter("user_about");
		Part part = request.getPart("image");
		String imageName =part.getSubmittedFileName();
		
		
		HttpSession s = request.getSession();
	       User user =(User)s.getAttribute("CurrentUser");
           user.setEmail(userEmail);
	       user.setName(userName);
	       user.setPassword(userPassword);
	       user.setAbout(userAbout);
	       String oldFile = user.getProfile();
	       user.setProfile(imageName);
	       
	       UserDao userDao = new UserDao(ConnectionProvider.getConnection());
	       boolean ans = userDao.updateUser(user);
	      
	      if(ans) {
	    	  out.println("upadated to db");
	    	  
	    	  String path = request.getRealPath("/")+"pics" + File.separator + user.getProfile();
	    	  
	    	  String patholdFile  = request.getRealPath("/")+"pics" + File.separator + oldFile;
	    	  
	    	  if(!oldFile.equals("default.png")) {
	    	     Helper.deleteFile(patholdFile);
	    	  }
	    	  if(Helper .saveFile(part.getInputStream(), path)) {
					out.print("profile updated..");
			     Massage msg=new  Massage("profile updated..","success","alert-success");
			    	s.setAttribute("msg", msg);
			    	
				}else {
	    		  
	    		  Massage msg  = new Massage("Something went wrong ...."," error" , "alert-danger");
		  		   s.setAttribute("msg", msg);
	    	  }
	      }else {
	    	  out.println("not updated.........");
	    	  Massage msg  = new Massage("Something went wrong ...."," error" , "alert-danger");
	  		   s.setAttribute("msg", msg);
	      }
	      
	      
	      response.sendRedirect("profile.jsp");
	       
	    
	}

	


}
