package com.thinking.machines.blog.beans;

public class Message
{
private String message;
private String type;
private String css;

public Message()
{
this.message="";
this.type="";
this.css="";
}

public Message(String message,String type,String css)
{
this.message=message;
this.type=type;
this.css=css;
}

public void setMessage(String message)
{
this.message=message;
}
public String getMessage()
{
return this.message;
}

public void setType(String type)
{
this.type=type;
}
public String getType()
{
return this.type;
}

public void setCss(String css)
{
this.css=css;
}
public String getCss()
{
return this.css;
}
}
