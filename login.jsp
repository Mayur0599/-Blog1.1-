<%@page import="com.thinking.machines.blog.beans.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>  
   <!-- style -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <link href="css/index.css" rel="stylesheet" type="text/css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include file="header.jsp" %>
        <main class="d-flex align-items-center " style="height:500px">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card" >
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-circle fa-2x"></span>
                                <p>Login Page</p>
                            </div>
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
                            <div class="card-body">
                                <form>
                                
                                <div class="form-group">
                                <span id="loginError" style="color:red"></span></br>
                                 <label for="InputEmail1">Email address</label>
                                <input type="email" class="form-control" id="emailInput" name="email" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                <span id="emailError" style="color:red"></span>
                               </div>
 
                               <div class="form-group">
                                <label for="InputPassword1">Password</label>
                                <input type="password" class="form-control" id="passwordInput" name="password" placeholder="Password">
                               <span id="passwordError" style="color:red"></span>
                               </div>


                              <div class="form-group text-center" id="process" style="display:none">
                              <span class="fa fa-refresh fa-spin fa-1x "></span>                 
                              <h4 style="color:red">Processing ....</h4>
                              </div>                               
                                
                             <div id="login-btn" class="container text-center">
                                <button type="button" class="btn btn-primary" onclick="loginUser()">Login</button>
                              </div>
                             </form>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </main>
        
      <!-- java script -->
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="/Blog/js/Login.js" crossorigin="anonymous"></script>
     <script src="/Blog/js/MyJsLib.js" crossorigin="anonymous"></script>

    </body>
</html>
