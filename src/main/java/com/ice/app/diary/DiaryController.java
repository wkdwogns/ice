package com.ice.app.diary;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ice.app.util.Utilities;

@Controller
public class DiaryController {
	
	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired
	private DiaryService diaryService;
	
	@Value("${save.path}")
	private String savePath; 
	
	@RequestMapping(value = "diaryList", method = {RequestMethod.GET,RequestMethod.POST})
	public String diaryList(Locale locale, Model model,HttpServletRequest request) {
		logger.info("diaryList");
		
		String pIndex = request.getParameter("pIndex");
		if(pIndex ==null || pIndex.equals("")){pIndex = "1";}
		
		int tot = diaryService.diaryListCnt(param(request));
		Utilities util = new Utilities();
		Map<String,Object> param = util.page(10,tot,pIndex);
		param.putAll(param(request));
		
		List<Map<String,Object>> list = diaryService.diaryList(param);
		model.addAttribute("list", list);
		model.addAttribute("info",param);
		
		return "diary/diaryList";
	}
	
	@RequestMapping(value = "diaryInsert", method = {RequestMethod.GET})
	public String diaryInsert(Locale locale, Model model,HttpServletRequest request) {
		logger.info("diaryInsert");

		return "diary/diaryInsert";
	}
	
	@RequestMapping(value = "diaryInsertAction", method = {RequestMethod.POST})
	public String diaryInsertAction(Locale locale, Model model,HttpServletRequest request,@RequestParam("files") MultipartFile[] files) {
		logger.info("diaryInsertAction");
		
		diaryService.diaryInsertAction(param(request));
		
		String fileName = null;
    	String savepath = "C:/img/";
    	
    	File saveFolder = new File(savePath);
		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.mkdirs();
		}
		
		if (files != null && files.length >0) {
    		for(int i =0 ;i< files.length; i++){
	            try {
	                fileName = files[i].getOriginalFilename();
	                byte[] bytes = files[i].getBytes();
	                BufferedOutputStream buffStream = 
	                        new BufferedOutputStream(new FileOutputStream(new File(savePath + fileName)));
	                buffStream.write(bytes);
	                buffStream.close();
	                
	                String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
	                int k = -1;
	                k = fileName.lastIndexOf(".");
	                String realFileName = now +"_"+i+ fileName.substring(k, fileName.length());
	                
	                File oldFile = new File(savePath + fileName);
	                File newFile = new File(savePath+realFileName);
	                oldFile.renameTo(newFile);
	                
	                Map<String,Object> param = new HashMap<String, Object>();
	                param.put("type", "d");
	                param.put("contactNo",request.getParameter("contactNo"));
	                param.put("realNm",fileName);
	                param.put("virtualNm",realFileName);
	                diaryService.imageInsertAction(param);
	            } catch (Exception e) {
	                
	            }
    		}
        }
		return "redirect:/diaryList";
	}
	
	
	@RequestMapping(value = "diaryDelete/{no}", method = {RequestMethod.GET})
	public String diaryDelete(Locale locale, Model model,@PathVariable String no) {
		logger.info("diaryDelete");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("no", no);
		diaryService.diaryDelete(param);
		
		return "redirect:/diaryList";
	}
	@RequestMapping(value = "diaryDetail", method = {RequestMethod.POST})
	public String diaryDetail(Locale locale, Model model,HttpServletRequest request) {
		logger.info("diaryDetail");
		Map<String,Object> info = diaryService.diaryDetail(param(request));
		
		List<Map<String,Object>> images = diaryService.diaryImageDetail(param(request));
		model.addAttribute("info", info);
		model.addAttribute("images", images);
		return "diary/diaryDetail";
	}
	
	@RequestMapping(value = "diaryUpdate/{no}", method = {RequestMethod.GET})
	public String diaryUpdate(Locale locale, Model model,@PathVariable String no) {
		logger.info("diaryUpdate");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("no", no);
		param.put("type", "d");
		Map<String,Object> info = diaryService.diaryDetail(param);
		
		List<Map<String,Object>> images = diaryService.diaryImageDetail(param);
		model.addAttribute("updateNo", no);
		model.addAttribute("info", info);
		model.addAttribute("images", images);
		return "diary/diaryUpdate";
	}
	
	@RequestMapping(value = "diaryUpdateAction", method = {RequestMethod.POST})
	public String diaryUpdateAction(Locale locale, Model model,HttpServletRequest request,@RequestParam("files") MultipartFile[] files) {
		logger.info("diaryUpdateAction");
		
		diaryService.diaryUpdateAction(param(request));
		
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
	                param.put("type", "d");
	                param.put("no",request.getParameter("no"));
	                param.put("contactNo",request.getParameter("contactNo"));
	                param.put("realNm",fileName);
	                param.put("virtualNm",realFileName);
	                diaryService.imageUpdateAction(param);
	            } catch (Exception e) {
	                
	            }
    		}
        }
		return "redirect:/diaryList";
	}
	
	@RequestMapping(value = "imageDelete", method = {RequestMethod.POST})
	public String imageDelete(Locale locale, Model model,HttpServletRequest request) {
		logger.info("imageDelete");

		diaryService.imageDelete(param(request));
		
		String s = "c:/img/"+request.getParameter("virtualNm");
	    File f = new File(s);
	    if (f.delete()) {
	      System.out.println("���� �Ǵ� ���丮�� ���������� �������ϴ�: " + s);
	    } else {
	      System.err.println("���� �Ǵ� ���丮 ����� ����: " + s);
	    }
	    
		return "redirect:/diaryUpdate/"+request.getParameter("updateNo");
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
}
