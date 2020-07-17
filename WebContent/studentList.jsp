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
<title>Attendance Details</title>
</head>
<body>



<%

Configuration cfg1=new Configuration();
cfg1.configure("resources/hibernate.cfg.xml");
SessionFactory sf1=cfg1.buildSessionFactory();
Session s1=sf1.openSession();



Criteria c=s1.createCriteria(PojoForRagis.class);


Projection p0=Projections.property("id");
Projection p1=Projections.property("fname");
Projection p2=Projections.property("lname");





ProjectionList pl=	Projections.projectionList();

pl.add(p0);
pl.add(p1);
pl.add(p2);


c.setProjection(pl);


List<Object[]> list= c.list();
 
%>



<h1 align="center">Teacher List</h1>

<table  border="2px" align="center" cellspacing="0px"  width="700"  cellpadding="5px">


   <tr align="center "><th >Student Id</th><th>Student Name</th></tr>

<%
for(Object []o:list)
{
	%>	

<tr align="center"><td><%=o[0] %></td><td><%= o[1] %>    <%= o[2] %></td></tr>

<%
}

%>

</table>
</body>
</html>