package com.ice.dao;

import java.util.List;
import java.util.Map;

public interface EstimateDao {

	void estimateInsertAction(Map<String, Object> param);

	List<Map<String, Object>> getEstimateListByNum(Map<String, Object> param);

	Map<String, Object> getDetailByNum(Map<String, Object> param);

	List<Map<String, Object>> estimateList(Map<String, Object> param);

	int estimateListCnt(Map<String, Object> param);

	void estimateDelete(Map<String, Object> param);

	void imageUpdateAction(Map<String, Object> param);

	List<Map<String, Object>> diaryImageDetail(Map<String, Object> param);

	void estimateUpdateAction(Map<String, Object> param);

	List<Map<String, Object>> excelTransform(Map<String, Object> param);

	
}