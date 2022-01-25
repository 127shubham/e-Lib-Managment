<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@ include file="userHome.jsp" %>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_Lib_Managment", "root", "root");

	PreparedStatement stmt = con.prepareStatement("select * from books");

	

	ResultSet rst = stmt.executeQuery();
	
	out.println("<table border='1'><tr><th>Book Id</th>");
	
	out.println("<th>Title</th><th>Author</th><th>Publication</th>");
	out.println("<th>Price</th><th>Edition</th></tr>");
	
	while (rst.next()) {
		
	
		out.println("<tr><td>"+rst.getString("book_id")+"</td><td>"+rst.getString("title")+"</td>");
		
		out.println("<td>"+rst.getString("author")+"</td><td>"+rst.getString("Publication")+"</td>");
		
		out.println("<td>"+rst.getString("Price")+"</td><td>"+rst.getString("Edition")+"</td></tr>");
		
	}
	out.println("</table>");

	}
	catch(Exception e)
	{
	out.println(e.toString());
	}

%>
</body>
</html>