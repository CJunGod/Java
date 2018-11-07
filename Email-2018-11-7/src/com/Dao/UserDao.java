package com.Dao;


/**
 * 用户Dao模式
 */
public interface UserDao {
	
	//用户登录验证
	public int SelectLogin(String username,String password);
	
	//登录后查询用户邮箱号
	public String select(String username);
	
	//注册验证用户名是否重复
	public int selectuser(String username);
	
	//用户注册
	public int AddUser(String username,String password,String email);
}
