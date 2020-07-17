
<%@page import="beans.PojoForTeacherAdd"%>
<%@page import="java.util.Date"%>
<%@page import="beans.PojoForAttendance"%>
<%@page import="java.util.List"%>

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
<title>Entry</title>

 <script type="text/javascript">
   function fun() {
	   alert("Teacher Added Successfully :)");
	
}
 </script>
</head>
<body onload="fun()">


  <%
  
  
	SessionFactory sf;
	 Configuration cfg=new Configuration();
	    cfg.configure("resources/HibernateTeacher.cfg.xml");
	    sf=cfg.buildSessionFactory();

 Session s=sf.openSession();
 org.hibernate.Transaction t=s.beginTransaction();
 

	  
	String fname= request.getParameter("fname");
	String lname= request.getParameter("lname");
	String email= request.getParameter("email");
	String password= request.getParameter("password");
	String cpassword= request.getParameter("cpassword");
	String gender= request.getParameter("r1");
	
	
	
     PojoForTeacherAdd pj=new PojoForTeacherAdd( fname,  lname, email, password,  cpassword, gender);
	//PojoForTeacherAdd  pj=new PojoForTeacherAdd(fname,lname,email,password,cpassword,gender);

	s.save(pj);
	t.commit();
	


	s.close();
	sf.close();
  
  %> 
  <pre>
  
                                            <a href="adminSection.html"><h2 align="left">Goto Admin Section</h2></a>
  
  
  
                                              <a  href="teacherRegistration.html" ><h2 align="center">Add another Teacher Details</h2></a>
                                                                                                                              
</body>
</html>