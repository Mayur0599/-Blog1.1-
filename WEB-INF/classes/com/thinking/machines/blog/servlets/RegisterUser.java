package com.thinking.machines.blog.servlets;
import com.thinking.machines.blog.beans.*;
import com.thinking.machines.blog.dao.*;
import javax.servlet.http.*;
import com.google.gson.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class RegisterUser extends HttpServlet
{
 public void  doPost(HttpServletRequest request,HttpServletResponse response)
 {
  try
  {
    BufferedReader br=request.getReader();
    StringBuilder sb=new StringBuilder();
    String line;
    while(true)
    {
     line=br.readLine();
     if(line==null)break;
     sb.append(line);
    }
   String jsonString=sb.toString();    
   Gson gson=new Gson();
   User user=(User)gson.fromJson(jsonString,User.class);  
    
   UserDao userDao=new UserDao(DAOConnection.getConnection());
   boolean ok=userDao.saveUser(user);   
   AJAXResponseBean ajaxResponse = new AJAXResponseBean();
   if(ok)
   {
   ajaxResponse.setResponse("You have Register Successfully..!");
   ajaxResponse.setSuccess(true);
   ajaxResponse.setException("");
   }
   else
   {
   ajaxResponse.setResponse("Something Went Wrong!");
   ajaxResponse.setSuccess(false);
   ajaxResponse.setException("");    
   }
   response.setContentType("application/json");
   PrintWriter pw=response.getWriter();
   String responseString=gson.toJson(ajaxResponse);
   pw.println(responseString);
  }
  catch(Exception e)
  {
   e.printStackTrace(); 
  }
 }
}