package com.ice.app.estimate;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ice.app.diary.DiaryService;
import com.ice.app.util.Utilities;


/**
 * Handles requests for the application home page.
 */
@Controller
public class EstimateController {
	
	private static final Logger logger = LoggerFactory.getLogger(EstimateController.class);
	
	@Autowired
	private EstimateService estimateService;
	
	@Autowired
	private DiaryService diaryService;
	
	@RequestMapping(value = "estimateList", method = {RequestMethod.GET,RequestMethod.POST})
	public String estimateList(Locale locale, Model model,HttpServletRequest request) {
		logger.info("estimateList");
		String pIndex = request.getParameter("pIndex");
		if(pIndex ==null || pIndex.equals("")){pIndex = "1";}
		
		//param.putAll(info);
		int tot = estimateService.estimateListCnt(param(request));
		Utilities util = new Utilities();
		Map<String,Object> param = util.page(10,tot,pIndex);
		param.putAll(param(request));
		List<Map<String,Object>> list = estimateService.estimateList(param);
		model.addAttribute("list", list);
		List<Map<String,Object>> diaryList = diaryService.diaryList(param);
		model.addAttribute("diaryList", diaryList);
		model.addAttribute("info", param);
		return "estimate/estimateList";
	}
	
	@RequestMapping(value = "getEstimateListByNum/{no}", method = {RequestMethod.GET,RequestMethod.POST})
	public String getEstimateListByNum(Locale locale, Model model,@PathVariable String no,HttpServletRequest request) {
		logger.info("getEstimateListByNum");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("contactNo", no);
		param.put("constructionDate", request.getParameter("constructionDate"));
		
		List<Map<String,Object>> list = estimateService.getEstimateListByNum(param);
		model.addAttribute("list", list);
		model.addAttribute("contactNo", no);
		return "estimate/estimateSubList";
	}
	
	@RequestMapping(value = "getDetailByNum/{no}", method = {RequestMethod.GET,RequestMethod.POST})
	public String getDetailByNum(Locale locale, Model model,@PathVariable String no,HttpServletRequest request) {
		logger.info("getDetailByNum");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("no", no);
		List<Map<String,Object>> images = estimateService.diaryImageDetail(param);
		
		model.addAttribute("no", no);
		model.addAttribute("images", images);
		model.addAttribute("conDt", request.getParameter("constructionDate"));
		return "estimate/estimateDetail";
	}
	
	@RequestMapping(value = "getDetailByNumAjax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getDetailByNumAjax(Locale locale, Model model,HttpServletRequest request) {
		logger.info("getDetailByNumAjax");
		
		Map<String,Object> info = estimateService.getDetailByNum(param(request));
		
		return info;
	}
	
	@RequestMapping(value = "estimateInsert", method = RequestMethod.GET)
	public String estimateInsert(Locale locale, Model model) {
		logger.info("estimateInsert");
		
		return "estimate/estimateInsert";
	}
	
	@RequestMapping(value = "estimateInsertAction", method = RequestMethod.POST)
	public String estimateInsertAction(Locale locale, Model model,HttpServletRequest request,@RequestParam("files") MultipartFile[] files) {
		logger.info("estimateInsertAction");
		
		estimateService.estimateInsertAction(param(request));
		
		String fileName = null;
    	String savepath = "C:/img/";
    	
    	File saveFolder = new File(savepath);
		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.mkdirs();
		}
		
		if (files != null && files.length >0) {
    		for(int i =0 ;i< files.length; i++){
	            try {
	                fileName = files[i].getOriginalFilename();
	                byte[] bytes = files[i].getBytes();
	                BufferedOutputStream buffStream = 
	                        new BufferedOutputStream(new FileOutputStream(new File(savepath + fileName)));
	                buffStream.write(bytes);
	                buffStream.close();
	                
	                String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
	                int k = -1;
	                k = fileName.lastIndexOf(".");
	                String realFileName = now +"_"+i+ fileName.substring(k, fileName.length());
	                
	                File oldFile = new File(savepath + fileName);
	                File newFile = new File(savepath+realFileName);
	                oldFile.renameTo(newFile);
	                
	                Map<String,Object> param = new HashMap<String, Object>();
	                param.put("type", "e");
	                param.put("contactNo",request.getParameter("contactNo"));
	                param.put("realNm",fileName);
	                param.put("virtualNm",realFileName);
	                estimateService.imageUpdateAction(param);
	            } catch (Exception e) {
	                
	            }
    		}
        }

