package com.thinking.machines.blog.dao;
import com.thinking.machines.blog.dao.*;
import com.thinking.machines.blog.beans.*;
import java.util.*;
import java.sql.*;
public class LikeDAO
{
 private Connection con;

//constructor
 public LikeDAO(Connection con)
 {
  this.con=con; 
 }

//Methods
public boolean isUserAlreadyLike(int postId,int userId)
{
boolean i=false;
try
{
String query="select * from likeTable where post_id=?  and user_id=?";
PreparedStatement ps=this.con.prepareStatement(query);
ps.setInt(1,postId);
ps.setInt(2,userId);
ResultSet rs=ps.executeQuery();
if(rs.next())i=true;
}catch(Exception e)
{
e.printStackTrace();
}
return i;
}
public boolean doLike(PostLike like)
{
boolean isDone=false;
try
{
if(isUserAlreadyLike(like.getPostId(),like.getUserId()))
{
doDisLike(like.getPostId(),like.getUserId());
isDone=true;
}
else
{
String query="insert into liked (post_id,user_id) values(?,?)";
PreparedStatement ps=this.con.prepareStatement(query);
ps.setInt(1,like.getPostId());
ps.setInt(2,like.getUserId());
int i=ps.executeUpdate();
if(i==1)isDone=true;
}
}catch(Exception e)
{
e.printStackTrace();
}
return isDone;
}

public int getAllLike(int post_id)
{
int noOfLike=0;
try
{
String query="select count(*) from liked where post_id=?";
PreparedStatement ps=this.con.prepareStatement(query);
ps.setInt(1,post_id);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
noOfLike=rs.getInt(1);
}
}catch(Exception e)
{
e.printStackTrace();
}
return noOfLike;
}

public void doDisLike(int post_id,int user_id)
{
try
{
String query="delete from likeTable where post_id=? and user_id=?";
PreparedStatement ps=this.con.prepareStatement(query);
ps.setInt(1,post_id);
ps.setInt(2,user_id);
ps.executeUpdate();
}catch(Exception e)
{
e.printStackTrace();
}
}

}