package com.ice.app.util;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class excelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		JSONParser jsonParser = new JSONParser();
		
		//excel font
		HSSFFont font = workbook.createFont();		
		font.setFontHeight((short)500);
		font.setBoldweight(Font.BOLDWEIGHT_BOLD);
		
		HSSFFont font1 = workbook.createFont();		
		font1.setFontHeight((short)250);
		font1.setBoldweight(Font.BOLDWEIGHT_BOLD);
		
		HSSFFont font2 = workbook.createFont();		
		font1.setFontHeight((short)350);
		
		HSSFCellStyle style = workbook.createCellStyle();
		style.setFont(font);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		
		HSSFCellStyle style1 = workbook.createCellStyle();
		style1.setFont(font1);
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
		HSSFCellStyle style2 = workbook.createCellStyle();
		style2.setFont(font2);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style2.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
		style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		
		HSSFCellStyle style3 = workbook.createCellStyle();
		HSSFDataFormat df = workbook.createDataFormat();
		style3.setDataFormat(df.getFormat("#,##0"));
		  
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = (List<Map<String, Object>>) model.get("list");
		for(int i = 0; i< list.size();i++){
			Map<String, Object> info = list.get(i);
			
			String estimateTitle = (String)info.get("estimateTitle");
			String name = (String)info.get("name");
			String price_kr = (String)info.get("price_kr");
			String validity = (String)info.get("validity");
			String deliveryDate = (String)info.get("deliveryDate");
			String deliveryPlace = (String)info.get("deliveryPlace");
			String paymentType = (String)info.get("paymentType");
			Date constructionDate = (Date)info.get("constructionDate");
			String title = (String)info.get("title");
			int total = (Integer)info.get("total");
			
			HSSFSheet worksheet = workbook.createSheet(estimateTitle);
			
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
			worksheet.addMergedRegion(new CellRangeAddress(12,12, 1, 5));	
			worksheet.addMergedRegion(new CellRangeAddress(14,14, 1, 5));
			
			worksheet.setColumnWidth(0,500);
			worksheet.setColumnWidth(1,11000);
			worksheet.setColumnWidth(4,3000);
			
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
			row1.setHeight((short)800);
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
			
			
			
			HSSFCell cell = row1.createCell(1);
			cell.setCellValue("견적서");
			cell.setCellStyle(style);
			
			row3.createCell(1).setCellValue(name + " 귀하");
			row4.createCell(1).setCellValue("금액 : "+price_kr);
			row5.createCell(1).setCellValue("견적유효기간 : "+validity+"일");
			row6.createCell(1).setCellValue("납  품  기  한 : "+deliveryDate+"일");
			row7.createCell(1).setCellValue("납  품  장  소 : "+deliveryPlace);
			row8.createCell(1).setCellValue("대금지급조건 : "+paymentType);
			row9.createCell(1).setCellValue("시    공     일 : "+constructionDate);
			
			HSSFCell cell2 = row2.createCell(2);
			cell2.setCellValue("한국냉동설비");
			cell2.setCellStyle(style1);
			
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
			row14.createCell(1).setCellValue(title);
			
			HSSFCell cell3 = row15.createCell(1);
			cell3.setCellValue("품명");
			cell3.setCellStyle(style2);
			HSSFCell cell4 = row15.createCell(2);
			cell4.setCellValue("단위");
			cell4.setCellStyle(style2);
			HSSFCell cell5 = row15.createCell(3);
			cell5.setCellValue("수량");
			cell5.setCellStyle(style2);
			HSSFCell cell6 = row15.createCell(4);
			cell6.setCellValue("단가");
			cell6.setCellStyle(style2);
			HSSFCell cell7 = row15.createCell(5);
			cell7.setCellValue("금액");
			cell7.setCellStyle(style2);
			
			//contentList 부분
			JSONArray ja = (JSONArray) jsonParser.parse( (String) info.get("contentList") );
			for(int k=0; k<ja.size(); k++){
				JSONObject jo = (JSONObject)ja.get(k);
				
				HSSFRow contentRow = worksheet.createRow(16+k);
				contentRow.setHeight((short)300);
				contentRow.createCell(1).setCellValue( (String)jo.get("name") );
				contentRow.createCell(2).setCellValue( (String)jo.get("unit") );
				HSSFCell cellQty = contentRow.createCell(3);
				cellQty.setCellValue( Integer.parseInt((String)jo.get("quantity")) );
				cellQty.setCellStyle(style3);
				HSSFCell cellPrice = contentRow.createCell(4);
				cellPrice.setCellValue( Integer.parseInt((String)jo.get("price")) );
				cellPrice.setCellStyle(style3);
				HSSFCell cellTotal = contentRow.createCell(5);
				cellTotal.setCellValue( Integer.parseInt((String)jo.get("total")) );
				cellTotal.setCellStyle(style3);
				if(k==(ja.size()-1)){
					HSSFRow totalRow = worksheet.createRow(16+k+1);
					totalRow.createCell(1).setCellValue( "합계" );
					HSSFCell cellTotal2 =totalRow.createCell(5);
					cellTotal2.setCellValue( total );
					cellTotal2.setCellStyle(style3);
				}
			}
			
		}
		
		

		response.setContentType("Application/Msexcel");
		response.setHeader("Content-Disposition", "ATTachment; Filename=excel.xls");
	}

}
