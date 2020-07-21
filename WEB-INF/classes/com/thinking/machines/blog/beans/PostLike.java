package com.thinking.machines.blog.beans;
public class PostLike implements java.io.Serializable
{
 private int id;
 private int post_id;
 private int user_id;

//constructor
 public PostLike()
{
 this.id=0;
 this.post_id=0;
 this.user_id=0;
}

//getters & setters 
public void setId(int id)
{
this.id=id;
}
public int getId()
{
return this.id;
}

public void setUserId(int id)
{
this.user_id=user_id;
}
public int getUserId()
{
return this.user_id;
}

public void setPostId(int post_id)
{
this.post_id=id;
}
public int getPostId()
{
return this.post_id;
}
}