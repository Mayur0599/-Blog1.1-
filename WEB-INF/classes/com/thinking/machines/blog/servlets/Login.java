package com.thinking.machines.blog.servlets;
import com.thinking.machines.blog.beans.*;
import com.thinking.machines.blog.dao.*;
import javax.servlet.http.*;
import com.google.gson.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class Login extends HttpServlet
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
User user=(User)gson.fromJson(jsonString,User.class);
System.out.println(user.getId());
UserDao userDao=new UserDao(DAOConnection.getConnection());
User validUser=userDao.getUserByEmailAndPassword(user.getEmail(),user.getPassword());
   
  HttpSession sess=request.getSession();      
   AJAXResponseBean ajaxResponse = new AJAXResponseBean();
   if(validUser!=null)
   {
   sess.setAttribute("currentUser",validUser);
   ajaxResponse.setResponse(validUser);
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

}catch(Exception e)
{
e.printStackTrace();
}
}
}
