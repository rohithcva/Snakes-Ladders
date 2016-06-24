package com.servlets.pages;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Form_Connection 
{
	public static void main(String[] args) throws SQLException 
	{
		Scanner sc= new Scanner(System.in);
		Scanner sc1=new Scanner(System.in);
		Connection conn=null;
	    Statement st=null;
	    java.sql.PreparedStatement ps=null;
	    conn=ConnectionManager.getConnection();
	    st=conn.createStatement();
	   	String sql;
	    sql="DROP DATABASE IF EXISTS sform";
	    st.executeUpdate(sql);
		String sql1;
		sql1="CREATE DATABASE IF NOT EXISTS sform";
		st.executeUpdate(sql1);
		sql="use sform";
		st.executeQuery(sql);
		sql1="CREATE TABLE sforms( sid varchar(20) ,sname varchar(30),fname varchar(30),addr varchar(20),femail varchar(20),phno varchar(20),ptage varchar(20),PRIMARY KEY(sid))";
		st.execute(sql1);  
		sql="select * from sforms";
		 
		
		
		st.close();
		conn.close();
	}
}
