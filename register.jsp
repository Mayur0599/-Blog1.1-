<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-up Page</title>
   <!-- style -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <link href="css/index.css" rel="stylesheet" type="text/css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
         <%@include file="header.jsp"%>
        <main class="d-flex align-items-center " style="height:650px">           
            <div class="container">
                <div class="col-md-6 offset-md-3" >
                    <div class="card">
                        <div class="card-header  primary-background text-center text-white">
                            <span class="fa fa-user-plus fa-2x"></span>
                            <p> Register</p>
                        </div>
                       <div class="card-body">
                        <form id="register-form"  method="post">

                        <div class="form-group">
                        <label for="InputName">User Name</label>
                        <input type="text" class="form-control" id="nameInput" name="name" placeholder="User Name">
                        <span id="nameError" style="color:red"></span>
                        </div>

                        <div class="form-group">
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
     
                        <div class="form-group">
                        <label for="gender">Select Gender : </label>
                        Male <input type="radio"  id="maleInput" name="gender" value="male">
                        Female <input type="radio"  id="femaleInput" name="gender" value="female">
                        </div>

                        <div class="form-group">
                        <textarea name="about" id="aboutInput" class="form-control" placeholder="Write about you..!"></textarea>
                        <span id="aboutError" style="color:red"></span>
                        </div>

                        <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="Check1" name="check" value="Yes">
                        <label class="form-check-label" for="exampleCheck1">Terms & condition</label>
                        </div>

                        <div class="form-group text-center" id="process" style="display:none">
                        <span class="fa fa-refresh fa-spin fa-2x "></span>                 
                        <h4>Processing ....</h4>
                        </div>

                        <div class="form-group" id="registerbtn" >
                        <button type="button" class="btn btn-primary" onclick="registerUser()">Submit</button>
                        </div>
                        </form>                            
                       </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- java script -->
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="/Blog/js/Register.js" crossorigin="anonymous"></script>
     <script src="/Blog/js/MyJsLib.js" crossorigin="anonymous"></script>
    </body>
</html>
