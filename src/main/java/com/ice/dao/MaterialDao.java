package com.ice.dao;

import java.util.List;
import java.util.Map;

public interface MaterialDao {

	List<Map<String, Object>> materialList(Map<String, Object> param);

	void materialInsertAction(Map<String, Object> param);

	
}