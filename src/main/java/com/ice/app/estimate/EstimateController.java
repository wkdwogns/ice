package com.ice.app.estimate;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
}
