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
		HSSFSheet worksheet1 = workbook.createSheet("WorkSheet1");
		HSSFSheet worksheet2 = workbook.createSheet("WorkSheet2");
		HSSFSheet worksheet3 = workbook.createSheet("WorkSheet3");
		HSSFSheet worksheet4 = workbook.createSheet("WorkSheet4");

		worksheet.addMergedRegion(new CellRangeAddress(0, 0, 1, 5));
		worksheet.addMergedRegion(new CellRangeAddress(1, 1, 1, 5));
		/*worksheet.addMergedRegion(new CellRangeAddress(2, 2, 1, 4));
		worksheet.addMergedRegion(new CellRangeAddress(3, 3, 1, 4));
		worksheet.addMergedRegion(new CellRangeAddress(4, 4, 1, 4));
		worksheet.addMergedRegion(new CellRangeAddress(5, 5, 1, 4));
		worksheet.addMergedRegion(new CellRangeAddress(6, 6, 1, 4));*/
		
		worksheet.setColumnWidth(0,500);
		worksheet.setColumnWidth(1,12000);
		
		HSSFRow row0 = worksheet.createRow(0);
		HSSFRow row1 = worksheet.createRow(1);
		HSSFRow row2 = worksheet.createRow(2);
		HSSFRow row3 = worksheet.createRow(3);
		HSSFRow row4 = worksheet.createRow(4);
		HSSFRow row5 = worksheet.createRow(5);
		HSSFRow row6 = worksheet.createRow(6);
		HSSFRow row7 = worksheet.createRow(7);
		HSSFRow row8 = worksheet.createRow(8);
		HSSFRow row10 = worksheet.createRow(10);
		
		row0.setHeight((short)200);
		row1.setHeight((short)500);
		
		row1.createCell(1).setCellValue("견적서");
		row2.createCell(1).setCellValue("성심 송이사님 귀하");
		row3.createCell(1).setCellValue("금액 : 이백 삼십 오만 칠천 오백 원정");
		row4.createCell(1).setCellValue("견적유효기간 : 20일");
		row5.createCell(1).setCellValue("납  품  기  한 : 20일");
		row6.createCell(1).setCellValue("납  품  장  소 : 20일");
		row7.createCell(1).setCellValue("대금지급조건 : 현금(협의)");
		row8.createCell(1).setCellValue("시    공     일 : 2013 년 12 월 24 일");
		
		row10.createCell(1).setCellValue("품명");
		row10.createCell(2).setCellValue("단위");
		row10.createCell(3).setCellValue("수량");
		row10.createCell(4).setCellValue("단가");
		row10.createCell(5).setCellValue("금액");
		

		response.setContentType("Application/Msexcel");
		response.setHeader("Content-Disposition", "ATTachment; Filename=excel.xls");
	}

}
