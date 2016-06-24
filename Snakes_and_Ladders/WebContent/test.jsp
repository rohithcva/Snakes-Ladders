 <%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%@page import="com.servlets.pages.ConnectionManager"%>

<html><body> 
 
  </body></html> 
<% 
 /*
 try
 {
        Connection conn=null;
		Statement st=null;	    
	    conn=ConnectionManager.getConnection();
   	      st = conn.createStatement();
 	      ResultSet rs ;
 	      rs= st.executeQuery(" select * from coin_pos");
 	      String first=null;
 	 	 while(rs.next())
	 	 {
 	 	 	 first = rs.getString("srow");
   	 	    out.println("val in val is :"+first);	 
 	        if(first!=null)
 	    	 {
 	     		out.println("In first");
 	     		try
 	     		{
 	     		 	 	 	 int rval=12;
 	     		
 	     			String sql="UPDATE coin_pos set srow="+rval+", scol="+rval+", srow1="+rval+", scol1="+rval+" where flag=0";
 	     			st=conn.createStatement();
 	     			st.executeUpdate(sql);
 	     		}
 	     		catch(Exception e)
 	     		{
 	     			out.println(e);
 	     		}
 	     		
 	     	}
 	        	  
	  }
	  
	  rs.close();
	    
  
 }
 
 catch(Exception e)
 {
 
 	out.println("IN exception "+e);
 }
    
      /*out.println(sroww);
 	if(sroww=="0")
 	{
 		String sql="update coin_pos SET srow='12' where srow='0'";
 		st.executeUpdate(sql);
 	
 	}
 */
 
 
 
 
 
 
 
 
 
 
 
%>