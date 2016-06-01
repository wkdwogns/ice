package com.ice.app.util;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class excelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		@SuppressWarnings("unchecked")
		List<Map<String, Object>> excelName = (List<Map<String, Object>>) model.get("list");

		HSSFSheet worksheet = workbook.createSheet("WorkSheet");
		
		worksheet.addMergedRegion(new CellRangeAddress(0, 0, 1, 5));
		worksheet.addMergedRegion(new CellRangeAddress(1, 1, 1, 5));
		worksheet.addMergedRegion(new CellRangeAddress(2, 2, 2, 5));
		worksheet.addMergedRegion(new CellRangeAddress(3, 3, 2, 5));
		worksheet.addMergedRegion(new CellRangeAddress(4, 4, 2, 5));
		worksheet.addMergedRegion(new CellRangeAddress(5, 5, 2, 5));
		worksheet.addMergedRegion(new CellRangeAddress(6, 6, 2, 5));
		worksheet.addMergedRegion(new CellRangeAddress(7, 7, 2, 5));
		worksheet.addMergedRegion(new CellRangeAddress(8, 8, 2, 5));
		worksheet.addMergedRegion(new CellRangeAddress(9,9, 2, 5));
		worksheet.addMergedRegion(new CellRangeAddress(10,10, 2, 5));
		worksheet.addMergedRegion(new CellRangeAddress(11,11, 2, 5));
		worksheet.addMergedRegion(new CellRangeAddress(14,14, 1, 5));
		worksheet.setColumnWidth(0,500);
		worksheet.setColumnWidth(1,11000);
		
		HSSFRow row0 = worksheet.createRow(0);
		HSSFRow row1 = worksheet.createRow(1);
		HSSFRow row2 = worksheet.createRow(2);
		HSSFRow row3 = worksheet.createRow(3);
		HSSFRow row4 = worksheet.createRow(4);
		HSSFRow row5 = worksheet.createRow(5);
		HSSFRow row6 = worksheet.createRow(6);
		HSSFRow row7 = worksheet.createRow(7);
		HSSFRow row8 = worksheet.createRow(8);
		HSSFRow row9 = worksheet.createRow(9);
		HSSFRow row10 = worksheet.createRow(10);
		HSSFRow row11 = worksheet.createRow(11);
		HSSFRow row12 = worksheet.createRow(12);
		HSSFRow row14 = worksheet.createRow(14);
		HSSFRow row15 = worksheet.createRow(15);
		
		row0.setHeight((short)200);
		row1.setHeight((short)500);
		row2.setHeight((short)500);
		row3.setHeight((short)500);
		row4.setHeight((short)500);
		row5.setHeight((short)500);
		row6.setHeight((short)500);
		row7.setHeight((short)500);
		row8.setHeight((short)500);
		row9.setHeight((short)400);
		row10.setHeight((short)400);
		row11.setHeight((short)400);
		row12.setHeight((short)400);
		row14.setHeight((short)500);
		row15.setHeight((short)500);
		
		row1.createCell(1).setCellValue("견적서");
		row2.createCell(1).setCellValue("성심 송이사님 귀하");
		row3.createCell(1).setCellValue("금액 : 이백 삼십 오만 칠천 오백 원정");
		row4.createCell(1).setCellValue("견적유효기간 : 20일");
		row5.createCell(1).setCellValue("납  품  기  한 : 20일");
		row6.createCell(1).setCellValue("납  품  장  소 : 20일");
		row7.createCell(1).setCellValue("대금지급조건 : 현금(협의)");
		row8.createCell(1).setCellValue("시    공     일 : 2013 년 12 월 24 일");
		
		row2.createCell(2).setCellValue("한국냉동설비");
		row3.createCell(2).setCellValue("경기도 김포시 고촌읍 신곡리 1006-2");
		row4.createCell(2).setCellValue("TEL : 02-2695-7172");
		row5.createCell(2).setCellValue("H.P : 010-5276-1236");
		row6.createCell(2).setCellValue("FAX : 031-986-7372");
		row7.createCell(2).setCellValue("대표 : 최 호 묵");
		row8.createCell(2).setCellValue("<농.수.축산물 냉동 시공 전문업체>");
		row9.createCell(2).setCellValue("※저온창고 냉동기 ※저장유통냉동기");
		row10.createCell(2).setCellValue("※급속동결냉동기 ※냉동응용기기");
		row11.createCell(2).setCellValue("<방열문.조립식냉동냉장고 제조업체>");
		row12.createCell(2).setCellValue("※전동방열문 ※조립식냉동냉장고");
		row14.createCell(1).setCellValue("냉장고 제목");
		row15.createCell(1).setCellValue("품명");
		row15.createCell(2).setCellValue("단위");
		row15.createCell(3).setCellValue("수량");
		row15.createCell(4).setCellValue("단가");
		row15.createCell(5).setCellValue("금액");
		

		response.setContentType("Application/Msexcel");
		response.setHeader("Content-Disposition", "ATTachment; Filename=excel.xls");
	}

}
