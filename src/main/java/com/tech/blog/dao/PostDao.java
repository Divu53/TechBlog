package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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
	
	
	public List<Post> getAllList() {
		
		List<Post>  list = new ArrayList<>();
		
		try {
			PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
			ResultSet set=p.executeQuery();
			
			while(set.next()) {
				
				int pid = set.getInt("pid");
				String pTitle = set.getNString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int catID= set.getInt("catID");
				int userId = set.getInt("userId");
				
			Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catID, userId);
			list.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	
	public List<Post> getPostBycatID(int catID){
		
		List<Post>  list = new ArrayList<>();
		
		try {
			PreparedStatement p = con.prepareStatement("select * from posts where catID=?");
			p.setInt(1, catID);
			ResultSet set=p.executeQuery();
			
			while(set.next()) {
				
				int pid = set.getInt("pid");
				String pTitle = set.getNString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
			
				int userId = set.getInt("userId");
				
			Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catID, userId);
			list.add(post);
	      
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			return list;
		
	}
	

    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int cid=set.getInt("catId");
                int userId = set.getInt("userId");
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

}
