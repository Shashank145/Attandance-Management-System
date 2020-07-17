<%@page import="beans.PojoForTeacherAdd"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.criterion.Criterion"%>
<%@page import="java.util.Date"%>
<%@page import="beans.PojoForAttendance"%>
<%@page import="java.util.List"%>
<%@page import="beans.PojoForRagis"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.sql.*"%>

<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.criterion.Projection"%>
<%@page import="org.hibernate.criterion.ProjectionList"%>
<%@page import="org.hibernate.criterion.Projections"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Details</title>
</head>
<body>

<%!String subject; 
int userid;
 %>

<%
userid=Integer.parseInt((String)session.getAttribute("userid1"));
session.getAttribute("password1");
System.out.println(userid);
%>

<%

Configuration cfg1=new Configuration();
cfg1.configure("resources/hibernate.cfg.xml");
SessionFactory sf1=cfg1.buildSessionFactory();
Session s1=sf1.openSession();



Criteria c=s1.createCriteria(PojoForRagis.class);

Criterion cr=Restrictions.eq("id", userid);


c.add(cr);

PojoForRagis pt=(PojoForRagis)c.uniqueResult();


 
%>



<h1 align="center">Teacher Profile</h1>

<table  border="2px" align="center"  cellspacing="0px"  width="800" height="100" cellpadding="5px">


 <tr align="center" bgcolor="green"><td>Id</td><td>First Name</td><td>Last Name</td><td>Email</td><td>Gender</td></tr>


    <tr align="center"><td><%=pt.getId() %></td><td><%=pt.getFname() %></td><td><%=pt.getLname() %></td><td><%=pt.getEmail() %></td><td><%=pt.getGender() %></td></tr>


</table>

<h2 align="center"><a href="student.jsp">Back</a></h2>
</body>
</html>