package com.Dao;

import java.util.List;

import com.entity.Email;

/**
 * ����Daoģʽ
 */
public interface EmailDao {
	//��ʾ���������б�
	public List<Email> selectAll();
	
	//ɾ���ʼ�
	public int DelEmail(int id);
	
	//����id��ѯ��Ϣ
	public List<Email> selectid(int id);
	
	//����id�޸�����״̬
	public int updatestate(int id,int state);
	
	//�����ʼ�����
	public int insert(Email email);
}
