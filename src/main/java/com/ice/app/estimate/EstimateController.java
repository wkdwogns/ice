package com.ice.app.estimate;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class EstimateController {
	
	private static final Logger logger = LoggerFactory.getLogger(EstimateController.class);
	
	@Autowired
	private EstimateService estimateService;
	
	@RequestMapping(value = "estimateList", method = RequestMethod.GET)
	public String estimateList(Locale locale, Model model) {
		logger.info("estimateList");
		
		return "estimate/estimateList";
	}
	
	@RequestMapping(value = "getEstimateListByNum/{no}", method = RequestMethod.GET)
	public String getEstimateListByNum(Locale locale, Model model,@PathVariable String no) {
		logger.info("getEstimateListByNum");
		
		System.out.println(no);
		
		return "estimate/estimateSubList";
	}
	
	@RequestMapping(value = "getDetailByNum/{no}", method = RequestMethod.GET)
	public String getDetailByNum(Locale locale, Model model,@PathVariable String no) {
		logger.info("getDetailByNum");
		
		System.out.println(no);
		
		return "estimate/estimateDetail";
	}
	
	@RequestMapping(value = "estimateInsert", method = RequestMethod.GET)
	public String estimateInsert(Locale locale, Model model) {
		logger.info("estimateInsert");
		
		return "estimate/estimateInsert";
	}
	
	@RequestMapping(value = "estimateInsertAction", method = RequestMethod.POST)
	public String estimateInsertAction(Locale locale, Model model,HttpServletRequest request) {
		logger.info("estimateInsertAction");
		
		//estimateService.estimateInsertAction(param(request));
		System.out.println(param(request));
		
		return "redirect:/estimateList";
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
