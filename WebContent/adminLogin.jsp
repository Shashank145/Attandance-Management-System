<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">

  function validate() {
	  
	  var userid=document.f.userid.value;
	  var password=document.f.password.value;
	  
	  if(userid=="admin" && password=="admin")
		  {
		  
		   return true;
		  }
	  else
		  {
		  alert("Please Enter a Valid Userid & password ");
		  return false;
		  document.f.userid.focus;
		  }
		
	}
	



</script>



</head>
<body>

  
 <form action="adminSection.html" name="f" onsubmit=" return validate()">
  <pre>
                                                               <h1 align="center">Admin Login</h1>
                                                               
                                                               
                                                                 UserId     : <input type="text" name="userid">
      
                                                                 Password   : <input type="password" name="password">
        
                                                                                   <input type="submit" value="Login"">
  
  
  </pre>

  
  
</form>
</body>
</html>