package com.server;


import com.Dao.UserDao;
import com.Impl.UserImpl;

public class UserImpl_Server implements UserDao_Server {
	
	UserDao ud = new UserImpl();
	int b = 0;
	//用户登录验证
	public int SelectLogin(String username,String password) {
		b = ud.SelectLogin(username,password);
		return b;
	}

	//注册验证用户名是否重复
	public int selectuser(String username) {
		b = ud.selectuser(username);
		return b;
	}

	//用户注册
	public int AddUser(String username, String password, String email) {
		int b = ud.AddUser(username, password, email);
		return b;
	}

	//登录后查询用户邮箱号
	public String select(String username) {
		String email = ud.select(username);
		return email;
	}

}
