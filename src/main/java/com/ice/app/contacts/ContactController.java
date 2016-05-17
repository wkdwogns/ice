package com.ice.app.contacts;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
	
	@RequestMapping(value = "contactList", method = RequestMethod.GET)
	public String contactList(Locale locale, Model model) {
		logger.info("contactList");
		Map<String,Object> param = new HashMap<String,Object>();
		List<Map<String,Object>> list = contactService.contactList(param);
		model.addAttribute("list", list);
		return "contact/contactList";
	}
	
	@RequestMapping(value = "contactInsert", method = RequestMethod.GET)
	public String contactInsert(Locale locale, Model model) {
		logger.info("contactInsert");

		return "contact/contactInsert";
	}
}
