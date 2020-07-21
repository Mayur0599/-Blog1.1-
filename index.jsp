<%@page import="com.thinking.machines.blog.dao.DAOConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <!-- style -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <link href="css/index.css" rel="stylesheet" type="text/css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Page</title>
    </head>
    <body>
  <%@include file="header.jsp" %>
  <!-- banner -->
  <div class="container-fluid" p=0 m=0>
      <div class="jumbotron primary-background text-white" >
          <div class="container">
          <h3 class="display-4" style="text-align: center">Info-Tech</h3>
          <p>Welcome to world of Programming languages
          A programming language is a formal language comprising a set of instructions that produce various kinds of output.
          Programming languages are used in computer programming to implement algorithms.
          </p>
          <p>
           Thousands of different programming languages have been created, and more are being created every year. 
           Many programming languages are written in an imperative form (i.e., as a sequence of operations to perform) 
           while other languages use the declarative form (i.e. the desired result is specified, not how to achieve it).
          </p>
          <button class="btn btn-outline-light bg-lg">Free Trial <span class="fa fa-bullhorn"></span></button>
          <a href="login.jsp" class="btn btn-outline-light bg-lg"><span class="fa fa-user-circle fa-spin"></span> Login</a>

         </div>
       </div>
  </div>
  <!--card -->
  <div class="container">
      <div class="row mb-2">      
          <div class="col-md-4">
               <div class="card" style="width: 18rem;">
               <div class="card-body">
               <h5 class="card-title">C & Data Structure</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn primary-background text-white">Read more</a>
               </div>
               </div>
          </div>
          <div class="col-md-4">
               <div class="card" style="width: 18rem;">
               <div class="card-body">
               <h5 class="card-title">C++</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn primary-background text-white">Read more</a>
               </div>
               </div>
          </div>
          <div class="col-md-4">
               <div class="card" style="width: 18rem;">
               <div class="card-body">
               <h5 class="card-title">Java Core & Advance</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn primary-background text-white">Read more</a>
               </div>
               </div>
          </div>
     </div>
     <div class="row">      
          <div class="col-md-4">
               <div class="card" style="width: 18rem;">
               <div class="card-body">
               <h5 class="card-title">Python</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn primary-background text-white">Read more</a>
               </div>
               </div>
          </div>
          <div class="col-md-4">
               <div class="card" style="width: 18rem;">
               <div class="card-body">
               <h5 class="card-title">Machine Learning</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn primary-background text-white">Read more</a>
               </div>
               </div>
          </div>
          <div class="col-md-4">
               <div class="card" style="width: 18rem;">
               <div class="card-body">
               <h5 class="card-title">Php</h5>
               <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
               <a href="#" class="btn primary-background text-white">Read more</a>
               </div>
               </div>
          </div>
      </div>
  
  <!-- java script -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
