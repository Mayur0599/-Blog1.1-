package com.thinking.machines.blog.beans;
public class Post
{
private int id;
private String title;
private String content;
private String code;
private String pic;
private String date;
private int cat_id;
private int user_id;

public Post()
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

public Post(int id,String title,String content,String code,String pic,String date,int cat_id,int user_id)
{
this.id=id;
this.title=title;
this.content=content;
this.code=code;
this.pic=pic;
this.date=date;
this.cat_id=cat_id;
this.user_id=user_id;
}


public Post(String title,String content,String code,String pic,String date,int cat_id,int user_id)
{
this.title=title;
this.content=content;
this.code=code;
this.pic=pic;
this.date=date;
this.cat_id=cat_id;
this.user_id=user_id;
}

public void setId(int id)
{
this.id=id;
}
public int getId()
{
return this.id;
}

public void setTitle(String title)
{
this.title=title;
}
public String getTitle()
{
return this.title;
}

public void setContent(String content)
{
this.content=content;
}
public String getContent()
{
return this.content;
}

public void setCode(String code)
{
this.code=code;
}
public String getCode()
{
return this.code;
}

public void setPic(String pic)
{
this.pic=pic;
}
public String getPic()
{
return this.pic;
}

public void setDate(String date)
{
this.date=date;
}
public String getDate()
{
return this.date;
}

public void setCategoryId(int cat_id)
{
this.cat_id=cat_id;
}
public int getCategoryId()
{
return this.cat_id;
}


public void setUserId(int user_id)
{
this.user_id=user_id;
}
public int getUserId()
{
return this.user_id;
}
}