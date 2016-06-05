package com.ice.app.material;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public Map<String, Object> materialUpdate(Map<String, Object> param) {
		
		return materialDao.materialUpdate(param);
	}

	@Override
	public void materialUpdateAction(Map<String, Object> param) {
		materialDao.materialUpdateAction(param);
	}

	@Override
	public void materialDelete(Map<String, Object> param) {
		materialDao.materialDelete(param);
	}

	@Override
	public int materialListCnt(Map<String, Object> param) {
		
		return materialDao.materialListCnt(param);
	}
	
}
