package com.ice.app.util;

import java.util.HashMap;
import java.util.Map;

public class Utilities {
	public Map<String,Object> page(int perpage,int listTotal,String PaginationNum){
		int pNo = Integer.parseInt(PaginationNum)-1; //현재 페이지 넘버		
		int fst = (perpage*pNo);
		int lst =  perpage;
		
		double pp = perpage; //현재 페이지 넘버		
		
		//
		int totalPage = (int) Math.ceil(listTotal/pp);
		double pageNum = Double.parseDouble(PaginationNum); //현재 페이지 넘버		
		
		double pageGroup = Math.ceil(pageNum/perpage);

		int next = (int)pageGroup*10;
		int prev = next-9;
		
		int goNext = next+1;
		int goPrev = 0;
        if(prev-1<=0){
        	goPrev = 1;
        }else{
        	goPrev = prev-1;
        }    

        if(next>totalPage){
        	goNext = totalPage;
            next = totalPage;
        }else{
        	goNext = next+1;
        }


		Map<String,Object> param = new HashMap<String, Object>();
		param.put("fst",fst);
		param.put("lst",lst);
		param.put("pageStart",prev);
		param.put("pageEnd", next );
		param.put("goNext", goNext );
		param.put("goPrev", goPrev );
		param.put("pNo", PaginationNum );
		return param;
	}
}
