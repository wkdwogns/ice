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

	@Override
	public int diaryListCnt(Map<String, Object> param) {
		
		return diaryDao.diaryListCnt(param);
	}

	@Override
	public Map<String, Object> diaryDetail(Map<String, Object> param) {
		
		return diaryDao.diaryDetail(param);
	}

	@Override
	public List<Map<String,Object>> diaryImageDetail(Map<String, Object> param) {
		
		return diaryDao.diaryImageDetail(param);
	}

	@Override
	public void diaryDelete(Map<String, Object> param) {
		diaryDao.diaryDelete(param);
	}

	@Override
	public void diaryUpdateAction(Map<String, Object> param) {
		diaryDao.diaryUpdateAction(param);
	}

	@Override
	public void imageUpdateAction(Map<String, Object> param) {
		diaryDao.imageUpdateAction(param);
		
	}

	@Override
	public void imageDelete(Map<String, Object> param) {
		diaryDao.imageDelete(param);
	}

	
}
