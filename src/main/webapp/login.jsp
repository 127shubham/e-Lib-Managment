<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.sql.*"
	%>
<!DOCTYPE html>
<html>
<head>
<style></style>
<meta charset="ISO-8859-1">
<title>e-Lib-Management</title>

<script>
	function validateForm() {
		let x = document.forms["form1"]["username"].value;
		let y = document.forms["form1"]["password"].value;
		if (x == "" || y == "") {
			alert("UserName and Password must be filled out");
			return false;
		}
	}
</script>

</head>

<body background="lib.jpg">

<% 
if ("POST".equalsIgnoreCase(request.getMethod())) {
	String uname=request.getParameter("username");
	String pwd=request.getParameter("password");
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_Lib_Managment","root","root");
		PreparedStatement stmt = con.prepareStatement("select*from user where user_name=? and password=? and status=1");
		
		stmt.setString(1,uname);
		stmt.setString(2,pwd);
		ResultSet rs = stmt.executeQuery();
		if(rs.next())
		{
		//	out.println("Valid user, Logged In Successfully");
		//	out.println("Username is "+rs.getString("user_name"));
		//	out.println("UserType is "+rs.getInt("user_type"));
			session.setAttribute("um",uname);
			session.setAttribute("ut",rs.getInt("user_type"));
		
			response.sendRedirect("userHome.jsp");
		}else
		{
			out.println("Invalid Credential, Try again");
		}
	}
	catch(Exception e)
	{
		out.println(e.toString());
	}
}	
else {
	
	%>
	<center>
		<font color="#ffffff"><h1> e-Lib-Managment</h1>
  		<h4>Login here</h4>
   
	<form action="login.jsp" method="post" name ="form1"onsubmit=" return validateForm()">
		  <input type="text" placeholder="username"  required></input>
		  <br><br>
          <input type="password" placeholder="password" requried>
          <br><br><br>
	      <input type="submit" value="Login"></input>
          <input type="reset" value="Cancel"></input>
	 </form>
</center>
	 <%
}
%>



</body>
</html>