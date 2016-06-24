<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.servlets.pages.Snake_ladders_jdbc"%>
<%@page import="com.servlets.pages.ConnectionManager"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
 <%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.sql.*" %>

  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <body>



<%

   
   try
	{
		Connection conn=null;
		Statement st=null;
	   
	    
	    conn=ConnectionManager.getConnection();
 	    
 	    //out.println(";;;;-++++++sdffdsfsd....;;;\n");
 	      st = conn.createStatement();
 	      ResultSet rs = st.executeQuery(" select count(pname) from players_temp");
	  //  out.println("\n;;;;*/*/*/*/**/**;;;\n");
	  while(rs.next())
	  {
	  	
	  	String first = rs.getString("count(pname)");
 	    
 	     int val=Integer.parseInt(first);
 	     
 	    out.println("val in val break is is :"+val);	 
 	     
 	     if(val>1)
 	     {
 	     	out.println("");
 	     	out.println("<html><head></head><body onload=\"alert('Game Starts :')\"></body></html>");
			RequestDispatcher rd1=request.getRequestDispatcher("Gamechecker.jsp");  
			rd1.include(request, response);  
 	     	
 	     }
 	     else
 	     {%>
 	     <img src="wait.png" width="208" height="198" alt="wait" />
<img src="wait1.png" width="378" height="325" alt="wait1" />
 	     	  
 	     	  
 	     	  <% response.setIntHeader("Refresh", 5);
 	     	
 	     }
 	        	  
	  }
	    
	     
	}
	catch(Exception e)
	{
		
		
		out.println("IN Exception :"+e);
	}
 

 %>
</body>

</html>



 