package com.ice.dao;

import java.util.List;
import java.util.Map;

public interface ContactDao {

	List<Map<String, Object>> contactList(Map<String,Object> param);

	void contactInsertAction(Map<String, Object> param);

	Map<String, Object> contactUpdate(Map<String, Object> param);

	void contactUpdateAction(Map<String, Object> param);

	void contactDelete(Map<String, Object> param);

	int contactListCnt(Map<String, Object> param);
	
}