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
$$$("nameError").html("");
$$$("emailError").html("");
$$$("passwordError").html("");
$$$("aboutError").html("");

var name=document.getElementById("nameInput").value;
if(name=="")
{
$$$("nameError").html("Required Name ");
return -1;
}

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

if(!document.getElementById("maleInput").checked && !document.getElementById("femaleInput").checked)
{
alert("Select Gender");
return -1;
}

var about=document.getElementById("aboutInput").value;
if(about=="")
{
$$$("aboutError").html(" Required About");
return -1;
}
return 1
}
function registerUser()
{
if(validate()==-1)return;
if(!document.getElementById("Check1").checked)
{
alert("Please check Terms & Conditions..!");
return;
}
else
{
document.getElementById("process").style="display:block";
document.getElementById("registerbtn").style="display:none";
var user=new User();
user.name=$$$("nameInput").val();
user.email=$$$("emailInput").val();
user.password=$$$("passwordInput").val();
if(document.getElementById("maleInput").checked)
{
user.gender=$$$("maleInput").val();
}
else
{
user.gender=$$$("femaleInput").val();
}
user.about=$$$("aboutInput").val();
$$$.postJSON({
"url":"/Blog/RegisterUser",
"success":function(response)
 {
 if(response.success)
 { 
      alert(response.response);
      window.location="login.jsp";
 }
 else
 {
      alert(response.response);
      document.getElementById("process").style="display:none";
      document.getElementById("registerbtn").style="display:block";  
      return;
 }
 },
 "data":user,
 "exception":function(exception)
 {
  alert(exception);
 },
  "failed":function()
 {
  alert("unable to load page due to server issue");
  }
});
}
}