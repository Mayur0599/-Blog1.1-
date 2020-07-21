<%@page import="com.thinking.machines.blog.beans.*" %>
<%@page import="com.thinking.machines.blog.dao.*" %>
<%@page import="java.util.*" %>
<%@page errorPage="error.jsp" %>
<%
int postId=0;
Post post=null;
User user=(User)session.getAttribute("currentUser");
if(user==null)response.sendRedirect("login.jsp");
else
{
postId=Integer.parseInt(request.getParameter("post_id"));
PostDao postDao=new PostDao(DAOConnection.getConnection());
post=postDao.getPostById(postId);
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>  
   <!-- style -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <link href="css/index.css" rel="stylesheet" type="text/css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   </head>
    <body>
<!--Navbar-->
   <nav class="navbar navbar-expand-lg navbar-light primary-background">
      <a class="navbar-brand" href="#"><span class="fa fa-asterisk"></span> Info-Tech</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="index.jsp"> <span class="fa fa-institution"></span> Home <span class="sr-only">(current)</span></a>
      </li>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="fa fa-book"> Category
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">C & Data Structure</a>
          <a class="dropdown-item" href="#">C++</a>
          <a class="dropdown-item" href="#">Java</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">IOT</a>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-address-book"> Contact</a>
      </li>

      <li class="nav-item">
        <a class="nav-link enabled" href="#" data-toggle="modal" data-target="#postModal"><i class="fa fa-upload"></i> Post</a>
      </li>
    </ul>
    <ul class="navbar-nav mr-right">
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#profileModal"><span class="fa fa-user-circle"><%= user.getName()%></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/Blog/LogoutUser"><span class="fa fa-user-plus"> Logout</a>
      </li> 
   </ul>
  </div>
</nav>
<!--NavbarEnds-->
<!--Message-->
                            <%
                             Message m=(Message)session.getAttribute("Message");
                            if(m!=null)
                            {
                            %>
                           
                           <div class="alert <%= m.getCss()%>" role="alert">
                            <%= m.getMessage()%> 
                            </div>
                            
                           <%
                              session.removeAttribute("Message");
                             }  
                            %>
<!--Ends-->
<!--Main-body-Start-->
<main>
 <div class="Container text-center" >
  <div  class="row my-4">
   <div class="col-md-6 offset-md-3">
     <div class="card">
      <div class="card-header primary-background text-white">
      <h4><%=post.getTitle()%></h4>
      </div>
      <div class="card-body" >
       <img class="card-img-top" src="/Blog/PostImages/<%=post.getPic()%>" style="width:100px" alt="<%=post.getPic()%>">
       <h4><%=post.getContent()%></h4></br>
       <h3><code><pre><%=post.getCode()%></pre></code></h3>    
      </div>
      <div class="card-footer ">
      <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span> 0</span></a>
      <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span> 0</span></a>
      <a href="/Blog/profile.jsp" class="btn btn-outline-primary btn-sm">Show Post</a>
      </div>
     </div>
   </div>
  </div>
 </div>
</main>
<!--Main-body-Ends-->

<!--detail modal-->
<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">Profile Detail</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
        <img  src="/Blog/images/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width:150px;"></br>
        <h4><%= user.getName()%></h4>
    <div id="profileDetailTable">
    <table class="table">
      <tbody>
       <tr>
        <th scope="row">Id</th>
        <td><%= user.getId()%></td>
        </tr>
         <tr>
          <th scope="row">Email</th>
          <td><%= user.getEmail()%></td>
        </tr>
        <tr>
         <th scope="row">Gender</th>
         <td><%= user.getGender().toUpperCase()%></td>
         </tr>
        <tr>
         <th scope="row">Status</th>
         <td><%= user.getAbout()%></td>
         </tr>
        <tr>
         <th scope="row">Registration-Date</th>
         <td><%= user.getRegistrationDate()%></td>
         </tr>
        </tbody>
        </table>
       </div>

 <!--profileEditStart-->
  <div id="profileEdit" style="display:none">
  <h4><i>Edit Detail</i></h4>
  <form class="form-group" action="/Blog/UpdateUser" method="post" enctype="multipart/form-data">
  <table class="table">
  <tr>
        <td scope="row">Id</td>
        <td><%= user.getId()%></td>
        <td><input type="hidden" name="id" class="form-control" value="<%= user.getId()%>"></td>
  </tr>
  <tr>
        <td scope="row">Name</td>
        <td><input type="text" name="name" class="form-control" value="<%= user.getName()%>"></td>
  </tr>
  <tr>
        <td scope="row">Password</td>
        <td><input type="text" name="password" class="form-control" value="<%= user.getPassword()%>"></td>
  </tr>
  <tr>
        <td scope="row">Email</td>
        <td><input type="email" name="email" class="form-control" value="<%= user.getEmail()%>"></td>
  </tr>
  <tr>
        <td scope="row">About</td>
        <td><textarea  name="about" class="form-control" ><%= user.getAbout()%></textarea></td>
  </tr>
  <tr>
        <td scope="row">UpdatePic</td>
        <td><input type="file" name="image" class="form-control" ></td>
  </tr>
  </table>
 <div class="container text-center">
        <button type="submit" class="btn btn-success" >Save</button>
 </div>
  </form>
  </div>
   <!--profileEditEnd-->

    </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-btn" type="button" class="btn btn-primary" onclick="profileEdit()">Edit Datail</button>
      </div>
    </div>
  </div>
</div>
<!--detail Model ends-->


<!--PostModel-->
<div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="postModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background">
        <h5 class="modal-title " id="postModalLabel">New Post</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form class="form-group" action="/Blog/UpdatePost" method="post" enctype="multipart/form-data" onsubmit='return uploadPost(this)'>

       <div class="form-group">
       <input class="form-control" type="hidden" name="user_id" value="<%=user.getId()%>" >
       </div>

       <div class="form-group">
       <select class="form-control" id="categoryId" name="categoryId">
       <option value=-1 checked disable>&lt;--Select Category--&gt;</option>
       <%
        CategoryDao categoryDao=new CategoryDao(DAOConnection.getConnection());  
        ArrayList<Category> categoryList=categoryDao.getAllCategories(); 

        for(Category c:categoryList)
        {
       %>
       <option value=<%=c.getId()%>><%=c.getName()%></option>
        <%
        }
       %>
       </select>
       </div>

       <div class="form-group">
       <input class="form-control" type="text" name="title" id="titleInput" placeholder="Enter Post Title">
       <span id="titleError" style="color:red"></span>
       </div>

       <div class="form-group">
       <textarea class="form-control" style="height:100px"  id="contentInput" name="content" placeholder="Enter your Post Content"></textarea>
       <span id="contentError" style="color:red"></span>
       </div>

       <div class="form-group">
       <textarea class="form-control" style="height:100px" id="codeInput" name="code" placeholder="Enter your sourcecode {if any}"></textarea>
       </div>

       <div class="form-group">
       <label class="form-control">Upload File</label>
       <input class="form-control" type="file" name="file">
       </div>
        <button type="submit" class="btn btn-primary" >Upload Post</button>
       </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!--Post-ModelEnd-->

      <!-- java script -->
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="/Blog/js/MyJsLib.js" crossorigin="anonymous"></script>
     <script src="/Blog/js/profile.js" crossorigin="anonymous"></script>
     <script src="/Blog/js/jquery.js" crossorigin="anonymous"></script>

    </body>
</html>
