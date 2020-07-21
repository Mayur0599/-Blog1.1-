package com.thinking.machines.blog.beans;
public class User  implements java.io.Serializable
{
 private int id;
 private String name;
 private String password;
 private String email;
 private String gender;
 private String about;
 private String registration_date;
 private String profile;

//constructor
 public User()
{
 this.id=0;
 this.name="";
 this.password="";
 this.email="";
 this.gender="";
 this.about="";
 this.registration_date="";
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

public void setName(String name)
{
 this.name=name;
}
public String getName()
{
return this.name;
}

public void setPassword(String password)
{
 this.password=password;
}
public String getPassword()
{
return this.password;
}

public void setEmail(String email)
{
 this.email=email;
}
public String getEmail()
{
return this.email;
}

public void setGender(String gender)
{
 this.gender=gender;
}
public String getGender()
{
return this.gender;
}

public void setAbout(String about)
{
 this.about=about;
}
public String getAbout()
{
return this.about;
}

public void setRegistrationDate(String registration_date)
{
this.registration_date=registration_date;
}
public String getRegistrationDate()
{
return this.registration_date;
}

public void setProfile(String profile)
{
this.profile=profile;
}
public String getProfile()
{
return this.profile;
}
}