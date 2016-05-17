package com.ice.app;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	@RequestMapping(value = "contactList", method = RequestMethod.GET)
	public String contactList(Locale locale, Model model) {
		logger.info("contactList");

		return "contact/contactList";
	}
	
	@RequestMapping(value = "contactInsert", method = RequestMethod.GET)
	public String contactInsert(Locale locale, Model model) {
		logger.info("contactInsert");

		return "contact/contactInsert";
	}
}
