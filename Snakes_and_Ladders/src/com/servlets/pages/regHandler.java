package com.servlets.pages;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

import java.sql.*;

/**
 * Servlet implementation class regHandler
 */
@WebServlet("/regHandler")
public class regHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public regHandler() {
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
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		PrintWriter out=response.getWriter();
	    response.setContentType("text/html");

		String uname=request.getParameter("uname");out.println(uname);
		String upwd=request.getParameter("upwd").trim(); out.println(upwd);
 		String ufname=request.getParameter("ufname").trim(); out.println(ufname);
  		String ulname=request.getParameter("ulname").trim(); out.println(ulname);
		String email=request.getParameter("uemail").trim(); out.println(email);
		String dob=request.getParameter("birth").trim(); out.println(dob);
		String sq=request.getParameter("usq").trim();  out.println(sq);
		out.println("heeeee");
		String usaws=request.getParameter("sansw").trim();
		out.println(usaws);
		int check=0;
		String sql="";
		try 
		{
			Connection conn=null;
		    Statement st=null;
		    PreparedStatement ps=null;
		    ResultSet rs;
	 

		     conn=ConnectionManager.getConnection();
		    out.println("beforesql");
		       //sql="use snakes_ladders";
		    

		    try
		    {
			    out.println("beforers");

			   st = conn.createStatement();
				 rs = st.executeQuery("select * from reg_details");
				    out.println("afterrs");

				    while(rs.next())
				    {
					    out.println("inrs");

				    	String first = rs.getString("username");
				    	out.println(first);
				    	if(first.equals(uname))
				    	{
 
		 		    		out.println("<html><head></head><body onload=\"alert('Username Already Exists')\"></body></html>");
		 		    		RequestDispatcher rd1=request.getRequestDispatcher("reg.jsp");  
		 			         rd1.include(request, response);  

				    		break;
				    	}
				    }

		    }
		    catch(Exception e)
		    {
		    	System.out.println("wafsfdffdfdsdfs");
		    }
		    	
		    
		       sql="insert into reg_details values(?,?,?,?,?,?,?)";
 			
 			ps=conn.prepareStatement(sql);
 			ps.setString(1,uname);
			ps.setString(2,upwd);
			ps.setString(3,ufname);
			ps.setString(4,ulname);
			ps.setString(5,email);
			ps.setString(6,sq);
			ps.setString(7,usaws);
		    out.println("sfsfs");
		    check=ps.executeUpdate();
		    out.println("Statement executed"); 
		    response.setContentType("text/html");
		  

		    if(check!=0)
			{
		    	RequestDispatcher rd=request.getRequestDispatcher("reg.jsp");  
		         rd.include(request, response);  
			}
			
			 conn.close();
			 st.close();
		} 
		catch (SQLException e1) 
		{
			// TODO Auto-generated catch block
			out.println("Bix");
			e1.printStackTrace();
		}
		 
	     
		response.sendRedirect("Home.jsp");
 	}

}
