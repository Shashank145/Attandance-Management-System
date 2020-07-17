<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wrong Details</title>
</head>
<body>
<pre>


<h1><a href="index.html">Home</a></h1>








       <h2 align="center" ><a href="Tlogin.html">Again Enter UserId & Password </a></h2>
</pre>
<%

 String userid=request.getParameter("userid");
 String password=request.getParameter("password") ;
 
 

 session.setAttribute("userid2", userid);
 session.setAttribute("password2", password);
 



%>
<%
		String id=request.getParameter("userid");
		String pass=request.getParameter("password");

                                        Class.forName("com.mysql.jdbc.Driver");
                                         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance_management","root","");
                                         System.out.println("Connnection Established");
                                         PreparedStatement ps=con.prepareStatement("select id, email,password from teacher_list");
                                         ResultSet rs=ps.executeQuery();
                                         int flag=1;
                                       
                                      while(rs.next())
                                      {
                                    	  
                                    	String did=  String.valueOf(rs.getInt(1));
                                    	String email=rs.getString(2);
                                    	String dpass=rs.getString(3);
										if((did.equals(id) || email.equals(id)) && dpass.equals(pass))
										{
											flag=0;
										response.sendRedirect("teacherlogin.html");	
											
										}
										                        	  
                                    	  
                                      }
                                      
                                      if(flag==1)
                                      {
                                    	  
                                    	  %>
                                    	  
                                    	  
                                    	  <script>
                                    	  alert("Please Enter a valid Id & password");
                                    
                                    	 
                                    	 
                                    	  </script>
                                    	 
                                    	
                                    	  
                                    	  
                                    	  <%
                                    	  
                                    	  
                                      }
%>
</body>
</html>