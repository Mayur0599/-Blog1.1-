package com.thinking.machines.blog.beans;
public class Category
{
private int id;
private String name;
private String description;

public Category()
{
this.id=0;
this.name="";
this.description="";
}

public Category(int id,String name,String description)
{
this.id=id;
this.name=name;
this.description=description;
}


public Category(String name,String description)
{
this.name=name;
this.description=description;
}

public void setId(int id)
{
this.id=id;
}
public int getId()
{
return this.id;
}

public void setName(String name)
{
this.name=name;
}
public String getName()
{
return this.name;
}

public void setDescription(String description)
{
this.description=description;
}
public String getDescription()
{
return this.description;
}

}