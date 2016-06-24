<%@page import="javax.websocket.Session"%>
<%@page import="com.servlets.pages.Snake_ladders_jdbc"%>
<%@page import="com.servlets.pages.ConnectionManager"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.sql.*" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 <%@ page session="true"%>
 
<%
	String thrown=(String)session.getAttribute("thrown");
	String session_username=(String)session.getAttribute("userName");		

 %>

<%
	try
	{
		Connection conn=null;
		Statement st=null;	    
	    conn=ConnectionManager.getConnection();
 	    
 	    //out.println(";;;;-++++++sdffdsfsd....;;;\n");
 	      st = conn.createStatement();
 	      ResultSet rs = st.executeQuery(" select count(pname) from players_temp");
 	  while(rs.next())
	  {
	  	int val=0;
	  	String first = rs.getString("count(pname)");
  	      val=Integer.parseInt(first);
  	     out.println("val in val is : "+val);	 
  	     if(val<2)
 	     {
 	    	 //out.println("  mbjhbmnjnmnknknjknkjnkjnk");
			/*RequestDispatcher rd1=request.getRequestDispatcher("break.jsp");  
			 out.println("<html><head></head><body onload=\"alert('Wait for game to start :')\"></body></html>");
 			rd1.include(request, response);  */
 			String site = new String("break.jsp");
  		    response.setStatus(response.SC_MOVED_TEMPORARILY);
 			response.setHeader("Location", site);
  			  
  	     }
 	        	  
	  }
	    
	     
	}
	catch(Exception e)
	{
		
		
		out.println("IN Exception :"+e);
	}
 
 %>



<%!
String flag=null;
String srow=null,srow1=null;
String  scol=null,scol1=null;
String diceValue="0";
int iDiceValue=0,pointer=0;
int rows=0,rows1=0;
int cols=0,cols1=0;
int dice=0,flags;

 %>
  
  
<%
try
{
	Connection conn=null;
	Statement st=null;	    
	conn=ConnectionManager.getConnection();
 	st = conn.createStatement();
 	ResultSet rs = st.executeQuery("select * from coin_pos");
 	while(rs.next())
 	{
 		srow= rs.getString("srow");
 		scol= rs.getString("scol");
 		srow1=rs.getString("srow1");
 		scol1=rs.getString("scol1");
 		flag=rs.getString("flag");
  	}
	/*srow=session.getAttribute("srow").toString();
	scol=session.getAttribute("scol").toString();
	srow1=session.getAttribute("srow1").toString();
	scol1=session.getAttribute("scol1").toString();
	flag=session.getAttribute("flag").toString();*/
}

catch(Exception e)
{
	srow="10";
	scol="0";
	srow1="10";
	scol1="0";
	flag="0";

}
rows=Integer.parseInt(srow);
cols=Integer.parseInt(scol);
rows1=Integer.parseInt(srow1);
cols1=Integer.parseInt(scol1);
flags=Integer.parseInt(flag);
pointer=rows;
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
body,td,th 
{
	font-family: andalus;
	 
}
body 
{
	background-color: #DFD;
}

#board
{
	background-repeat:no-repeat;
	
}
</style>
 
 
 
 
</head>

<body>
<p>
<div id="header" style="height:15%;width:100%;">

<div style="float:left">
<img src="titl1.jpg" width="328" height="154" alt="title" style="margin-left:15%;margin-top:5%"/>

<div>
   <a href="Home.jsp">
  <p><img src="BUTTONS/button (2).png" width="129" height="41" alt="home" /></>
  <a href="create.jsp">
  <img src="BUTTONS/button (1).png" width="142" height="42" alt="create" /></a>
  <a href="blank.jsp">
  <img src="BUTTONS/button (4).png" width="131" height="42" alt="join" /></a></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="reg.jsp"><img src="BUTTONS/button (3).png" width="143" height="41" alt="register" /></a>
<a href="contact.jsp"><img src="BUTTONS/button (5).png" width="139" height="39" alt="contact" /></p></a>
</div>

<div>
<br />
<br />
<br />
<br />
<p>



</p>
<p>Score

<%!
public static int generaterandom()
{
int max=6;
int rnd =(int)(Math.random()*(max + 1));

            if (rnd == 0)
            {
                rnd = 1;
            }
        return rnd;	
}

 %>


 <%
  if(request.getParameter("Roll_Dice")!=null)
  {  
 	  dice= generaterandom(); 
 	  //dice=2;
 	  out.println("Dice Rolled \n");
 	  out.println(dice);
 	  out.println("rows="+rows);
 	  out.println("cols="+cols);
 	  out.println("rows="+rows1);
 	  out.println("cols="+cols1);
 	  
  } 
 %>
 
 <form action="Gamechecker.jsp">
   <label for="hiddentext"></label>
  <input type="hidden" name="hiddentext" id="hiddentext1" />
 <%
  if(flags==0)
 	{
  		out.println("PLayer Turn ");
  		session.setAttribute("thrown","false");
 	}
 	else
 	{
 		//out.println("Player 2 Turn ");
 		session.setAttribute("thrown","true");		
  	}
 
