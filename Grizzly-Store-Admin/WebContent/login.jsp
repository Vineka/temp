<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.cognizant.dao.LoginDao"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%! static int count=0; %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/test";
	Connection conn = DriverManager.getConnection(url, "root", "root");
	try{
	
		String user = request.getParameter("username");
		
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from login_details where username='"+user+"'");
	 int flag=0;
		if (rs.next()) {
			flag=1;
		     HttpSession ses=request.getSession();
		     ses.setAttribute("username",user);
			response.sendRedirect("addProduct.jsp?username='"+user+"'");
		}
		if(count>=3 ||(flag==0 && count==2))
		{PreparedStatement pstmt = conn.prepareStatement("update login_details set status=? where username=?");
		pstmt.setString (1,"lock");
		pstmt.setString (2,user);
		int status1=0;
		status1=pstmt.executeUpdate();
		pstmt.close();
		out.println("<marquee>YOUR ACCOUNT IS LOCKED</marquee>");
		}
		if(flag==0 && count<3){count+=1;
		out.println(count+" status");   
		response.sendRedirect("index.html");
		     
		}

		rs.close();
		st.close();
		conn.close();

	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	%>
		
</body>

</html>