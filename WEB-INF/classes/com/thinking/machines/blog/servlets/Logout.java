package com.thinking.machines.blog.servlets;
import com.thinking.machines.blog.beans.*;
import com.thinking.machines.blog.dao.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

public class Logout extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
{
try
{
   HttpSession sess=request.getSession();
   sess.removeAttribute("currentUser");
   Message m=new Message("Logged out Successfully..","success","alert-success");
   sess.setAttribute("Message",m);                              
   response.sendRedirect("/Blog/login.jsp");
}catch(Exception e)
{
e.printStackTrace();
}
}
}
