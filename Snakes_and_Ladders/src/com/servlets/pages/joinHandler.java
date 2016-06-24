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

/**
 * Servlet implementation class joinHandler
 */
@WebServlet("/joinHandler")
public class joinHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinHandler() {
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
		String bname=request.getParameter("bname");out.println(bname);
	
		try
		{
			Connection conn=null;
		    Statement st=null;
		    PreparedStatement ps=null;
		    ResultSet rs;
	 	    conn=ConnectionManager.getConnection();
	 	    String sql="";
	 	    int flag=0;
	 	    try
	 	    {
	 	    	 out.println("beforers");

				   st = conn.createStatement();
					 rs = st.executeQuery("select * from game_details");
					    out.println("afterrs");
					    while(rs.next())
					    {
						    out.println("inrs");
					    	String first = rs.getString("game_name");
					    	out.println(first);
					    	if(first.equals(bname))
					    	{ 
	 
			 		 		    sql="insert into players_temp values(?,?)";
			 		 		    ps=conn.prepareStatement(sql);
			 		 		    ps.setString(1,uname);
			 					ps.setString(2,bname);
			 					int check1=ps.executeUpdate();
			 					out.println("Statement executed");	
			 					flag=1;
			 		    		out.println("<html><head></head><body onload=\"alert('Welcomet to Game !!')\"></body></html>");
			 		    		RequestDispatcher rd1=request.getRequestDispatcher("Gamechecker.jsp");  
			 			         rd1.include(request, response);  
					    		break;
					    	}
					    }
					    if(flag==0)
					    {
				 			response.sendRedirect("blank.jsp");

					    }
 	 	    }
 	 	    catch(Exception e)
	 	    {
	 	    	out.println(e);
	 			response.sendRedirect("blank.jsp");

	 	    }
	 	    
 		}
		catch(Exception e)
		{
			out.println(e);
 			response.sendRedirect("blank.jsp");

		}
		// TODO Auto-generated method stub
	 
 
		
 	}

}