%> 
<%
	if(session.getAttribute("thrown")=="false")
	{
 %>
      <input name="Roll_Dice" type="submit" value="SUbmit" onclick="rollfunc()" value="refresh"/>
      
<%}  
	else
	{	
 %>
      <input name="Roll_Dice" type="submit" value="SUbmit" onclick="rollfunc()" disabled="disabled"/>
 <%
 }
 %>


<%
 /*String site = new String("Gamechecker.jsp");
  		      response.setStatus(response.SC_MOVED_TEMPORARILY);
 			  response.setHeader("Location", site); */
 
 %>



<%/*
 <c:choose>
 	<c:set var="svalue" scope="session" value=session.getAttribute("thrown")/>
 	
    <c:when test="${svalue==false}">
      <input name="Roll_Dice" type="submit" value="SUbmit" onclick="rollfunc()"/>
    
     </c:when>
    
    <c:otherwise>
            <input name="Roll_Dice" type="submit" value="SUbmit"  disabled="disabled"/>
       
    </c:otherwise>
</c:choose>
 		
  */%>		
 		
 		
  
   
 <p>
 
 </p>
  
  
</p>
</form>
</div>
</div>	
<div>
<div name="board" style="float:right"> 
 <TABLE width="704px" height="580px" border="1" background="rsz_1snakes-and-ladders-board-printable-i2.jpg" style="background-repeat:no-repeat;margin-left:0%;float:top;">

<%
 
if(flags==0)
{
 
	int temp=0;
	{

		if(rows==1)
		{
	
			if(cols<dice)
			{
				//rethrow;
			}
			else if(cols-dice==0)
			{
				out.println("Game Over");
				rows=1;
				cols=10;
			}
			else
			{
				cols=cols-dice;
				rows=1;
			}
		}
		else if(rows%2==0)
		{
		//out.println("In if row mod 2 ");

			if(cols+dice>10)
			{
				int tempos=10-cols;
				dice=dice-tempos;
				cols=10;
				cols=cols-dice+1;
				rows--;
 			}
			else
			{
				cols+=dice;
			}
		}
		else
		{
			out.println("In Else ");
			if(cols-dice<0)
			{
    		    out.println("Asfsffsdfsfs");
			//int tempos=10-cols;
				dice=dice-cols;
				rows--;
	  			cols=cols+dice;
				out.println("Cols in   else "+cols);
				//rows--;
				//set image at row=rows,col=cols;		
				%><script>document.getElementByID("<%=rows%>_<%=cols%>").innerHTML="#"</script><%
			}
			else
			{
				out.println("Herla af ofs s");
				cols=cols-dice;
				%><script>document.getElementByID("<%=rows%>_<%=cols%>").innerHTML="#"</script><%		
			}		
		}
		 if(rows==10 && cols==9)
 		{
 			rows=8;
 			cols=9;
 		}
 		else if(rows==9&& cols==6)
 		{
 			rows=8;
 			cols=6;
 		}
 		else if(rows==9 && cols==1 )
 		{
 			rows=9;
 			cols=4;
 		}
 		else if(rows==7 && cols==8 )
 		{
 			rows=10;
 			cols=7;
 		}
  		else if(rows==7 && cols==1 )
 		{
 			rows=5;
 			cols=1;
	 	}
  		else if(rows==6 && cols==4 )
	 	{
			rows=8;
			cols=2;	 	
 		}
 		else if(rows==5 && cols==9 )
 		{
 			rows=7;
 			cols=10;
 		}
 		else if(rows==4 && cols==9 )
 		{
 			rows=2;
 			cols=7;
 		}
 		else if(rows==4  && cols==4 )
 		{
 			rows=3;
 			cols=5;
 		}
 	 	else if(rows==4 && cols==3 )
 		{
 			rows=5;
 			cols=7;
 		}
	  	else if(rows==2 && cols==5 )
 		{
 			rows=4;
 			cols=7;
 		}
  		else if(rows==2  && cols==3 )
 		{
 			rows=1;
 			cols=3;
 		}
  		else if(rows==1 && cols==7 )
 		{
 			rows=3;
 			cols=10;
 		}
 	 	else if(rows==1 && cols==2 )
 		{
 			rows=4;
 			cols=1;
 		}
 	
 		out.println("player 1");

 	}
 }
