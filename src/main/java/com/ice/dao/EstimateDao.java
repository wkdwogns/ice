package com.ice.dao;

import java.util.List;
import java.util.Map;

public interface EstimateDao {

	void estimateInsertAction(Map<String, Object> param);

	List<Map<String, Object>> getEstimateListByNum(Map<String, Object> param);

	Map<String, Object> getDetailByNum(Map<String, Object> param);

	
}