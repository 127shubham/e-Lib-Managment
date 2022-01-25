<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<%
		String uName= session.getAttribute("um").toString();
		String userType = session.getAttribute("ut").toString();
		
		int ut=Integer.parseInt(userType);
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_Lib_Managment", "root", "root");
			
			PreparedStatement stmt = con.prapareStatement("select * from usermenu where userRole="+ut);
			ResultSet rst = stmt.executeQuery();
			while(rst.next())
			{
				out.println("<a href="+rst.getString("url")+">"+rst.getString("MenuItem")+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			}
		}
			catch(Exception e)
		{
				out.println(e.toString());
			}
		
	%>

</body>
</html>