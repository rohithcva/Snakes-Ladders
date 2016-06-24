package com.servlets.pages;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginHandler
 */
@WebServlet("/loginHandler")
public class loginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("uname");out.println(uname);
		String upwd=request.getParameter("upwd");out.println(upwd);
		 
 		/*String h=request.getParameter("");
		out.println(uname);
		out.println("welcome");*/
		
 		HttpSession session=request.getSession();
		session.setAttribute("userName", uname);
		session.setAttribute("loggedIn","true");
		session.setAttribute("thrown", "true");
 		String sql="";
		try
		{
			Connection conn=null;
		    Statement st=null;
		    PreparedStatement ps=null;
		    ResultSet rs;
	 	    conn=ConnectionManager.getConnection();
	 	    
	 	    try
	 	    {
	 	    	 //out.println("beforers");

				   st = conn.createStatement();
					 rs = st.executeQuery("select * from reg_details");
					   // out.println("afterrs");
					     
					    while(rs.next())
					    {
						   // out.println("inrs");

					    	String first = rs.getString("username");
					    	out.println(first);
					    	
					    	if(first.equals(uname))
					    	{
					    		String second=rs.getString("password");
					    		if(second.equals(upwd))
					    			
					    		{
					    			
					    			out.println("<html><head></head><body onload=\"alert('Welcome')\"></body></html>");
					    			RequestDispatcher rd1=request.getRequestDispatcher("Home.jsp");  
					    			session.setAttribute("userName", uname);
			 		   		    	session.setAttribute("loggedIn","true");
			 		   			session.setAttribute("thrown", "true");

			 		   		    	rd1.include(request, response);  

					    		break;
					    		
					    		}
					    		else
					    		{
					    			out.println("<html><head></head><body onload=\"alert('Wrong Password')\"></body></html>");
				 		    		RequestDispatcher rd1=request.getRequestDispatcher("Home.jsp");  
				 			        rd1.include(request, response);  
					    		}
					    	}
					    	//else
//				    		{
//				    				out.println("<html><head></head><body onload=\"alert('Wrong Id')\"></body></html>");
//				    				RequestDispatcher rd1=request.getRequestDispatcher("Home.jsp");  
//				    				rd1.include(request, response);  
//				    		}
					    }
 
	 	    }
	 	    
	 	    catch(Exception e)
	 	    {
	 	    	out.println(e);
	 	    }
  		}
		catch(Exception e)
		{
			out.println(e);
		}
 	}
   	  

}
