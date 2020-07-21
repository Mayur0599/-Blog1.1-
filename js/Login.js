function User()
{
this.int=0;
this.name="";
this.email="";
this.password="";
this.gender="";
this.about="";
this.registerDate="";
}
function validate()
{
$$$("loginError").html("");
$$$("emailError").html("");
$$$("passwordError").html("");

var email=document.getElementById("emailInput").value;
if(email=="")
{
$$$("emailError").html(" Required Email-id");
return -1;
}

var password=document.getElementById("passwordInput").value;
if(password=="")
{
$$$("passwordError").html(" Required Password");
return -1;
}
return 1;
}
function loginUser()
{
if(validate()==-1)return;
document.getElementById("process").style="display:block";
document.getElementById("login-btn").style="display:none";
var user=new User();
user.email=$$$("emailInput").val();
user.password=$$$("passwordInput").val();
$$$.postJSON({
"url":"/Blog/LoginUser",
"success":function(response)
 {
  console.log(response);
 if(response.success)
 { 
      alert("you have been Successfully login...");
      window.location="profile.jsp";
 }
if(!response.success)
    {
      
      $$$("loginError").html(response.response);
      document.getElementById("process").style="display:none";
      document.getElementById("login-btn").style="display:block";

      return;
    }
 },
 "data":user,
 "exception":function(exception)
 {
  //console.log(exception);
 },
  "failed":function()
 {
  alert("unable to load page due to server issue");
  }
 });
}