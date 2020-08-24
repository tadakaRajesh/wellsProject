package com.iiht.evaluation.coronokit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iiht.evaluation.coronokit.dao.ProductMasterDao;
import com.iiht.evaluation.coronokit.model.ProductMaster; 

@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductMasterDao productMasterDao;
	
	
	public void setProductMasterDao(ProductMasterDao productMasterDao) {
		this.productMasterDao = productMasterDao;
	}

	public void init(ServletConfig config) {
		String jdbcURL = config.getServletContext().getInitParameter("jdbcUrl");
		String jdbcUsername = config.getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = config.getServletContext().getInitParameter("jdbcPassword");

		this.productMasterDao = new ProductMasterDao(jdbcURL, jdbcUsername, jdbcPassword);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action =  request.getParameter("action");
		String viewName = "";
		try {
			switch (action) {
			case "login" : 
				viewName = adminLogin(request, response);
				break;
			case "newproduct":
				viewName = showNewProductForm(request, response);
				break;
			case "insertproduct":
				viewName = insertProduct(request, response);
				break;
			case "deleteproduct":
				viewName = deleteProduct(request, response);
				break;
			case "editproduct":
				viewName = showEditProductForm(request, response);
				break;
			case "updateproduct":
				viewName = updateProduct(request, response);
				break;
			case "list":
				viewName = listAllProducts(request, response);
				break;	
			case "logout":
				viewName = adminLogout(request, response);
				break;	
			default : viewName = "notfound.jsp"; break;		
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		RequestDispatcher dispatch = 
					request.getRequestDispatcher(viewName);
		dispatch.forward(request, response);
		
		
	}

	private String adminLogout(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "";
	}

	private String listAllProducts(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		List<ProductMaster> productlist=this.productMasterDao.getProducts();
		request.setAttribute("list", productlist);
		return "listproducts.jsp";
	}

	private String updateProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		String product_id=request.getParameter("id");
		String product_name=request.getParameter("product_name");
		String product_desc=request.getParameter("product_desc");
		String product_price=request.getParameter("product_price");
		this.productMasterDao.updateProduct(product_id, product_name, product_desc, product_price);
		return listAllProducts(request, response);
	}

	private String showEditProductForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		
		String id= request.getParameter("id");
		ProductMaster pm=this.productMasterDao.getARecord(id);
		request.setAttribute("record", pm);
		return "editproduct.jsp";
	}

	private String deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		String product_id=request.getParameter("id");
		this.productMasterDao.deleteProduct(product_id);
		return listAllProducts(request, response);
	}

	private String insertProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		String product_name=request.getParameter("product_name");
		String product_desc=request.getParameter("product_desc");
		String product_price=request.getParameter("product_price");
		this.productMasterDao.insertProduct(product_name, product_desc, product_price);
		return listAllProducts(request, response);
	}

	private String showNewProductForm(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "newproduct.jsp";
	}

	private String adminLogin(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		String uname=request.getParameter("loginid");
		String pass=request.getParameter("password");
		if(uname.equals("admin") && pass.equals("admin"))
		{
			return listAllProducts(request, response);
		}
		else
			return "index.jsp";
	}

	
}