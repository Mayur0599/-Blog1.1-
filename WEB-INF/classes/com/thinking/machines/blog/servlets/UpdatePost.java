package com.thinking.machines.blog.servlets;
import com.thinking.machines.blog.beans.*;
import com.thinking.machines.blog.dao.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.sql.*;
import java.io.*;

@MultipartConfig(maxFileSize=1024*1024*1024*5)
public class UpdatePost extends HttpServlet
{
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
Post post=null;
try
{
String title=request.getParameter("title");
String content=request.getParameter("content");
String code=request.getParameter("code");
int user_id=Integer.parseInt(request.getParameter("user_id"));
int cat_id=Integer.parseInt(request.getParameter("categoryId"));
String path=getServletContext().getRealPath("");
path=path+"PostImages"+File.separator;
String pic="";

for(Part part:request.getParts())
{
String cd=part.getHeader("content-disposition");
String pcs[]=cd.split(";");
for(String pc:pcs)
{
if(pc.indexOf("filename")!=-1)
{
String fn=pc.substring(pc.indexOf("=")+2,pc.length()-1);
File file=new File(path+user_id+"_"+title+"_"+fn);
if(file.exists()) file.delete();
part.write(path+user_id+"_"+title+"_"+fn);
pic=user_id+"_"+title+"_"+fn;
}
}
}

post=new Post();
post.setTitle(title);
post.setContent(content);
post.setCode(code);
post.setPic(pic);
post.setCategoryId(cat_id);
post.setUserId(user_id);

PostDao postDao =new PostDao(DAOConnection.getConnection());
boolean u=postDao.savePost(post);
HttpSession sess=request.getSession();
if(u)
{
Message m=new Message("Post uploaded Successfully..","success","alert-success");
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