package com.thinking.machines.blog.dao;
import com.thinking.machines.blog.dao.*;
import com.thinking.machines.blog.beans.*;
import java.util.*;
import java.sql.*;
public class CategoryDao
{
 private Connection con;

//constructor
 public CategoryDao(Connection con)
 {
  this.con=con; 
 }

//Methods
public ArrayList<Category> getAllCategories()
{
ArrayList<Category> categoryList=null;
Category category=null;
try
{
categoryList=new ArrayList<Category>();
String query="Select * from category where id>0";
PreparedStatement ps=this.con.prepareStatement(query);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
category =new Category();
category.setId(rs.getInt("id"));
category.setName(rs.getString("name"));
category.setDescription(rs.getString("description"));
categoryList.add(category);
}
}catch(Exception e)
{
e.printStackTrace();
}
return categoryList;
}
}