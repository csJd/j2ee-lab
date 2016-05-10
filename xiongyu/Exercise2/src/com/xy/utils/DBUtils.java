package com.xy.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 数据库工具类
 * @author BearSmall
 *
 */
public class DBUtils {
	private static String JDBC_DRIVER = "com.mysql.jdbc.Driver";//MySQL 驱动类
	private static String JDBC_URL = "jdbc:mysql://localhost:3306/users?useUnicode=true&characterEncoding=UTF-8";//连接URL
	private static String JDBC_NAME = "root";//用户名
	private static String JDBC_PASSWORD = "xy196456";//密码
	
	/**
	 * 注册驱动类
	 */
	static{
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取连接资源
	 * @return
	 */
	public static Connection getConnection(){
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(JDBC_URL, JDBC_NAME, JDBC_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	/**
	 * 关闭资源
	 * @param conn Connection
	 * @param stat Statement
	 * @param rs ResultSet
	 */
	public static void close(Connection conn,PreparedStatement ps,ResultSet rs){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
