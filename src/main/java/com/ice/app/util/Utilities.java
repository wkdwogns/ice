package com.ice.app.util;

import java.util.HashMap;
import java.util.Map;

public class Utilities {
	public Map<String,Object> page(int perpage,int listTotal,String PaginationNum){
		int pNo = Integer.parseInt(PaginationNum)-1; //현재 페이지 넘버		
		int fst = (perpage*pNo);
		int lst = (perpage*pNo)+perpage;
		
		int cntPerPage = 10; //페이징 숫자 10개씩 뿌리기
		int pageCnt = listTotal/perpage;	//페이징 총개수
		if(listTotal%perpage!=0){
			pageCnt = (listTotal/perpage)+1;
		}

		int pagestart = (cntPerPage*(pageCnt/perpage))+1;
		int pageEnd = (cntPerPage*(pageCnt/perpage))+cntPerPage;
		if(pageCnt < pageEnd){
			pageEnd = pageCnt;
		}
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("fst",fst);
		param.put("lst",lst);
		param.put("pageStart",pagestart);
		param.put("pageEnd", pageEnd );
		param.put("pNo", PaginationNum );
		return param;
	}
}
