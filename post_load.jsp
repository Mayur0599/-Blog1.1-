<%@page import="com.thinking.machines.blog.beans.*" %>
<%@page import="com.thinking.machines.blog.dao.*" %>
<%@page import="java.util.*" %>
<div class="row">
<%
Thread.sleep(250);
User user=(User)session.getAttribute("currentUser");
int catId=Integer.parseInt(request.getParameter("cid"));
PostDao postDao=new PostDao(DAOConnection.getConnection());
ArrayList<Post> postList=null;
if(catId==0)
{
postList=postDao.getAllPost(); 
}
else
{
postList=postDao.getPostByCategoryIdAndUserId(catId,user.getId()); 
}
if(postList.size()==0)
{
out.println("<h4>No Post Found..!</h4>");
return;
}
for(Post post:postList)
{
%>
<div class="col-md-6 mt-2">
 <div class="card">
 <div class="card-header">
  <img class="card-img-top" src="/Blog/PostImages/<%=post.getPic()%>" style="width:100px" alt="card img cap">
  </div>
  <div class="card-body">
  <b><%=post.getTitle()%></b>
  <p><%=post.getContent()%></p>
  </div>
  <div class="card-footer text-right">
  <a href="#" class="btn btn-outline-primary btn-sm" onclick="doLike(<%=post.getId()%>,<%=user.getId()%>)"><i class="fa fa-thumbs-o-up"></i><span> 0</span></a>
  <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span> 0</span></a>
  <a href="/Blog/show_post.jsp?post_id=<%=post.getId()%>" class="btn btn-outline-primary btn-sm">Read More..</a>
  </div>
 </div>
</div>
<%
}
%>