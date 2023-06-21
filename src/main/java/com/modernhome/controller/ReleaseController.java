package com.modernhome.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.modernhome.service.ReleaseService;

@Controller
@RequestMapping(value = "/release/*")
public class ReleaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReleaseController.class);
	
	@Autowired
	ReleaseService rService;
	
	// http://localhost:8088/release/materialRelease
	@RequestMapping(value = "/materialRelease")
	public void materialRelease(Model model) throws Exception {
		
		model.addAttribute("mtReleaseList", rService.getMaterialReleaseList());
		
	}
	// http://localhost:8088/release/productRelease
	@RequestMapping(value = "/productRelease")
	public void productReleaseRelease(Model model) throws Exception {

		model.addAttribute("prReleaseList", rService.getProductReleaseList());
		
	}
}
