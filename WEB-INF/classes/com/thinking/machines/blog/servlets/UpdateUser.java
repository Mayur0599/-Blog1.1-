package com.thinking.machines.blog.servlets;
import com.thinking.machines.blog.beans.*;
import com.thinking.machines.blog.dao.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.sql.*;
import java.io.*;

@MultipartConfig(maxFileSize=1024*1024*1024*5)
public class UpdateUser extends HttpServlet
{
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
try
{
int id=Integer.parseInt(request.getParameter("id"));
String email=request.getParameter("email");
String name=request.getParameter("name");
String password=request.getParameter("password");
String about=request.getParameter("about");

String path=getServletContext().getRealPath("");
String userpath=getServletContext().getRealPath("");

path=path+"images"+File.separator;
//userpath=path+"images"+File.separator;

for(Part part:request.getParts())
{
String cd=part.getHeader("content-disposition");
String pcs[]=cd.split(";");
for(String pc:pcs)
{
if(pc.indexOf("filename")!=-1)
{
String fn=pc.substring(pc.indexOf("=")+2,pc.length()-1);
File file=new File(path+id+".png");
if(file.exists()) file.delete();
part.write(path+id+".png");

}
}
}

User user=new User();
user.setId(id);
user.setName(name);
user.setEmail(email);
user.setAbout(about);
user.setPassword(password);
user.setProfile(id+".png");

UserDao userDao =new UserDao(DAOConnection.getConnection());
User u=userDao.updateUser(user);
HttpSession sess=request.getSession();
if(u!=null)
{
sess.setAttribute("currentUser",u);
Message m=new Message("Profile Detail Updated..","success","alert-success");
sess.setAttribute("Message",m);                              
}
else
{
Message m=new Message("Something went Wrong..!","error","alert-danger");
sess.setAttribute("Message",m);                              
}
response.sendRedirect("/Blog/profile.jsp");
}catch(Exception e)
{
e.printStackTrace();
}
}
}