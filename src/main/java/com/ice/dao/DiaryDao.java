package com.ice.dao;

import java.util.List;
import java.util.Map;


public interface DiaryDao {

	List<Map<String, Object>> diaryList(Map<String, Object> param);
	
}