package com.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.Dao.BaseDao;
import com.Dao.UserDao;

public class UserImpl extends BaseDao implements UserDao {

	//用户登录验证
	public int SelectLogin(String username,String password) {
		String sql = "select * from user where username=? and password=?";
		ResultSet rs = this.executeQuery(sql,username,password);
		int b = 0;
		try {
			if(rs.next()){
				b = 1;
			}else{
				b = -1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.closeAll(conn, null, rs);
		return b;
	}

	//注册验证用户名是否重复
	public	int selectuser(String username) {
		String sql = "select * from user where username=?";
		ResultSet rs = this.executeQuery(sql, username);
		int b = 0;
		try {
			if(rs.next()){
				b = -1;
			}else{
				b = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.closeAll(conn, null, rs);
		return b;
	}

	//用户注册
	public int AddUser(String username, String password, String email) {
		String sql = "insert into user (username,password,email) values (?,?,?)";
		int b = executeUpdate(sql, username,password,email);
		this.closeAll(conn, null, null);
		return b;
	}

	//登录后查询用户邮箱号
	public String select(String username) {
		String sql = "select * from user where username=?";
		ResultSet rs = this.executeQuery(sql, username);
		String email = null;
		try {
			if(rs.next()){
				try {
					email = rs.getString("email");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return email;
	}

}
