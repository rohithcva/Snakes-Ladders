package com.servlets.pages;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class regHandler
 */
@WebServlet("/Form_Servlet")
public class Form_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Form_Servlet() {
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
		
		PrintWriter out=response.getWriter();
		//out.println("Hello");
		String usid=request.getParameter("usid");  out.println(usid);
		String usname=request.getParameter("usname");   out.println(usname);
  		String ufname=request.getParameter("ufname").trim(); out.println(ufname);
  		String uadd=request.getParameter("uadd").trim();out.println(uadd);
 		String email=request.getParameter("uemail").trim(); out.println(email);
 		String uphno=request.getParameter("uphno").trim();out.println(uphno);
 		String ssc=request.getParameter("ussc").trim();out.println(ssc);
 		
		
		int check=0;
		String sql="";
		try 
		{
			Connection conn=null;
		    Statement st=null;
		    PreparedStatement ps=null;
		     conn=ConnectionManager.getConnection();
		     
		     sql="select * from sforms";
		    ResultSet rs = st.executeQuery(sql);
			 while(rs.next())
			 {
		        String first = rs.getString("sid");
		        if(first.equalsIgnoreCase(usid))
		        {
		        	out.println("id exists");
		        	 response.sendRedirect("http://localhost:10000/Snakes_and_Ladders/form_final.html");
		        }		
		        else
		        {
		        	 
		 		    out.println("beforesql");
		 		       //sql="use snakes_ladders";
		 		    sql="insert into sforms values(?,?,?,?,?,?,?)";
		 			//st.executeQuery(sql);
		 			out.println("Statement executed"); 
		 			// st = conn.createStatement();
		 			ps=conn.prepareStatement(sql);
		  			ps.setString(1,usid);
		 			ps.setString(2,usname);
		 			ps.setString(3,ufname);
		 			ps.setString(4,uadd);
		 			ps.setString(5,email);
		 			ps.setString(6,uphno);
		 			ps.setString(7,ssc);
		 		    out.println("sfsfs");
		        }
	 
 	 	      }
		      rs.close();
		    
		    
			 conn.close();
			 st.close();
		} 
		catch (SQLException e1) 
		{
			// TODO Auto-generated catch block
			out.println("e1");
			e1.printStackTrace();
		}
		 
 		
 	}

}
