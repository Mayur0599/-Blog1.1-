function Post()
{
this.id=0;
this.title="";
this.content="";
this.code="";
this.pic="";
this.date="";
this.cat_id=0;
this.user_id=0;
}

function uploadPost(f)
{
$$$("contentError").html('');   
$$$("titleError").html('');   
if(f.categoryId.selectedIndex==0)
{
alert("Please Select Category Id");
f.categoryId.focus(); 
return false; 
}

var nn=f.title.value; 
if(nn.length==0) 
{ 
$$$("titleError").html('Required title');   
f.title.focus(); 
return false; 
}

var ct=f.content.value; 
if(ct.length==0) 
{ 
$$$("contentError").html('Required content');   
f.content.focus(); 
return false; 
}
return true; 
}

var editStatus=true;
function profileEdit()
{
if(editStatus==false)
{
document.getElementById("edit-btn").innerHTML="Edit Detail";
document.getElementById("profileDetailTable").style="display:block";
document.getElementById("profileEdit").style="display:none";
editStatus=true;
}
else
{
if(editStatus)
{
document.getElementById("edit-btn").innerHTML="Show Detail";
document.getElementById("profileDetailTable").style="display:none";
document.getElementById("profileEdit").style="display:block";
editStatus=false;
}
}
}
function Like()
{
this.id=0;
this.postId=0;
this.userId=0;
}
function doLike(postId,userId)
{
var like=new Like();
like.postId=postId;
like.userId=userId;

$$$.postJSON({
"url":"/Blog/Like",
"success":function(response)
 {
  console.log(response);
 if(response.success)
 { 
      alert("you have been Successfully login...");
 }
if(!response.success)
    {
      
      $$$("loginError").html(response.response);
      return;
    }
 },
 "data":like,
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
