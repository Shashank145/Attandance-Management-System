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
<title>Insert title here</title>
</head>





<%!
  String[] subject={"JAVA","PHP","HIBERNATE","SPRING","ANDROID","DBMS"};

 Long[] total=new Long[6];
 Long[] present=new Long[6];
 Long[] absent=new Long[6];
 
 float totalper=0;
 int totallec=0;
 int totalp=0;
 int totalab=0;
 int userid;
%>


<body>

<h1 align="center">Attendance Datails</h1>

  <%
  
    userid=Integer.parseInt((String)session.getAttribute("userid1"));
  	Configuration cfg1=new Configuration();
    cfg1.configure("resources/HibernateAtten.cfg.xml");
    SessionFactory sf1=cfg1.buildSessionFactory();
   
  	 Session s1=sf1.openSession();

  	      Projection p1=Projections.rowCount();

    	  Criteria c1=s1.createCriteria(PojoForAttendance.class);
    	  Criterion cr1=Restrictions.eq("Subject", subject[0]);
    	  Criterion cr11=Restrictions.eq("id", userid);
    	  c1.add(cr11);
    	  c1.setProjection(p1);
    	  c1.add(cr1);
      	  total[0]=(Long) c1.uniqueResult();
      	  
      	  Criterion cr111=Restrictions.eq("attStatus", "P");
      	  c1.add(cr111);
      	  present[0]=(Long)c1.uniqueResult();
      	  
      	  absent[0]=total[0]-present[0];
    	  
    	  Criteria c2=s1.createCriteria(PojoForAttendance.class);
    	  Criterion cr2=Restrictions.eq("Subject", subject[1]);
    	  Criterion cr22=Restrictions.eq("id", userid);
    	  c2.add(cr22);
    	  c2.setProjection(p1); 
   	      c2.add(cr2);
   	       total[1]=(Long) c2.uniqueResult(); 
   	       
   	      Criterion cr222=Restrictions.eq("attStatus", "P");
    	  c2.add(cr222);
    	  present[1]=(Long)c2.uniqueResult();
   	      
    	  absent[1]=total[1]-present[1];
    	  
   	      Criteria c3=s1.createCriteria(PojoForAttendance.class);
  	      Criterion cr3=Restrictions.eq("Subject", subject[2]);
  	      Criterion cr33=Restrictions.eq("id", userid);
  	      c3.add(cr33);
  	      c3.setProjection(p1); 
 	      c3.add(cr3);
 	      total[2]=(Long) c3.uniqueResult(); 
 	      
 	      Criterion cr333=Restrictions.eq("attStatus", "P");
     	  c3.add(cr333);
     	  present[2]=(Long)c3.uniqueResult();
 	      
          absent[2]=total[2]-present[2];
     	  
 	      Criteria c4=s1.createCriteria(PojoForAttendance.class);
   	      Criterion cr4=Restrictions.eq("Subject", subject[3]);
   	      Criterion cr44=Restrictions.eq("id", userid);
 	      c4.add(cr44);
     	  c4.setProjection(p1); 
  	      c4.add(cr4);
  	      total[3]=(Long) c4.uniqueResult(); 
  	       
  	      Criterion cr444=Restrictions.eq("attStatus", "P");
    	  c4.add(cr444);
    	  present[3]=(Long)c4.uniqueResult();
    	  
    	  absent[3]=total[3]-present[3];
  	      
  	      Criteria c5=s1.createCriteria(PojoForAttendance.class);
 	      Criterion cr5=Restrictions.eq("Subject", subject[4]);
 	      Criterion cr55=Restrictions.eq("id", userid);
   	      c5.add(cr55);
   	      c5.setProjection(p1); 
	      c5.add(cr5);
	      total[4]=(Long) c5.uniqueResult(); 
	      
	      Criterion cr555=Restrictions.eq("attStatus", "P");
      	  c5.add(cr555);
      	  present[4]=(Long)c5.uniqueResult();
	      
      	  absent[4]=total[4]-present[4];
      	  
	      Criteria c6=s1.createCriteria(PojoForAttendance.class);
   	      Criterion cr6=Restrictions.eq("Subject", subject[5]);
   	      Criterion cr66=Restrictions.eq("id", userid);
 	      c6.add(cr66);
     	  c6.setProjection(p1); 
  	      c6.add(cr6);
  	      total[5]=(Long) c6.uniqueResult(); 
  	      
  	      Criterion cr666=Restrictions.eq("attStatus", "P");
    	  c6.add(cr666);
    	  present[5]=(Long)c6.uniqueResult();
    	  
    	  absent[5]=total[5]-present[5];
      	  //  c.setProjection(Projections.rowCount()).uniqueResult();
      	     
      	   
      	
      	    
      	     
      	   
  	//System.out.println(c.uniqueResult() + "  " + i);
  %>
  
  <form action="attenDetail.jsp" method="get">

    <table  border="2px" align="center" cellspacing="0px"  width="600" height="300" cellpadding="5px">
    

    
     <tr align="center" ><td>Subject Name</td><td>No. of Lecture</td><td>Present</td><td>Absent</td><td>Percentage</td></tr>

   	<%
   	  for(int i=0;i<subject.length;i++)
   	  {
   		float total1=(float)total[i];
   		totallec=totallec+(int)total1;
   		
   		
   		float present2=(float)present[i];
   		totalp=totalp+(int)present2;
     float per=(present2*100)/total1;
     
       totalab=totalab+(int)(float)absent[i];
     
      totalper=totalper+per;
   	%>
   	    
   	
  	   <tr align="center" ><td> <button name="subject" type="submit" value=<%=subject[i] %>><%=subject[i] %></button></td><td><%= total[i] %></td><td><%= present[i] %></td><td><%=absent[i] %></td><td><%=per %> %</td></tr>
   	  
   	
   	<%	  
   		  
   	  }
   	
   	
   	%>
   	<tr align="center" ><th>Total</th> <td><%= totallec%></td><td><%=totalp %></td><td><%= totalab%></td><td><%=totalper/6%></td></tr>
  
   	<tr><th colspan="5">Total Percentage = <%=totalper/6 %> %</th></tr>
   	
   	 	<%totalper=0;
   	 	totallec=0;
   	    totalp=0;
   	 totalab=0;
   	 	%>
</table>
</form>
</body>
</html>