package com.servlets.pages;
import java.io.*;
import java.sql.*;
public class ConnectionManager 
{
    private static String url = "jdbc:mysql://localhost:3306/snakes_ladders";    
    private static String driverName = "com.mysql.jdbc.Driver";   
    private static String username = "root";   
    private static String pasword = "root";
    private static Connection con;
	

    public static Connection getConnection() 
    {
        try 
        {
            Class.forName(driverName);
            try 
            {
                con = DriverManager.getConnection(url, username, pasword);
            } 
            catch (SQLException ex) 
            {
                System.out.println("Failed to create the database connection."); 
            }
        } 
        catch (ClassNotFoundException ex) 
        {
            // log an exception. for example:
            System.out.println("Driver not found."); 
        }
        return con;
    }

	public static String getUrl() 
	{
		return url;
	}

	

	public static void setUrl(String url) 
	{
		String oldUrl = ConnectionManager.url;
		ConnectionManager.url = url;
	}

	public static String getDriverName() 
	{
		return driverName;
	}

	public static void setDriverName(String driverName) 
	{
		String oldDriverName = ConnectionManager.driverName;
		ConnectionManager.driverName = driverName;
	}

	public static String getUsername() 
	{
		return username;
	}

	public static void setUsername(String username) 
	{
		String oldUsername = ConnectionManager.username;
		ConnectionManager.username = username;
	}

	public static String getPasword() 
	{
		return pasword;
	}

	public static void setPasword(String pasword) 
	{
		String oldPasword = ConnectionManager.pasword;
		ConnectionManager.pasword = pasword;
	}

	public static Connection getCon() 
	{
		return con;
	}

	public static void setCon(Connection con) 
	{
		Connection oldCon = ConnectionManager.con;
		ConnectionManager.con = con;
	}
}