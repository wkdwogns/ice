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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value = "contactUpdate/{no}", method = RequestMethod.GET)
	public String contactUpdate(Locale locale, Model model,HttpServletRequest request,@PathVariable String no) {
		logger.info("contactUpdate");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("no", no);
		Map<String,Object> info = contactService.contactUpdate(param);
		model.addAttribute("info", info);
		
		return "contact/contactUpdate";
	}
	
	@RequestMapping(value = "contactUpdateAction", method = RequestMethod.POST)
	public String contactUpdateAction(Locale locale, Model model,HttpServletRequest request) {
		logger.info("contactUpdateAction");
		
		contactService.contactUpdateAction(param(request));
		
		return "redirect:/contactList";
	}
	
	@RequestMapping(value = "contactListAjax", method = {RequestMethod.POST})
	@ResponseBody
	public List<Map<String,Object>> contactListAjax(Locale locale, Model model,HttpServletRequest request) {
		logger.info("contactListAjax");
		List<Map<String,Object>> list = contactService.contactList(param(request));
		return list;
	}
	
	@RequestMapping(value = "contactDelete/{no}", method = RequestMethod.GET)
	public String contactDelete(Locale locale, Model model,@PathVariable String no) {
		logger.info("contactDelete");
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("no", no);
		contactService.contactDelete(param);
		
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
