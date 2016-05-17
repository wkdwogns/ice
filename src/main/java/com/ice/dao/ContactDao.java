package com.ice.dao;

import java.util.List;
import java.util.Map;

public interface ContactDao {

	List<Map<String, Object>> contactList(Map<String,Object> param);
	
}