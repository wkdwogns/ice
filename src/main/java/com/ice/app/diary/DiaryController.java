package com.ice.app.diary;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DiaryController {
	
	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired
	private DiaryService diaryService;
	
	
	@RequestMapping(value = "diaryList", method = {RequestMethod.GET,RequestMethod.POST})
	public String diaryList(Locale locale, Model model,HttpServletRequest request) {
		logger.info("diaryList");
		//List<Map<String,Object>> list = diaryService.diaryList(param(request));
		//model.addAttribute("list", list);
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
		System.out.println(param(request));
		String fileName = null;
    	String msg = "";
    	
    	File saveFolder = new File("C:/img/");
		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.mkdirs();
		}
		
		if (files != null && files.length >0) {
    		for(int i =0 ;i< files.length; i++){
	            try {
	                fileName = files[i].getOriginalFilename();
	                byte[] bytes = files[i].getBytes();
	                BufferedOutputStream buffStream = 
	                        new BufferedOutputStream(new FileOutputStream(new File("C:/img/" + fileName)));
	                buffStream.write(bytes);
	                buffStream.close();
	                msg += "You have successfully uploaded " + fileName +"<br/>";
	            } catch (Exception e) {
	                return "You failed to upload " + fileName + ": " + e.getMessage() +"<br/>";
	            }
    		}
        } 

		return "diary/diaryInsert";
	}
	
	@RequestMapping(value = "diaryDetail", method = {RequestMethod.POST})
	public String diaryDetail(Locale locale, Model model,HttpServletRequest request) {
		logger.info("diaryDetail");
		System.out.println(request.getParameter("no"));
		return "diary/diaryDetail";
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
