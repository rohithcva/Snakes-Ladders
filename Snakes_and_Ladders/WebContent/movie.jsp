<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="com.servlets.pages.Snake_ladders_jdbc"%>
<%@page import="com.servlets.pages.ConnectionManager"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.sql.*" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to MsitImdb</title>
</head>

<script type="text/javascript">

function myfunc()
{
	//alert("Hellooo");
	 
<%

%>	
	 	
}
			
</script>

<body>

	<br>
	
		This is it !!! 
	</br>
	
	
<div  style="alignment-adjust:central">
<form action="movie.jsp">
  <br>
  Enter the movie name to check
 <input type="text" value="" name="movie" id="movie"/>
 
 
<br />
<br />
	
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="submit" onclick="return myfunc()" />



<%
	if(request.getParameter("submit")!=null)
	{
		//out.println("@@@@");
		
		try
		{
			Connection conn=null;
			Statement st=null;	    
	    	conn=ConnectionManager.getConnection();
 	    
 	    	//out.println(";;;;-++++++sdffdsfsd....;;;\n");
 	        st = conn.createStatement();
 	        ResultSet rs = st.executeQuery("select movie from movie_db");
 	     // out.println(" erewrrew");
 	    while(rs.next())
	   {
	  		int val=0;
	  		String first = rs.getString("movie");
  	    	String moviee=request.getParameter("movie");  
    	     if(first.equals(moviee))
  		     {
  	     	    out.println("\n\n ");
  	     	    out.println("Dear  "+session.getAttribute("uname")+"  Movie found");  
  	    	 }
  	    	 else
  	    	 {
  	   				out.println("Movie not found ");
  	    	 }
 	        	  
	  }
	    
	     
	}
	catch(Exception e)
	{
		
		
		out.println("IN Exception :"+e);
	}
 
		
	
	}


 %>
</br>
 </form>
</div>
 	
</body>


</html>