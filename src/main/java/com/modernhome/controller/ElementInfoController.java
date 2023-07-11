package com.modernhome.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.modernhome.domain.ElementInfoVO;
import com.modernhome.service.ElementInfoService;

//@RestController
@Controller
@RequestMapping(value = "/elementinfo/*")
public class ElementInfoController {

	private static final Logger logger = LoggerFactory.getLogger(ElementInfoController.class);

	@Autowired
	private ElementInfoService eService;
	
	@RequestMapping(value = "/element", method = RequestMethod.GET)
	public void elementInfoGET(Model model, @RequestParam(value = "ele_numSearch", required = false) String ele_num) throws Exception {
		
		if(ele_num != null) {
			ElementInfoVO vo = new ElementInfoVO();
			vo = eService.getElementInfo(ele_num);
			logger.debug("" + vo);
			model.addAttribute("vo", vo);
		}
	}

	@RequestMapping(value = "/popupReceive")
	public void popupReceive() throws Exception {
		
	}
	@RequestMapping(value = "/popupLineQC")
	public void popupLineQC(Model model,
							@RequestParam("work_num") String work_num) throws Exception {
		List<ElementInfoVO> eiList =  eService.getWorkedList(work_num);
		model.addAttribute("eiList", eiList);
		
	}
	@RequestMapping(value = "/popupPrQC")
	public void popupPrQC(Model model,
						  @RequestParam("pr_num") String pr_num) throws Exception {
		List<ElementInfoVO> eiList =  eService.getReleasedList(pr_num);
		model.addAttribute("eiList", eiList);
		
	}
}
