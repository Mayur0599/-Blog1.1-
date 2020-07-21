package com.thinking.machines.blog.dao;
import java.sql.*;
public class DAOConnection extends Exception
{
 private static Connection con;
 public static Connection getConnection()
 {
 try
 {
       Class.forName("com.mysql.cj.jdbc.Driver");
       con=DriverManager.getConnection("jdbc:mysql://localhost:3306/learningproject","learningdbuser","learningdbuser");
   
    return con;
 }catch(Exception e)
 {
  e.printStackTrace();
 }
 return con;
 }
}
