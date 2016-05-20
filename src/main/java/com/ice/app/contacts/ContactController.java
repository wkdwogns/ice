package com.ice.app.contacts;

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

/**
 * Handles requests for the application home page.
 */
@Controller
public class ContactController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContactController.class);
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value = "contactList", method = {RequestMethod.GET,RequestMethod.POST})
	public String contactList(Locale locale, Model model,HttpServletRequest request) {
		logger.info("contactList");
		List<Map<String,Object>> list = contactService.contactList(param(request));
		model.addAttribute("list", list);
		return "contact/contactList";
	}
	
	@RequestMapping(value = "contactInsert", method = RequestMethod.GET)
	public String contactInsert(Locale locale, Model model) {
		logger.info("contactInsert");

		return "contact/contactInsert";
	}
	
	@RequestMapping(value = "contactInsertAction", method = RequestMethod.POST)
	public String contactInsertAction(Locale locale, Model model,HttpServletRequest request) {
		logger.info("contactInsertAction");
		
		contactService.contactInsertAction(param(request));
		
		return "redirect:/contactList";
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
