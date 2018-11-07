package com.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.Dao.BaseDao;
import com.Dao.EmailDao;
import com.entity.Email;

public class EmailImpl extends BaseDao implements EmailDao {

	//显示所有邮箱列表
	public List<Email> selectAll() {
		String sql = "select * from email";
		ResultSet rs = this.executeQuery(sql);
		List<Email> list = new ArrayList<Email>();
		try {
			while(rs.next()){
				int id = rs.getInt("msgid");
				String username = rs.getString("username");
				String title = rs.getString("title");
				String msgcontent = rs.getString("msgcontent");
				int state = rs.getInt("state");
				String sendto = rs.getString("sendto");
				Date msg_create_date = rs.getDate("msg_create_date");
				Email email = new Email(id,username,title,msgcontent,state,sendto,msg_create_date);
				list.add(email);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	//删除邮件
	public int DelEmail(int id) {
		String sql = "DELETE FROM email WHERE msgid=?";
		int b = this.executeUpdate(sql, id);
		return b;
	}

	//根据id查询信息
	public List<Email> selectid(int id) {
		String sql = "select * from email where msgid=?";
		ResultSet rs = this.executeQuery(sql, id);
		List<Email> list = new ArrayList<Email>();
		try {
			while(rs.next()){
				int msgid = rs.getInt("msgid");
				String username = rs.getString("username");
				String title = rs.getString("title");
				String msgcontent = rs.getString("msgcontent");
				int state = rs.getInt("state");
				String sendto = rs.getString("sendto");
				Date msg_create_date = rs.getDate("msg_create_date");
				Email email = new Email(msgid,username,title,msgcontent,state,sendto,msg_create_date);
				list.add(email);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	//发送邮件
	public int insert(Email email) {
		String sql = "insert into email (username,title,msgcontent,state,sendto,msg_create_date) values (?,?,?,?,?,?)";
		int b = this.executeUpdate(sql,email.getUsername(),email.getTitle(),email.getMsgcontent(),email.getState(),email.getSendto(),email.getMsg_create_date());
		return b;
	}

	//根据id修改邮箱状态
	public int updatestate(int id, int state) {
		String sql = "update email set state=? where msgid=?";
		int b = this.executeUpdate(sql, state,id);
		return b;
	}

}
