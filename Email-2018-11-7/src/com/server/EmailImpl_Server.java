package com.server;

import java.util.List;

import com.Dao.EmailDao;
import com.Impl.EmailImpl;
import com.entity.Email;

public class EmailImpl_Server implements EmailDao_Server{

	EmailDao ed = new EmailImpl();
	//显示所有邮箱列表
	public List<Email> selectAll() {
		List<Email> list = ed.selectAll();
		return list;
	}
	//删除邮件
	public int DelEmail(int id) {
		int b = ed.DelEmail(id);
		return b;
	}
	//根据id查询信息
	public List<Email> selectid(int id) {
		List<Email> list = ed.selectid(id);
		return list;
	}
	//发送邮件
	public int insert(Email email) {
		int b = ed.insert(email);
		return b;
	}
	
	//根据id修改邮箱状态
	public int updatestate(int id, int state) {
		int b = ed.updatestate(id, state);
		return b;
	}
	

}
