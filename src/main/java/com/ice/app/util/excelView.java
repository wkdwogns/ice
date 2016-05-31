package com.ice.app.util;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class excelView extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> ModelMap,
			HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
			throws Exception {


		
		String excelName = ModelMap.get("target").toString();
        HSSFSheet worksheet = null;
        HSSFRow row = null;
       
       excelName="게시글";       
       worksheet = workbook.createSheet(excelName+ " WorkSheet");
       
       row = worksheet.createRow(0);
       row.createCell(0).setCellValue("글번호");
       row.createCell(1).setCellValue("제목");
       row.createCell(2).setCellValue("날짜");
       row. createCell(3).setCellValue("글쓴이");
       row.createCell(4).setCellValue("비밀번호");
       row.createCell(5).setCellValue("내용");
       for(int i=1;i<6+1;i++){
              row = worksheet.createRow(i);
              row.createCell(0).setCellValue("1");
              row.createCell(1).setCellValue(1);
              row.createCell(2).setCellValue("1");
              row.createCell(3).setCellValue("1");
              row.createCell(4).setCellValue("1");
              row.createCell(5).setCellValue("1");
       }
        
        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=excel.xls");
  }

}