		return "redirect:/estimateList";
	}
	
	@RequestMapping(value = "estimateDelete", method = RequestMethod.POST)
	public String estimateDelete(Locale locale, Model model,HttpServletRequest request) {
		logger.info("estimateDelete");
		estimateService.estimateDelete(param(request));
		String contactNo = request.getParameter("contactNo");
		String constructionDate = request.getParameter("constructionDate");
		return "redirect:/getEstimateListByNum/"+contactNo+"?constructionDate="+constructionDate;
	}
	
	@RequestMapping(value = "estimateUpdate", method = {RequestMethod.GET,RequestMethod.POST})
	public String estimateUpdate(Locale locale,Model model,HttpServletRequest request) {
		logger.info("estimateUpdate");
		
		List<Map<String,Object>> images = estimateService.diaryImageDetail(param(request));
		model.addAttribute("images", images);
		model.addAttribute("no", request.getParameter("no"));
		return "estimate/estimateUpdate";
	}
	
	@RequestMapping(value = "estimateUpdateAction", method = RequestMethod.POST)
	public String estimateUpdateAction(Locale locale, Model model,HttpServletRequest request,@RequestParam("files") MultipartFile[] files) {
		logger.info("estimateUpdateAction");
		
		estimateService.estimateUpdateAction(param(request));
		
		String fileName = null;
    	String savepath = "C:/img/";
    	
		if (files != null && files.length >0) {
    		for(int i =0 ;i< files.length; i++){
	            try {
	                fileName = files[i].getOriginalFilename();
	                byte[] bytes = files[i].getBytes();
	                BufferedOutputStream buffStream = 
	                        new BufferedOutputStream(new FileOutputStream(new File(savepath + fileName)));
	                buffStream.write(bytes);
	                buffStream.close();
	                
	                String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
	                int k = -1;
	                k = fileName.lastIndexOf(".");
	                String realFileName = now +"_"+i+ fileName.substring(k, fileName.length());
	                
	                File oldFile = new File(savepath + fileName);
	                File newFile = new File(savepath+realFileName);
	                oldFile.renameTo(newFile);
	                
	                Map<String,Object> param = new HashMap<String, Object>();
	                param.put("type", "e");
	                param.put("contactNo",request.getParameter("contactNo"));
	                param.put("realNm",fileName);
	                param.put("virtualNm",realFileName);
	                estimateService.imageUpdateAction(param);
	            } catch (Exception e) {
	                
	            }
    		}
        }

		return "redirect:/getDetailByNum/"+request.getParameter("no");
	}
	
	@RequestMapping(value = "estimateImageDelete", method = {RequestMethod.POST})
	public String estimateimageDelete(Locale locale, Model model,HttpServletRequest request) {
		logger.info("estimateImageDelete");

		diaryService.imageDelete(param(request));
		
		String s = "c:/img/"+request.getParameter("virtualNm");
	    File f = new File(s);
	    if (f.delete()) {
	      System.out.println("���� �Ǵ� ���丮�� ���������� �������ϴ�: " + s);
	    } else {
	      System.err.println("���� �Ǵ� ���丮 ����� ����: " + s);
	    }
	    
		return "redirect:/estimateUpdate?no="+request.getParameter("no");
	}
	
	@RequestMapping(value = "downloadExcel", method = {RequestMethod.GET})
	public void downLoadExcel(Locale locale, Model model,HttpServletRequest request) throws FileNotFoundException {
		
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> param(HttpServletRequest request){
		Map<String,Object> param = new HashMap<String, Object>();
		Enumeration<String> em =  request.getParameterNames();
		
		while(em.hasMoreElements()){
			String name=em.nextElement();
			param.put(name, request.getParameter(name));
		}
		return param;
	}
	
	@RequestMapping("excel")
	public String excelTransform(Map<String,Object> ModelMap) throws Exception{
	List<Object> excelList= null;
	      //excelList = service.getAllObjects(target);
	            
	   ModelMap.put("excelList", "1");
	      ModelMap.put("target", "2");
	      return "excelView";
	}
}
