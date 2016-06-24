package com.servlets.pages;
import java.sql.*;
import java.util.Scanner;
public class Snake_ladders_jdbc 
{

	public static void main(String[] args) throws SQLException,ClassNotFoundException
	{
		Scanner sc= new Scanner(System.in);
		Scanner sc1=new Scanner(System.in);
		Connection conn=null;
	    Statement st=null;
	    java.sql.PreparedStatement ps=null;
	    conn=ConnectionManager.getConnection();
	    st=conn.createStatement();
	   	String sql;
		sql="DROP DATABASE IF EXISTS snakes_ladders";
		st.executeUpdate(sql);
		String sql1;
		sql1="CREATE DATABASE IF NOT EXISTS snakes_ladders";
		st.executeUpdate(sql1);
		sql="use snakes_ladders";
		st.executeQuery(sql);
		//st.executeQuery("DROP TABLE IF EXISTS game_details");
		sql1="CREATE TABLE game_details(game_name varchar(20),passphrase varchar(6),player_name varchar(20),max_players int(10),PRIMARY KEY(player_name))";
		st.execute(sql1);
		sql1="create TABLE players_details(player_name varchar(20),game_name varchar(20),player_color varchar(20),current_position varchar(20),previous_position varchar(20),PRIMARY KEY(player_name),FOREIGN KEY(player_name) REFERENCES game_details(player_name))";
		st.execute(sql1);
		sql="create TABLE reg_details(username varchar(20),password varchar(20),fname varchar(20),lname varchar(20),email varchar(20),sques varchar(80),sanw varchar(80),PRIMARY KEY(username) )";
		st.execute(sql);
		sql="CREATE TABLE players_temp(pname varchar(20),bname varchar(20))";
		st.execute(sql);
		/*System.out.println("Enter the player details :");
		System.out.println("Enter Game Name :");

		    String sn=sc.next().trim();
			System.out.println("Enter passphrase :");
			String sg=sc.next().trim();
			System.out.println("Enter max_playersr :");
			String sd=sc.next().trim();
			System.out.println("Enter playerName");
			String scp=sc.next().trim();
			System.out.println("Enter count");
			int spp=Integer.parseInt(sc.next());
			 ps=conn.prepareStatement(sql);
			sql="insert into game_details(game_name, passphrase, max_players, player_name, count) values(?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,sn);
			ps.setString(2,sg);
			ps.setString(3,sd);
			ps.setString(4,scp);
			ps.setInt(5,spp);
			//st.execute(sql);
			 ps.executeUpdate();
			ps.close();*/
			st.close();
	}
    
}
