package com.xy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xy.model.User;
import com.xy.utils.DBUtils;
import com.xy.utils.QueryResult;


public class UserDao {
	/**
	 * 查询全部记录
	 * @return
	 */
	public QueryResult<User> listAll(){
		QueryResult<User> qr = new QueryResult<User>();
		Connection con = DBUtils.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select id,username,password from user";
		List<User> list = new ArrayList<>();
		int count = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				int id = rs.getInt("id");
				String name = rs.getString("username");
				String password = rs.getString("password");
				User user = new User();
				user.setId(id);
				user.setName(name);
				user.setPassword(password);
				list.add(user);
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(con, ps, rs);
		}
		qr.setDatas(list);
		qr.setTotalCount(count);
		return qr;
	}
	/**
	 * 根据ID单独查询一条记录
	 * @param id
	 * @return
	 */
	public User getUser(int id){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User user= null;
		String sql = "select username,password from user where id =?";
		con = DBUtils.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				String name = rs.getString("username");
				String password = rs.getString("password");
				user.setId(id);
				user.setName(name);
				user.setPassword(password);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(con, ps, rs);
		}
		return user;
	}
	/**
	 * 单独修改一条记录
	 * @param user
	 * @return
	 */
	public boolean editUser(User user){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int flag = 0;
		String sql_1 = "select * from user where username=?";//检查是否重名
		String sql_2 = "update user set username = ?,password=? where id =?";//更新
		con = DBUtils.getConnection();
		try {
			ps = con.prepareStatement(sql_1);
			ps.setString(1, user.getName());
			rs  = ps.executeQuery();
			boolean next = rs.next();
			if(!next||rs.getInt("id")==user.getId()){//没有重名则更新
				ps.close();
				ps = con.prepareStatement(sql_2);
				ps.setString(1, user.getName());
				ps.setString(2, user.getPassword());
				ps.setInt(3, user.getId());
				flag = ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(con, ps, rs);
		}
		return flag==1?true:false;
	}

	/**
	 * 根据ID单独删除一条记录
	 * @param id
	 * @return
	 */
	public boolean deleteUser(int id){
		Connection con = null;
		PreparedStatement ps = null;
		int flag = 0;
		String sql = "delete from user where id=?";
		con = DBUtils.getConnection();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			flag = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(con, ps, null);
		}
		return flag==1?true:false;
	}
	/**
	 * 新增一条记录
	 * @param user
	 * @return
	 */
	public boolean addUser(User user){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int flag = 0;
		String sql_1 = "select * from user where username=?";//检查是否重名
		String sql_2 = "insert into user(username,password) values(?,?)";//插入
		con = DBUtils.getConnection();
		try {
			ps = con.prepareStatement(sql_1);
			ps.setString(1, user.getName());
			rs  = ps.executeQuery();
			if(!rs.next()){//没有重名则更新
				ps.close();
				ps = con.prepareStatement(sql_2);
				ps.setString(1, user.getName());
				ps.setString(2, user.getPassword());
				flag = ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(con, ps, rs);
		}
		return flag==1?true:false;
	}
}
