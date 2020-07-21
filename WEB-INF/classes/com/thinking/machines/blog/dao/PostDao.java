package com.thinking.machines.blog.dao;
import com.thinking.machines.blog.dao.*;
import com.thinking.machines.blog.beans.*;
import java.util.*;
import java.sql.*;
public class PostDao
{
 private Connection con;

//constructor
 public PostDao(Connection con)
 {
  this.con=con; 
 }

//Methods
public boolean savePost(Post post)
{
boolean isDone=false;
try
{
String query="insert into post (title,content,code,pic,cat_id,user_id) value(?,?,?,?,?,?)";
PreparedStatement ps=this.con.prepareStatement(query);
ps.setString(1,post.getTitle());
ps.setString(2,post.getContent());
ps.setString(3,post.getCode());
ps.setString(4,post.getPic());
ps.setInt(5,post.getCategoryId());
ps.setInt(6,post.getUserId());
int i=ps.executeUpdate();
if(i==1)isDone=true;
}catch(Exception e)
{
e.printStackTrace();
}
return isDone;
}

public ArrayList<Post> getAllPost()
{
ArrayList<Post> postList=null;
Post post=null;
try
{
postList=new ArrayList<Post>();
String query="Select * from post order by id desc";
PreparedStatement ps=this.con.prepareStatement(query);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
post=new Post();
post.setId(rs.getInt("id"));
post.setTitle(rs.getString("title"));
post.setContent(rs.getString("content"));
post.setCode(rs.getString("code"));
post.setPic(rs.getString("pic"));
post.setDate(rs.getString("date"));
post.setCategoryId(rs.getInt("cat_id"));
post.setUserId(rs.getInt("user_id"));
postList.add(post);
}
}catch(Exception e)
{
e.printStackTrace();
}
return postList;
}

public Post getPostById(int id)
{
Post post=null;
try
{
String query="Select * from post where id=?";
PreparedStatement ps=this.con.prepareStatement(query);
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
post=new Post();
post.setId(rs.getInt("id"));
post.setTitle(rs.getString("title"));
post.setContent(rs.getString("content"));
post.setCode(rs.getString("code"));
post.setPic(rs.getString("pic"));
post.setDate(rs.getString("date"));
post.setCategoryId(rs.getInt("cat_id"));
post.setUserId(rs.getInt("user_id"));
}
}catch(Exception e)
{
e.printStackTrace();
}
return post;
}

public ArrayList<Post> getPostByCategoryIdAndUserId(int categoryId,int userId)
{
ArrayList<Post> postList=null;
Post post=null;
postList=new ArrayList<Post>();
try
{
postList=new ArrayList<Post>();
String query="Select * from post where cat_id=? and user_id=?";
PreparedStatement ps=this.con.prepareStatement(query);
ps.setInt(1,categoryId);
ps.setInt(2,userId);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
post=new Post();
post.setId(rs.getInt("id"));
post.setTitle(rs.getString("title"));
post.setContent(rs.getString("content"));
post.setCode(rs.getString("code"));
post.setPic(rs.getString("pic"));
post.setDate(rs.getString("date"));
post.setCategoryId(rs.getInt("cat_id"));
post.setUserId(rs.getInt("user_id"));
postList.add(post);
}
}catch(Exception e)
{
e.printStackTrace();
}
return postList;
}
}