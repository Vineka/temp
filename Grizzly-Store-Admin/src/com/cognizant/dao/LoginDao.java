package com.cognizant.dao;
import java.sql.Date;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
 //to throw exception



import com.cognizant.bean.ProductBean;
import com.cognizant.bean.LoginBean;
public class LoginDao{
	
		public static Connection Connect() throws Exception {
			Connection conn = null;
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test";
			conn = DriverManager.getConnection(url, "root", "root");
			return conn;
		}
		public LoginBean read(String Username) throws Exception {
			LoginBean deptList =new LoginBean();
			Connection conn = Connect();
			String readQuery = "select username,id,designation,office from login_details where username='"+Username+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(readQuery);
			while(rs.next()) {
				deptList.setUsername(rs.getString(1));
				deptList.setId(rs.getString(2));
				deptList.setDesignation(rs.getString(3));
				deptList.setOffice(rs.getString(4));
			}
			return deptList;
		}
		public int insert(ProductBean prod) throws Exception{
			Connection conn=Connect();
			String insertQuery = "insert into product(product_id,category,product_name,description,price) values(?,?,?,?,?)";
		
				PreparedStatement pstmt= conn.prepareStatement(insertQuery);
				pstmt.setString(1,prod.getProduct_id());
				pstmt.setString(2, prod.getCategory());
				pstmt.setString(3, prod.getProduct_name());
				pstmt.setString(4, prod.getDescription());
				pstmt.setFloat(5, prod.getPrice());
		
				
			
				int insertStatus=0;
				insertStatus = pstmt.executeUpdate();
			return insertStatus;
		}
		public List<ProductBean> readALL() throws Exception{
			List<ProductBean> ProdList=new ArrayList<ProductBean>();
			Connection conn=Connect();
			String readQuery = "select product_name,brand,category,rating from product";
			Statement stmt= conn.createStatement();
			ResultSet rs=stmt.executeQuery(readQuery);
			while(rs.next()) {
				ProductBean prod=new ProductBean();
				prod.setProduct_name(rs.getString(1));
				prod.setBrand(rs.getString(2));
				prod.setCategory(rs.getString(3));
				prod.setRating(rs.getFloat(4));
				ProdList.add(prod);
			}	
			return ProdList;
		}
		public ProductBean readProd(String pname) throws Exception {
			ProductBean deptList =new ProductBean();
			Connection conn = Connect();
			String readQuery = "select product_name,rating,brand,price,description from product where product_name='"+pname+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(readQuery);
			while(rs.next()) {
				deptList.setProduct_name(rs.getString(1));
				deptList.setRating(rs.getFloat(2));
				deptList.setBrand(rs.getString(3));
				deptList.setPrice(rs.getFloat(4));
				deptList.setDescription(rs.getString(5));
			}
			return deptList;
		}
		public int delete(String pname) throws Exception {
			Connection conn=Connect();
			String deleteQuery = "delete from product where product_name='"+pname+"'";
			Statement stmt= conn.createStatement();
			int delStatus=0;
			delStatus = stmt.executeUpdate(deleteQuery);
		return delStatus;
		}
	}

