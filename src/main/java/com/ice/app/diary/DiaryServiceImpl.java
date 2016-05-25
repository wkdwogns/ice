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

	
}
