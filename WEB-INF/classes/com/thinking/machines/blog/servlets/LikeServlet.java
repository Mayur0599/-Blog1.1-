package com.thinking.machines.blog.servlets;
import com.thinking.machines.blog.beans.*;
import com.thinking.machines.blog.dao.*;
import javax.servlet.http.*;
import com.google.gson.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class LikeServlet extends HttpServlet
{
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
try
{
StringBuilder sb=new StringBuilder();
BufferedReader br=request.getReader();
String line;
while(true)
{
line=br.readLine();
if(line==null)break;
sb.append(line);
} 
String jsonString=sb.toString();
Gson gson=new Gson();
PostLike postLike=(PostLike)gson.fromJson(jsonString,PostLike.class);
System.out.println(jsonString);
System.out.println(postLike);
System.out.println(postLike.getPostId()+","+postLike.getUserId());

/*
Dao userDao=new UserDao(DAOConnection.getConnection());
User validUser=userDao.getUserByEmailAndPassword(user.getEmail(),user.getPassword());
   
   AJAXResponseBean ajaxResponse = new AJAXResponseBean();
   if(validUser!=null)
   {
   ajaxResponse.setResponse("you have like");
   ajaxResponse.setSuccess(true);
   ajaxResponse.setException("");
   }
   else
   {
   ajaxResponse.setResponse("Invalid Credencial");
   ajaxResponse.setSuccess(false);
   ajaxResponse.setException("");    
   }
   response.setContentType("application/json");
   PrintWriter pw=response.getWriter();
   String responseString=gson.toJson(ajaxResponse);
   pw.println(responseString);

*/
   PrintWriter pw=response.getWriter();
   pw.println("");

}catch(Exception e)
{
e.printStackTrace();
}
}
}
