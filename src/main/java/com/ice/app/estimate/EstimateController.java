package com.ice.app.estimate;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class EstimateController {
	
	private static final Logger logger = LoggerFactory.getLogger(EstimateController.class);
	
	@Autowired
	private EstimateService estimateService;
	
	@RequestMapping(value = "estimateList", method = {RequestMethod.GET,RequestMethod.POST})
	public String estimateList(Locale locale, Model model,HttpServletRequest request) {
		logger.info("estimateList");
		List<Map<String,Object>> list = estimateService.estimateList(param(request));
		model.addAttribute("list", list);
		return "estimate/estimateList";
	}
	
	@RequestMapping(value = "getEstimateListByNum/{no}", method = RequestMethod.GET)
	public String getEstimateListByNum(Locale locale, Model model,@PathVariable String no) {
		logger.info("getEstimateListByNum");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("contactNo", no);
		
		List<Map<String,Object>> list = estimateService.getEstimateListByNum(param);
		model.addAttribute("list", list);
		return "estimate/estimateSubList";
	}
	
	@RequestMapping(value = "getDetailByNum/{no}", method = RequestMethod.GET)
	public String getDetailByNum(Locale locale, Model model,@PathVariable String no) {
		logger.info("getDetailByNum");
		model.addAttribute("no", no);
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
	public String estimateInsertAction(Locale locale, Model model,HttpServletRequest request) {
		logger.info("estimateInsertAction");
		estimateService.estimateInsertAction(param(request));

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
