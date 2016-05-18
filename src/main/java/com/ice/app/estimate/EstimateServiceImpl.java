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
	
}
