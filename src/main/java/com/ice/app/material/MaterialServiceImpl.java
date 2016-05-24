package com.ice.app.material;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ice.dao.ContactDao;
import com.ice.dao.EstimateDao;
import com.ice.dao.MaterialDao;

@Service("MaterialService")
public class MaterialServiceImpl implements MaterialService{

	@Autowired
	private MaterialDao materialDao;

	@Override
	public List<Map<String, Object>> materialList(Map<String, Object> param) {
		
		return materialDao.materialList(param);
	}

	@Override
	public void materialInsertAction(Map<String, Object> param) {
		materialDao.materialInsertAction(param);
	}
	
}
