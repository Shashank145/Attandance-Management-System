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

<<html>
 <body>
 
 <pre>
     <pre>


<h1><a href="index.html">Home</a></h1>







     </pre>
 </pre>
 
 <h1 align="center"><a href="Attandance.jsp">Take Attendance Of Another Subject</a></h1>
  <form action="">
  
  
  </form>
 
 
 
 
 </body>


</html>

<%


int i=0;
String is;

/*do
{
	 is=String.valueOf(++i);
   System.out.println(request.getParameter(is));
    
	
}while(request.getParameter(is) !=null);*/



Configuration cfg1=new Configuration();
cfg1.configure("resources/hibernate.cfg.xml");
SessionFactory sf1=cfg1.buildSessionFactory();
Session s1=sf1.openSession();



Configuration cfg2=new Configuration();
cfg2.configure("resources/HibernateAtten.cfg.xml");
SessionFactory sf2=cfg2.buildSessionFactory();
Session s2=sf2.openSession();
org.hibernate.Transaction t=s2.beginTransaction();





Criteria c=s1.createCriteria(PojoForRagis.class);

Projection p0=Projections.property("id");
/*Projection p1=Projections.property("fname");
Projection p2=Projections.property("lname");


ProjectionList pl=	Projections.projectionList();

pl.add(p0);
pl.add(p1);
pl.add(p2);


c.setProjection(pl);

List<Object[]> list= c.list();

for(Object []o:list)
{
	

System.out.println(o[0]);
System.out.println(o[1]);
System.out.println(o[2]);
 

int id=(Integer)o[0];
String fname=(String)o[1];
String lname=(String)o[2];
 is=String.valueOf(++i);
String attStatus= request.getParameter(is);
System.out.println(attStatus);


    s2.save( new PojoForAttendance(id,fname, lname,attStatus,new Date()));
	


}*/

c.setProjection(p0);

String subject= request.getParameter("s1");

  List<Integer> list= c.list();
  for(Integer id:list)
  {
	  System.out.println(id); 
       is=String.valueOf(id);
	  String attStatus= request.getParameter(is);
	  System.out.println(attStatus);
	
		s2.save( new PojoForAttendance( new Date(), attStatus,subject, id));
	  

  }
 
  t.commit();
  s1.close();
  sf1.close();
  s2.close();
  sf2.close();
  
  %>

