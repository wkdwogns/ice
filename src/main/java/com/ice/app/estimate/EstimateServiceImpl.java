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
	
}
