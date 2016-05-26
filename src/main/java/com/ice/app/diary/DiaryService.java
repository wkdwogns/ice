package com.ice.app.diary;

import java.util.List;
import java.util.Map;

public interface DiaryService {

	List<Map<String, Object>> diaryList(Map<String, Object> param);

	void diaryInsertAction(Map<String, Object> param);

	void imageInsertAction(Map<String, Object> param);

	int diaryListCnt(Map<String, Object> param);

	Map<String, Object> diaryDetail(Map<String, Object> param);

	List<Map<String,Object>> diaryImageDetail(Map<String, Object> param);

	void diaryDelete(Map<String, Object> param);

	
}
