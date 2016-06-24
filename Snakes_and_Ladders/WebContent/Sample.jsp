<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>


<div width="704px">
<div name="board" style="float:right"> 
 <table width="704" height="580" border="2" background="rsz_1snakes-and-ladders-board-printable-i2.jpg" style="background-repeat:no-repeat;margin-left:0%;float:top;">
<% for(int row=1; row <= 10; row++) 
{ %>
    <TR>
	<%      for(int col=1; col<=10; col++) 
		   { %>
		
		      
           
          <TD> (<%=row%>,col= <%=col%>)
        </TD>
        
        <%}%>
    </TR>
   
<%  } %>
</TABLE>
</div>
</div>
</body>
</html>