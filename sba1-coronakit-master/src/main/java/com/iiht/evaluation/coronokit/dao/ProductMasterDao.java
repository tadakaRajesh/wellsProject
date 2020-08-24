package com.iiht.evaluation.coronokit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.iiht.evaluation.coronokit.model.ProductMaster;



public class ProductMasterDao {

	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;

	public ProductMasterDao(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

	protected void connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}
	}

	protected void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
	
	
	public List<ProductMaster> getProducts() throws SQLException
	{
		List<ProductMaster> list= new ArrayList<ProductMaster>();
		connect();
		Statement stmt= this.jdbcConnection.createStatement();
		ResultSet rs=stmt.executeQuery("select * from products");
		while(rs.next()) {
			ProductMaster obj= new ProductMaster(rs.getInt("product_id"), rs.getString("product_name"), rs.getDouble("product_price"), rs.getString("product_desc"));
			list.add(obj);
		}
		rs=null;stmt=null;
		disconnect();
		return list;
		
	}
	
	public void insertProduct(String product_name,String product_desc, String product_price) throws SQLException {
		
		int i=0;
		connect();
		String str="";
		Statement stmt= this.jdbcConnection.createStatement();
		 ResultSet rs=stmt.executeQuery("select max(product_id) from products");
		 if(!(rs.next())) { 
			 str="Insert into products values("+1+",'"+product_name+"','"+product_desc+"','"+product_price+"')";
			 } 
		 else { 
			 i=rs.getInt(1)+1;
			 str="Insert into products values("+i+",'"+product_name+"','"+product_desc+"','"+product_price+"')";
		 }
		stmt.executeUpdate(str);
		rs=null;
		stmt=null;
		disconnect();
		
	}
	
	public void updateProduct(String product_id,String product_name,String product_desc, String product_price) throws SQLException {
		
		connect();
		//String ser="@@ROWCOUNT";
		Statement stmt= this.jdbcConnection.createStatement();
		String str1="update products set product_name='"+product_name+"',"+"product_desc='"+product_desc+"',"+"product_price='"+product_price+"' where product_id="+product_id;
		System.out.println(str1);
		stmt.executeUpdate(str1);
		stmt=null;
		disconnect();
		
	}
	public ProductMaster getARecord(String id) throws SQLException
	{
		ProductMaster pm=null;
		connect();
		Statement stmt= this.jdbcConnection.createStatement();
		ResultSet rs=stmt.executeQuery("select * from products where product_id="+id);
		while(rs.next()) {
			pm= new ProductMaster(rs.getInt("product_id"), rs.getString("product_name"), rs.getDouble("product_price"), rs.getString("product_desc"));
		}
		rs=null;stmt=null;
		disconnect();
		return pm;
		
	}
	
	public void deleteProduct(String product_id) throws SQLException{
		
		connect();
		Statement stmt= this.jdbcConnection.createStatement();
		stmt.executeUpdate("Delete from products where product_id="+product_id);
		stmt=null;
		disconnect();

	}
	 
	 
	// add DAO methods as per requirements
}