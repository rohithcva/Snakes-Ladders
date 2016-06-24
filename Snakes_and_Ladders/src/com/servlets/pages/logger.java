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
 * Servlet implementation class logger
 */
@WebServlet("/logger")
public class logger extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logger() {
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
			String uname=request.getParameter("login");//out.println(uname);
			String upwd=request.getParameter("password"); 
			String sql="";
	 		HttpSession session=request.getSession();

			try
			{
				Connection conn=null;
			    Statement st=null;
			    PreparedStatement ps=null;
			    ResultSet rs;
		 	    conn=ConnectionManager.getConnection();		 	    
		 	    try
		 	    {
					   st = conn.createStatement();
						 rs = st.executeQuery("select * from log_details");
 						     
						    while(rs.next())
						    {
							   // out.println("inrs");

						    	String first = rs.getString("uname");
						    	
						    	if(first.equals(uname))
						    	{
						    		String second=rs.getString("pwd");
						    		if(second.equals(upwd))
						    			
						    		{
								    	out.println("Hello "+first);

						    			session.setAttribute("uname", uname);
						    			out.println("<html><head></head><body onload=\"alert('Welcome')\"></body></html>");
						    			RequestDispatcher rd1=request.getRequestDispatcher("movie.jsp");  
 
				 		   		    	rd1.include(request, response);  

						    		break;
						    		
						    		}
						    		else
						    		{
						    			out.println("<html><head></head><body onload=\"alert('Wrong Password')\"></body></html>");
					 		    		RequestDispatcher rd1=request.getRequestDispatcher("homelogger.html");  
					 			        rd1.include(request, response);  
						    		}
						    	}
						    	else
					    		{
					    				out.println("<html><head></head><body onload=\"alert('Wrong Id')\"></body></html>");
					    				RequestDispatcher rd1=request.getRequestDispatcher("homelogger.html");  
					    				rd1.include(request, response);  
					    		}
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
