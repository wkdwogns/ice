package com.ice.app.diary;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ice.dao.ContactDao;
import com.ice.dao.DiaryDao;

@Service("DiaryService")
public class DiaryServiceImpl implements DiaryService{

	@Autowired
	private DiaryDao diaryDao;

	@Override
	public List<Map<String, Object>> diaryList(Map<String, Object> param) {
		return diaryDao.diaryList(param);
	}

	@Override
	public void diaryInsertAction(Map<String, Object> param) {
		diaryDao.diaryInsertAction(param);
	}

	@Override
	public void imageInsertAction(Map<String, Object> param) {
		diaryDao.imageInsertAction(param);
	}

	
}
