package com.Dao;


/**
 * �û�Daoģʽ
 */
public interface UserDao {
	
	//�û���¼��֤
	public int SelectLogin(String username,String password);
	
	//��¼���ѯ�û������
	public String select(String username);
	
	//ע����֤�û����Ƿ��ظ�
	public int selectuser(String username);
	
	//�û�ע��
	public int AddUser(String username,String password,String email);
}
