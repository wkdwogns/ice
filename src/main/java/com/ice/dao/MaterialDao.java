package com.ice.dao;

import java.util.List;
import java.util.Map;

public interface MaterialDao {

	List<Map<String, Object>> materialList(Map<String, Object> param);

	void materialInsertAction(Map<String, Object> param);

	Map<String, Object> materialUpdate(Map<String, Object> param);

	void materialUpdateAction(Map<String, Object> param);

	void materialDelete(Map<String, Object> param);

	int materialListCnt(Map<String, Object> param);

	List<Map<String, Object>> materialSort(Map<String, Object> param);

	
}