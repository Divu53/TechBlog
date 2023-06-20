package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	public ArrayList<Category> getAllCategories(){
		
		ArrayList<Category> list=new ArrayList<>();
		try {
			String query="select *from  categories";
			Statement st=this.con.createStatement();
			ResultSet set=(ResultSet) st.executeQuery(query);
			while( ((ResultSet) set).next()) {
				int cid=((ResultSet) set).getInt("cid");
				String name=((ResultSet) set).getString("name");
				String description=((ResultSet) set).getString("description");
				Category c=new Category(cid,name,description);
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public boolean savePost(Post p) {
		boolean f = false;
		
		try {
			
			String q = "insert into posts(pTitle,pContent,pCode,pPic,catID,userID) values(? ,? ,?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1,p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3,p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatID());
			pstmt.setInt(6, p.getUserID());
			
			pstmt.executeUpdate();
			f=true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
		
	}

}
