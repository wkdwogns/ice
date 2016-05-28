package com.ice.app.estimate;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ice.dao.ContactDao;
import com.ice.dao.EstimateDao;

@Service("EstimateService")
public class EstimateServiceImpl implements EstimateService{

	@Autowired
	private EstimateDao estimateDao;

	@Override
	public void estimateInsertAction(Map<String, Object> param) {
		estimateDao.estimateInsertAction(param);
	}

	@Override
	public List<Map<String, Object>> getEstimateListByNum(Map<String, Object> param) {
		return estimateDao.getEstimateListByNum(param);
	}

	@Override
	public Map<String, Object> getDetailByNum(Map<String, Object> param) {		
		return estimateDao.getDetailByNum(param);
	}

	@Override
	public List<Map<String, Object>> estimateList(Map<String, Object> param) {
		return estimateDao.estimateList(param);
	}

	@Override
	public int estimateListCnt(Map<String, Object> param) {
		return estimateDao.estimateListCnt(param);
	}

	@Override
	public void estimateDelete(Map<String, Object> param) {
		estimateDao.estimateDelete(param);
	}

	@Override
	public void imageUpdateAction(Map<String, Object> param) {
		estimateDao.imageUpdateAction(param);
	}

	@Override
	public List<Map<String, Object>> diaryImageDetail(Map<String, Object> param) {
		return estimateDao.diaryImageDetail(param);
	}
	
}
