package com.ice.app.material;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
public class MaterialController {
	
	private static final Logger logger = LoggerFactory.getLogger(MaterialController.class);
	
	@RequestMapping(value = "materialList", method = {RequestMethod.GET,RequestMethod.POST})
	public String materialList(Locale locale, Model model,HttpServletRequest request) {
		logger.info("materialList");
		
		return "material/materialList";
	}
	
	@RequestMapping(value = "materialInsert", method = {RequestMethod.POST})
	public String materialInsert(Locale locale, Model model,HttpServletRequest request) {
		logger.info("materialInsert");
		
		return "material/materialInsert";
	}
}