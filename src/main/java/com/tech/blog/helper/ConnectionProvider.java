package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {
	
	public static Connection con;
	
	  public static Connection getConnection() {
		  
		  try {
			  
			 if(con==null) {
				 
				  Class.forName("com.mysql.jdbc.Driver");
				  
				  con =DriverManager.getConnection("jdbc:mysql://localhost:3306/TechBlog","root","DIVANSHI53234412");
			 }
			 
		  } catch(Exception e)
		  {
			  System.out.println(e.getMessage());
			e.printStackTrace();  
		  }
		  
		  return con;
	  }
	 
    }


