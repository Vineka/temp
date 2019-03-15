<%@page import="com.cognizant.dao.LoginDao"%>
<%@page import="com.cognizant.bean.ProductBean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Page</title>
</head>
<body>
	<%
	try{
		String user=request.getParameter("username");
		LoginDao loginDAO = new LoginDao();
		ProductBean prod = new ProductBean();
		prod.setProduct_id(request.getParameter("product_id"));
		prod.setProduct_name(request.getParameter("product_name"));
		prod.setCategory(request.getParameter("category"));
		prod.setDescription(request.getParameter("description"));
		prod.setPrice(Float.parseFloat(request.getParameter("price")));
		
		int insertStatus = 0;
		insertStatus=loginDAO.insert(prod);
		if (insertStatus == 0) {
			out.println("Error While Inserting the data!!!");
		} else {
			response.sendRedirect("listProducts.jsp");
		}
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	%>
</body>
</html>