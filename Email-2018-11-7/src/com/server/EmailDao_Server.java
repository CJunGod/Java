package com.server;

import java.util.List;

import com.entity.Email;

/**
 * �������Daoģʽ
 * @author Administrator
 *
 */
public interface EmailDao_Server {

	//��ʾ���������б�
	public List<Email> selectAll();
	
	//ɾ���ʼ�
	public int DelEmail(int id);
	
	//����id��ѯ��Ϣ
	public List<Email> selectid(int id);
	
	//�����ʼ�
	public int insert(Email email);
	
	//����id�޸�����״̬
	public int updatestate(int id,int state);
}