else
	{
			int temp=0;
 		{

	if(rows1==1)
	{
	
		if(cols1<dice)
		{
			//rethrow;
		}
		else if(cols1-dice==0)
		{
			out.println("Game Over");
			rows1=1;
			cols1=10;
		}
		else
		{
			cols1=cols1-dice;
			rows1=1;
		}
	}
	else if(rows1%2==0)
	{
			//out.println("In if row mod 2 ");
		if(cols1+dice>10)
		{
			int tempos=10-cols1;
			dice=dice-tempos;
			cols1=10;
			cols1=cols1-dice+1;
			rows1--;
 		}
		else
		{	
			cols1+=dice;
		}
	
	}
	else
	{		
		out.println("In Else ");
		if(cols1-dice<0)
		{
	        out.println("Asfsffsdfsfs");
			//int tempos=10-cols1;
			dice=dice-cols1;
			rows1--;
		  	cols1=cols1+dice;
			out.println("cols1 in   else "+cols1);
					//rows1--;
				//set image at row=rows1,col=cols1;		
			%><script>document.getElementByID("<%=rows1%>_<%=cols1%>").innerHTML="#"</script><%
		}
		else
		{
			out.println("Herla af ofs s");
			cols1=cols1-dice;
					%><script>document.getElementByID("<%=rows1%>_<%=cols1%>").innerHTML="#"</script><%			
		}				
	}
 	if(rows1==10 && cols1==9)
 		{
 			rows1=8;
 			cols1=9;
 		}
 		else if(rows1==9&& cols1==6)
 		{
 			rows1=8;
 			cols1=6;
 		}
 		else if(rows1==9 && cols1==1 )
 		{
 			rows1=9;
 			cols1=4;
 		}
 		else if(rows1==7 && cols1==8 )
 		{
 			rows1=10;
 			cols1=7;
 		}
  		else if(rows1==7 && cols1==1 )
 		{
 			rows1=5;
 			cols1=1;
 		}
 	 	else if(rows1==6 && cols1==4 )
 		{
			rows1=8;
			cols1=2;	 	
 		}
 		else if(rows1==5 && cols1==9 )
 		{
 			rows1=7;
 			cols1=10;
 		}
 		else if(rows1==4 && cols1==9 )
 		{
 			rows1=2;
 			cols1=7;
 		}
 		else if(rows1==4  && cols1==4 )
 		{
 			rows1=3;
 			cols1=5;
 		}	
	  	else if(rows1==4 && cols1==3 )
 		{
 			rows1=5;
 			cols1=7;
 		} 
	  	else if(rows1==2 && cols1==5 )
	 	{
 			rows1=4;
 			cols1=7;
 		}
  		else if(rows1==2  && cols1==3 )
 		{
 			rows1=1;
 			cols1=3;
 		}
  		else if(rows1==1 && cols1==7 )
 		{
 			rows1=3;
 			cols1=10;
 		}
 		 	else if(rows1==1 && cols1==2 )
 		{
 			rows1=4;
 			cols1=1;
 		}
 	
	 out.println("player2");

		}
	 
 
	}
 
 
 
 %>
 
 
 
   
<%
for(int row=1; row <= 10; row++) 
{ %>
    <TR>
	<%
	      for(int col=1; col<=10; col++) 
		   { %>		           
		    <%
		    	//if (row==dice)		
		    	if(row==rows && col==cols)
		    	{		    out.println("IN coin two mesagaee ");
		    	%>
		    	<script>alert("PLayer 1 rolled ");</script>
		    	 <TD height="52" width="50"> (<%=row%>,* <%=col%>) <img src="coin2.png" alt="coin2" />
     					   </TD>
		    	
		    <%	}
		    if(row==rows1 && col==cols1)
		    {%>
		    
		    
 		     <TD height="52" width="50"> (<%=row%>,* <%=col%>) <img src="coin.png" alt="coin" />
        		</TD>
		    	
		 <%   
		    }
		    
		    else
		    {
		         %>
          <TD height="52" width="50" id="<%=row%>_<%=col%>" > (<%=row%>, <%=col%>) 
        </TD>
		  <%}
		 
        }%>
    </TR>
   <%}
    %>
    
<%

	if(flags==0)
	{
		flags=1;
	}
	else
	{
		flags=0;
	}
	

	Connection conn=null;
	Statement st=null;	    
	conn=ConnectionManager.getConnection();
 	st = conn.createStatement();
	ResultSet rs;
	try
	{
		String sql="UPDATE coin_pos set srow="+rows+", scol="+cols+", srow1="+rows1+", scol1="+cols1+", flag="+flags+" where srow="+pointer+"";
 	    st=conn.createStatement();
 	    st.executeUpdate(sql);
	}
	catch(Exception e)
	{
		out.println(e);
	}  
 
 
 
 session.setAttribute("srow",rows);
 session.setAttribute("scol",cols);
 
 session.setAttribute("srow1",rows1);
 session.setAttribute("scol1",cols1);
 session.setAttribute("flag",flags);
  %>
      
    
</TABLE>
</div>
</div>

</body>
</html>