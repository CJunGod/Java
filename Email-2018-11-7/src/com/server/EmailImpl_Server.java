package com.server;

import java.util.List;

import com.Dao.EmailDao;
import com.Impl.EmailImpl;
import com.entity.Email;

public class EmailImpl_Server implements EmailDao_Server{

	EmailDao ed = new EmailImpl();
	//��ʾ���������б�
	public List<Email> selectAll() {
		List<Email> list = ed.selectAll();
		return list;
	}
	//ɾ���ʼ�
	public int DelEmail(int id) {
		int b = ed.DelEmail(id);
		return b;
	}
	//����id��ѯ��Ϣ
	public List<Email> selectid(int id) {
		List<Email> list = ed.selectid(id);
		return list;
	}
	//�����ʼ�
	public int insert(Email email) {
		int b = ed.insert(email);
		return b;
	}
	
	//����id�޸�����״̬
	public int updatestate(int id, int state) {
		int b = ed.updatestate(id, state);
		return b;
	}
	

}
