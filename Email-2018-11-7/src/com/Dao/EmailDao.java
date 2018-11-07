package com.Dao;

import java.util.List;

import com.entity.Email;

/**
 * 邮箱Dao模式
 */
public interface EmailDao {
	//显示所有邮箱列表
	public List<Email> selectAll();
	
	//删除邮件
	public int DelEmail(int id);
	
	//根据id查询信息
	public List<Email> selectid(int id);
	
	//根据id修改邮箱状态
	public int updatestate(int id,int state);
	
	//发送邮件方法
	public int insert(Email email);
}
