 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
body,td,th {
	font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	color: #000;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
#header{
	text-shadow:#0CF;
	text-justify:auto;
	font-style:italic;
}
#button,#button1,#button2,#button4,#button5{
  color: #009F00;
  font-weight: bold;
  font-size: 150%;
  text-transform: uppercase;
  font-family:"Comic Sans MS", cursive;
}
#text
{
	font-family:Andulus;
	font-size:15px;
	display:block;
	margin-right:872px;
	border:dashed;
	border-color:#F03;
	text-align:center;
	background-color:#FFEAFF
}

#content{
	font-family:"Trebuchet MS", Arial, Helvetica, sans-serif

}
body {
	background-color: #FFFFFF;
	background-image: url(bg.jpg);
	background-size: 880px 768px;
	background-repeat: no-repeat;
	background-position: top right;	
}
</style>
</head>

<body text="#D6D6D6" leftmargin="10" topmargin="10" marginwidth="10" marginheight="10">
<div >
<p><img src="titl1.jpg" width="438" height="169" alt="title" /></p>


<%
	if(session.getAttribute("userName")==null)
	{
 %>
</div>
 <div style="float:right;display:block;background:#FFF;border-bottom-style:groove;width:300px;background-position:right bottom;background:#006F00;
 color:#FFF" align="center">

<form action="loginHandler" method="post">
    <p>
      &nbsp;&nbsp;&nbsp;&nbsp;User Name 
      <input type="text" placeholder="username" name="uname" />
    </p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password     
      <input type="password" placeholder="Password"  name="upwd"/>
    </p>
    <p align="justify">
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input align="middle"  type="submit" value="Log in" onclick="GameScreen.html">
    </p>
    <p align="center" style=" ;color:#0FF">    <a href="break.jsp">Forgot Password ? ></a></p>
   </form>


</div>

<%} %>


<p>
    <label for="Home"></label>
</p>
<div>
   <a href="Home.jsp">
  <p><img src="BUTTONS/button (2).png" width="129" height="41" alt="home" /></a>
  <a href="create.jsp">
  <img src="BUTTONS/button (1).png" width="142" height="42" alt="create" /></a>
  <a href="blank.jsp">
  <img src="BUTTONS/button (4).png" width="131" height="42" alt="join" /></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a href="reg.jsp"><img src="BUTTONS/button (3).png" width="143" height="41" alt="register" /></a>
<a href="contact.jsp"><img src="BUTTONS/button (5).png" width="139" height="39" alt="contact" /></p></a>
</div>

<p><strong>About Game </strong></p>
<p id="content">
  </ul>
</div>
</p>
<div id="text">
<p><strong>Snakes and Ladders</strong> is an ancient Indian board game regarded today</p>
<p> As a worldwide classic. It is played between two or more players on a </p>
<p>gameboard having numbered, gridded squares. A number of &quot;ladders&quot;</p>
<p> and &quot;snakes&quot; are pictured on the board, each connecting two specific</p>
<p> board squares. The object of the game is to navigate one's game piece, </p>
<p>ccording to die rolls, from the start  to the finish , helped or hindered by </p>
<p>ladders and snakes respectively.</p>


<td>Username: </td>
<td><input type="text" value="<%= session.getAttribute("userName") %>" /></td>

</div>
</body>
</body>
</html>
