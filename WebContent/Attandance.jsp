<%@page import="java.sql.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance_management","root","");
System.out.println("Connnection Established");
PreparedStatement ps=con.prepareStatement("select id,fname,lname from student_registration");
ResultSet rs=ps.executeQuery();
%>
<form action="AttendanceEntry.jsp" method="get">

  <h1 align="center">SELECT SUBJECT FOR ATTENDANCE</h1>
  <pre>
                                                                                     <select id=s1 name=s1 align="center" >
   <option value="JAVA">JAVA</option>
   <option value="PHP">PHP</option>
   <option value="HIBERNATE">HIBERNATE</option>
   <option value="SPRING">SPRING</option>
   <option value="ANDROID">ANDROID</option>
   <option value="DBMS">DBMS</option>

   </select> 
   </pre> 
<table border="2" cellspacing="0px" align="center"  width="800" cellpadding="5px">
 
 
 
  
 
  <%
  
 
while(rs.next())
	

{
	int i=rs.getInt(1);
%>

<tr><td align="center"><%=i%></td><td align="center"><%=rs.getString(2)%>  <%=rs.getString(3)%></td><td>

 <select id=<%=i %> name=<%=i %> >
             <option value="P">P</option>
              <option value="A">A</option>
           
              </select>
</td></tr>
	
<%}

%>	



</table>

<pre>
        
                                                                                         <input type="submit" value="Submit">
     
 </pre>    
   </form>  
     
     