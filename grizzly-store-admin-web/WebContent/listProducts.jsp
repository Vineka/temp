<!Doctype html>
<%@ page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.cognizant.dao.LoginDao"%>
<%@page import="com.cognizant.bean.LoginBean"%>
<%@page import="com.cognizant.bean.ProductBean"%>
<html>

<head>
<link rel="Stylesheet" href="styles\styles.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Admin-List Products</title>
<meta charset="utf-8">
</head>

<body>
	<%-- <%HttpSession ses=request.getSession();
	out.println(ses.getAttribute("username"));
	%> --%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="top-nav">
			<span class="name">GRIZZLY</span>&nbsp;&nbsp;&nbsp; <img id="img1"
				src="images\Capture.JPG" alt="logo" /> &nbsp;&nbsp;&nbsp; <span
				class="name">STORE<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" class="search" placeholder="Search"
					name="search2"><i class="fa fa-search"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<a class="notification"> <i class='fas fa-bell'
						style='font-size: 20px; color: grey; position: relative; left: 500px;'></i>
						<span class="badge"> </span>
				</a> <%
 	try {
 		HttpSession ses = request.getSession();
 		LoginDao deptDAO = new LoginDao();
 		LoginBean emp = deptDAO.read(ses.getAttribute("username").toString());
 %> <span style="margin-left: 550px;">Welcome, <%=emp.getUsername()%>
				</span> <a href="index.html"> <input class="logot" type="submit"
						name="logout" value="Logout" />
				</a>
	</nav>

	<section>
		<nav>
			<a class="profile">PROFILE</a> <a href="#" class="edit">Edit</a>

		</nav>
		<img src="images\logo.jfif" class="prf-img" alt="...">
		<article class="article">
			</br>
			<h3 align="center"><%=emp.getUsername()%></h3>
			</br>
			<table align="center">
				<tr>
					<td align="center">
						<h6>ID</h6>
					</td>
				</tr>
				<tr>
					<td align="center">
						<p><%=emp.getId()%></p>
					</td>
				</tr>
				<tr>
					<td align="center">
						<h6>Designation</h6>
					</td>
				</tr>
				<tr>
					<td align="center">
						<p><%=emp.getDesignation()%></p>
					</td>
				</tr>
				<tr>
					<td align="center">
						<h6>Office</h6>
					</td>
				</tr>
				<tr>
					<td align="center">
						<p><%=emp.getOffice()%></p>
					</td>
				</tr>
				<%
					} catch (Exception e) {
						out.println(e.getMessage());
						e.printStackTrace();
					}
				%>
			</table>
		</article>
	</section>
	<section class="tab" class="container-fluid">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">PRODUCTS</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				aria-selected="false">VENDORS</a></li>
		</ul>
		<section class="productlist">

			<form method="get" action="">

				<select style="text-align: center;" class="actionlist">
					<option>Choose Action
					<option value="Internet Explorer">Internet Explorer
					<option value="Firefox">Firefox
					<option value="Chrome">Chrome
					<option value="Opera">Opera
					<option value="Safari">Safari
				</select>&nbsp;&nbsp;&nbsp; <input type="text" class="actionlist"
					style="width: 250px; color: black;" placeholder="Category Name"
					name="cate-search"><i class="fa fa-search"></i>&nbsp;&nbsp;&nbsp;

				<select class="actionlist">
					<option>Sort By</option>
					<option value="Time">Time
					<option value="Name">Name
					<option value="Date">Date
				</select>
				<button type="button" class="actionlist" onclick="location.href='addProduct.jsp'"
					style="float: right; width: 200px; height: 40px; background-color: black; color: white;">Add
					Product</button>
			</form>

			<div class="scrollbar scrollbar-primary">
				<div class="force-overflow">
					
					<%
						try {
							LoginDao lDAO = new LoginDao();
							List<ProductBean> prodList = new ArrayList<ProductBean>();
							prodList = lDAO.readALL();
							
					%>
					<form>
						<table id="pro-list-table" class="table">
							<thead>
								<tr id="clr">
									<th><label>Products List</label></th>
									<th><label>Brand</label></th>
									<th><label>Category</label></th>
									<th><label id="rating">Rating</label></th>
									<th style="border-right: 0px;"></th>
								</tr>
							</thead>
							<%
								for (ProductBean prod : prodList) {
							%>
							<tr>
								<td class="round"><input type="checkbox" id="checkbox" />
									<label for="checkbox"></label> <span style="margin-left: 10px;"><%=prod.getProduct_name()%></span>
								</td>
								<td><%=prod.getBrand()%></td>
								<td><%=prod.getCategory()%></td>
								<td id="rating"><%=prod.getRating()%></td>
								<td style="border-right: 0px;">
								<input class="op" type="button" onclick="location.href='viewProduct.jsp?product_name=<%=prod.getProduct_name()%>'" name="view" value="View">
								<input class="op" type="button" name="logout" value="Block">
								<input class="op" type="button" onclick="location.href='remove.jsp?product_name=<%=prod.getProduct_name() %>'" name="logout" value="Remove">
								</td>

							</tr>
							<%--  <tr>
               <td class="round"><input type="checkbox" id="checkbox" /><label for="checkbox"></label><span style="margin-left: 10px ; ">Shaver</span></td>
                <td>Braun</td>
                <td>Personal Care</td>
                <td id="rating">4.8</td>
                <td style="border-right: 0px;">
                    <input class="op" type="submit" name="view" value="View">
                    <input class="op" type="submit" name="logout" value="Block">
                    <input class="op" type="submit" name="logout" value="Remove"></td>
            </tr>
            <tr>
               <td class="round"><input type="checkbox" id="checkbox" /><label for="checkbox"></label><span style="margin-left: 10px ; ">Macbook Pro</span></td>
                <td>Apple</td>
                <td>Laptops</td>
                <td id="rating">4.9</td>
                <td style="border-right: 0px;">
                    <input class="op" type="submit" name="view" value="View">
                    <input class="op" type="submit" name="logout" value="Block">
                    <input class="op" type="submit" name="logout" value="Remove"></td>
            </tr>
            <tr>
                <td class="round"><input type="checkbox" id="checkbox" /><label for="checkbox"></label><span style="margin-left: 10px ; ">iMac 27"</span></td>
                <td>Apple</td>
                <td>Laptops</td>
                <td id="rating">4.6</td>
                <td style="border-right: 0px;">
                    <input class="op" type="submit" name="view" value="View">
                    <input class="op" type="submit" name="logout" value="Block">
                    <input class="op" type="submit" name="logout" value="Remove"></td>
            </tr>
            <tr>
                <td class="round"><input type="checkbox" id="checkbox" /><label for="checkbox"></label><span style="margin-left: 10px ; ">Micron Pens</span></td>
                <td>Sakura Pigma</td>
                <td>Art Supplies</td>
                <td id="rating">4.1</td>
                <td style="border-right: 0px;">
                    <input class="op" type="submit" name="view" value="View">
                    <input class="op" type="submit" name="logout" value="Block">
                    <input class="op" type="submit" name="logout" value="Remove"></td>
            </tr>
            <tr>
                <td class="round"><input type="checkbox" id="checkbox" /><label for="checkbox"></label><span style="margin-left: 10px ; ">Paint Markers</span></td>
                <td>Copic</td>
                <td>Art Supplies</td>
                <td id="rating">4.2</td>
                <td style="border-right: 0px;">
                    <input class="op" type="submit" name="view" value="View">
                    <input class="op" type="submit" name="logout" value="Block">
                    <input class="op" type="submit" name="logout" value="Remove"></td>
            </tr>--%>
							<%
								}
								} catch (Exception e) {
									out.println(e.getMessage());
								}
							%>

						</table>
					</form>
				</div>
			</div>



		</section>
	</section>

</body>

</html>