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
//	@RequestMapping(value = "/receive")
//	public ResponseEntity<String> receive(@RequestBody ElementInfoVO vo) throws Exception {
//		logger.debug(" elementinfo - receive");
//		logger.debug(vo + "");
//		HttpStatus status = HttpStatus.OK;
//		String result = "";
//		return new ResponseEntity<String>(result, status);
//	}
	@RequestMapping(value = "/element")
	public void elementInfo() throws Exception {
		
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
