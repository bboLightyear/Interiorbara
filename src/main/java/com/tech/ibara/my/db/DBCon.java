package com.tech.ibara.my.db;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCon {
//	db접속
	static Connection con;
	public static Connection getconConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "ibara";
		String pw = "123456";
		Connection con = DriverManager.getConnection(url, user, pw);
				
		return con;
	}

}
