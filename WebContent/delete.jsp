<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deletion</title>
<script type="text/javascript">
 function validate() 
 {
  
	alert("Deletion Successful (:"); 
	 
}

</script>
</head>
<body onload=" validate() ">

<pre>


<a href="adminSection.html"><h2 align="left">Goto Admin Section</h2></a>








       <h2 align="center" ><a href="idForDelete.html">Delete another Teacher</a></h2>
</pre>
  <%! int id;
  int flag=0;%>
  <%
   id=Integer.parseInt(request.getParameter("id"));
  
  
   Configuration cfg=new Configuration();
   cfg.configure("resources/HibernateTeacher.cfg.xml");
  
    SessionFactory sf=cfg.buildSessionFactory();
    
    Session s=sf.openSession();
    
   String query="delete from PojoForTeacherAdd where id="+id;
  
   Query q= s.createQuery(query);
    
   q.executeUpdate();
   flag=1;
 
  %>
<%
   if(flag==1)
   {
%>
    
                                    	  <script>
                                    	  alert("Successfully Deleted : " <%=id %>);
                                    
                                    	  </script>
                                    	 

<%
   }

%>
</body>
</html>