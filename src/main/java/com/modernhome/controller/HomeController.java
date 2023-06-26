package com.modernhome.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/")
	public String root(HttpSession session) {
		logger.debug(" C : root() 호출! ");
		if(session.getAttribute("emp_id") == null) {
			return "redirect:/employee/login";
		}
		session.setAttribute("emp_id", "20230002");
		return "main";
	}
	
}
