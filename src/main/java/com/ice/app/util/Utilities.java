package com.ice.app.util;

import java.util.HashMap;
import java.util.Map;

public class Utilities {
	public Map<String,Object> pagination(int perpage,int listTotal,String PaginationNum){	
		
		int pageCount = 0;		
		int countperPage = perpage;	//페이지 당 보여줄 리스트 수
		int PageCnt = 0;	
		
		
		if( PaginationNum !=null && PaginationNum !=""){	 
			PageCnt = Integer.parseInt(PaginationNum)-1;
			pageCount = PageCnt*countperPage;
		}else{
			PaginationNum = "1";
		}
		
		
		int paginationTotal = listTotal/countperPage;
		
		if(listTotal%countperPage != 0){
			paginationTotal++;
		}else{
			paginationTotal=1;
		}
		
		
		int paginationCnt = 10;
		int pagingTotal = paginationTotal/paginationCnt;
		int pagingCnt = Integer.parseInt(PaginationNum);
		
		if(paginationTotal%paginationCnt != 0){
			pagingTotal++;
		}
		
		int i = 1;
		while(i<pagingTotal){
			if(pagingCnt > (i*paginationCnt)){
				i++;
			}else{break;}
		}
		
		int startPage = (i-1)*paginationCnt +1;
		int endPage = i*paginationCnt;
		
		if(paginationTotal < endPage){
			endPage = paginationTotal;
		}
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("pageCount", pageCount);
		param.put("countperPage", countperPage);
		param.put("PaginationNum", PaginationNum);
		param.put("paginationTotal", paginationTotal );
		param.put("startPage", startPage);
		param.put("endPage", endPage);
		return param;
	}
	
	public Map<String,Object> pagination(int perPage,Map<String,Object> map){	//�븳 �솕硫댁뿉 湲�媛쒖닔,由ъ뒪�듃�쓽 珥앷컻�닔�� �럹�씠吏� �꽆踰꾨뒗 留듭쑝濡�
		
		int pageCount = 0;		// DB�뿉�쓽LIMIT�쓣 �쐞�븳  媛�
		int countperPage = perPage;	// �럹�씠吏� �떦 蹂댁뿬以� 湲��쓽 媛쒖닔
		
		//�럹�씠�꽕�씠�뀡 媛믪씠 �엳�떎硫� 媛� �꽭�똿
		if( map.get("PaginationNum") !=null && map.get("PaginationNum") !=""){	 
			int idx = Integer.parseInt( (String)map.get("PaginationNum") )-1;
			pageCount = idx*countperPage;
		}else{
			map.put("PaginationNum", "1");
		}
		
		//�럹�씠吏��꽕�씠�뀡 媛쒖닔 ( 珥� 由ъ뒪�듃 �닔 / �럹�씠吏� �떦 由ъ뒪�듃媛��닔 )
		int paginationTotal = (Integer)map.get("listTotal")/countperPage;
		
		if((Integer)map.get("listTotal")%countperPage != 0){
			paginationTotal++;
		}
		
		// �럹�씠吏��꽕�씠�뀡 �젙蹂�
		map.put("pageCount", pageCount);
		map.put("countperPage", countperPage);
		map.put("paginationTotal", paginationTotal );
				
		return map;
	}
	
	public Map<String,Object> page(int perpage,int listTotal,String PaginationNum){
		int pNo = Integer.parseInt(PaginationNum)-1; //현재 페이지 넘버		
		int fst = (perpage*pNo);
		int lst = (perpage*pNo)+perpage;
		
		int cntPerPage = 10; //페이징 숫자 10개씩 뿌리기
		int pageCnt = 1;	//페이징 총개수
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
		System.out.println(fst+" "+pageEnd+" "+PaginationNum);
		return param;
	}
}
