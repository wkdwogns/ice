package com.ice.app.contacts;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ice.dao.ContactDao;

@Service("ContactService")
public class ContactServiceImpl implements ContactService{

	@Autowired
	private ContactDao contactDao;
	
	@Override
	public List<Map<String, Object>> contactList(Map<String,Object> param) {
		
		return contactDao.contactList(param);
	}

	@Override
	public void contactInsertAction(Map<String, Object> param) {
		contactDao.contactInsertAction(param);
	}

	@Override
	public Map<String, Object> contactUpdate(Map<String, Object> param) {
		
		return contactDao.contactUpdate(param);
	}

	@Override
	public void contactUpdateAction(Map<String, Object> param) {
		contactDao.contactUpdateAction(param);
	}

	@Override
	public void contactDelete(Map<String, Object> param) {
		contactDao.contactDelete(param);
	}

}
