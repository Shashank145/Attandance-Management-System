
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head> 
<meta charset="ISO-8859-1">

  <style type="text/css">
   #left
   {
    // height:300px;
	// width:300px;
	// border:1px solid black;

     margin-top: 100px;
     margin-left: 200px;
     
   
   
   }
   
     #right
     {
   //  height:200px;
	// width:200px;
	// border:1px solid black;

     margin-top: 20px;
     margin-left: 420px;
     
   
   
   }
  
  
  </style>


<title>Insert title here</title>
</head>
<body >
<pre>
 

     <h1><a href="index.html">Home</a></h1>
</pre>




 <form action="Validate.jsp" name="fa" method="get" >
 
 
 
                                   <div id="left">
   
                                      User Id<br>
              
                                     <input type="text " name="userid"><br>
            
                                     Password<br>
              
                                     <input type="password" name="password" ><br><br>
                                     
                                   
                                  
                                    		
                                    
                                     
                                    
                                           <input type="submit" name="submit" value="LOGIN">   <a href="regitration.html">SIGN UP HERE</a>
   
                                    </div>
                                    
                                    
                                    <div id="right">
                                       
                                          <a href="forgot.jsp"> Forgot Password ?</a>
                                    
                                    </div>

  </form>
</body>
</html>