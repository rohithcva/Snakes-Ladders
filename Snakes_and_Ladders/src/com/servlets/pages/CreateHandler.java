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
import javax.websocket.Session;

/**
 * Servlet implementation class CreateHandler
 */
@WebServlet("/CreateHandler")
public class CreateHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateHandler() {
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
		String bpass=request.getParameter("bpass");out.println(bpass);
		int dice=Integer.parseInt(request.getParameter("diceoption"));out.println(dice);
 		/*String h=request.getParameter("");
		out.println(uname);
		out.println("welcome");*/
		int check1;
		String hreq=request.getParameter("color");
		HttpSession session=request.getSession();
		session.setAttribute("userName", uname);
		session.setAttribute("loggedIn","true");
		out.println(hreq);
		String sql="";
		String sql1="";
		try
		{
			Connection conn=null;
		    Statement st=null;
		    PreparedStatement ps=null;
		    ResultSet rs;
	 	    conn=ConnectionManager.getConnection();
	 	    
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
	 
			 		    		out.println("<html><head></head><body onload=\"alert('Board Already Exists')\"></body></html>");
			 		    		RequestDispatcher rd1=request.getRequestDispatcher("create.jsp");  
			 			         rd1.include(request, response);  

					    		break;
					    	}
					    }

	 	    }
	 	    
	 	    catch(Exception e)
	 	    {
	 	    	
	 	    }
	 	    
	 	    	    
 		    sql="insert into game_details values(?,?,?,?)";
 		    sql1="insert into players_temp values(?,?)";
 		    ps=conn.prepareStatement(sql);
			ps.setString(3,uname);
			ps.setString(1,bname);
			ps.setString(2,bpass);
			ps.setInt(4,dice);	
			out.println("sfsfs");
			int check=ps.executeUpdate();
			ps=conn.prepareStatement(sql1);
			ps.setString(1,uname);
			ps.setString(2,bname);
			  check1=ps.executeUpdate();
			out.println("Statement executed"); 
		}
		catch(Exception e)
		{
			out.println(e);
		}
		// TODO Auto-generated method stub
 		response.sendRedirect("Gamechecker.jsp");
	}

}
