package com.server;


import com.Dao.UserDao;
import com.Impl.UserImpl;

public class UserImpl_Server implements UserDao_Server {
	
	UserDao ud = new UserImpl();
	int b = 0;
	//�û���¼��֤
	public int SelectLogin(String username,String password) {
		b = ud.SelectLogin(username,password);
		return b;
	}

	//ע����֤�û����Ƿ��ظ�
	public int selectuser(String username) {
		b = ud.selectuser(username);
		return b;
	}

	//�û�ע��
	public int AddUser(String username, String password, String email) {
		int b = ud.AddUser(username, password, email);
		return b;
	}

	//��¼���ѯ�û������
	public String select(String username) {
		String email = ud.select(username);
		return email;
	}

}
