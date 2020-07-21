package com.thinking.machines.blog.dao;
import com.thinking.machines.blog.dao.*;
import com.thinking.machines.blog.beans.*;
import java.sql.*;
public class UserDao
{
 private Connection con;

//constructor
 public UserDao(Connection con)
 {
  this.con=con; 
 }

//Methods
public boolean saveUser(User user)
{
  boolean isDone=false;
 try
 {
  int i=0;  
  String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
  PreparedStatement ps=this.con.prepareStatement(query);
  ps.setString(1,user.getName());
  ps.setString(2,user.getEmail());
  ps.setString(3,user.getPassword());
  ps.setString(4,user.getGender());
  ps.setString(5,user.getAbout());
  
  i=ps.executeUpdate();
  if(i==1)isDone=true;
 }catch(Exception e)
 {
 e.printStackTrace(); 
 }
 return isDone;
}

public User updateUser(User user)
{
User u=null;
try
{
  int i=0;  
  String query="update User set name=?,email=?,password=?,about=?,profile=? where id=?";
  PreparedStatement ps=this.con.prepareStatement(query);
  ps.setString(1,user.getName());
  ps.setString(2,user.getEmail());
  ps.setString(3,user.getPassword());
  ps.setString(4,user.getAbout());
  ps.setString(5,user.getProfile());
  ps.setInt(6,user.getId());
  
  i=ps.executeUpdate();
  u=getUserByEmailAndPassword(user.getEmail(),user.getPassword());
 }catch(Exception e)
 {
 e.printStackTrace(); 
 }

return u;
}

public User getUserByEmailAndPassword(String email,String password)
{
User user=null;
try
{
String query="Select * from User where email=? and password=?";
PreparedStatement ps=this.con.prepareStatement(query);
ps.setString(1,email);
ps.setString(2,password);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
user =new User();
user.setId(rs.getInt("id"));
user.setName(rs.getString("name"));
user.setEmail(rs.getString("email"));
user.setPassword(rs.getString("password"));
user.setAbout(rs.getString("about"));
user.setGender(rs.getString("gender"));
user.setRegistrationDate(rs.getString("registration_date"));
user.setProfile(rs.getString("profile"));
}
}catch(Exception e)
{
e.printStackTrace();
}
return user;
}
}