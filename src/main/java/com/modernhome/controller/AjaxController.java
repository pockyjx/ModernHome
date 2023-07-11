package com.modernhome.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.modernhome.domain.ElementInfoVO;
import com.modernhome.service.ElementInfoService;

@RestController
@RequestMapping(value = "/elements")
public class AjaxController {

	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	@Autowired
	private ElementInfoService eService;
	
	@RequestMapping(value = "/insert")
	public ResponseEntity<String> insertElement(@RequestBody List<ElementInfoVO>  evoList) throws Exception {
		logger.debug(evoList.size()+"");
		for(ElementInfoVO vo : evoList) {
//			logger.debug(vo.getEle_num()+"");
			eService.regElements(vo);
		}

		return new ResponseEntity<String>("Job Complete", HttpStatus.OK);
	}
	@RequestMapping(value = "/updateMR")
	public ResponseEntity<String> updateMR(@RequestBody ElementInfoVO  vo) throws Exception {
		eService.updateMR(vo);
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+vo);
		return new ResponseEntity<String>("Job Complete", HttpStatus.OK);
	}
	@RequestMapping(value = "/updateLQC")
	public ResponseEntity<String> updateLQC(@RequestBody List<ElementInfoVO>  evoList) throws Exception {
		logger.debug(evoList.size()+"");
		for(ElementInfoVO vo : evoList) {
//			logger.debug(vo.getEle_num()+"");
			eService.updateLQC(vo);
		}
		return new ResponseEntity<String>("Job Complete", HttpStatus.OK);
	}
	@RequestMapping(value = "/updatePrQC")
	public ResponseEntity<String> updatePrQC(@RequestBody List<ElementInfoVO>  evoList) throws Exception {
		logger.debug(evoList.size()+"");
		for(ElementInfoVO vo : evoList) {
//			logger.debug(vo.getEle_num()+"");
			eService.updatePrQC(vo);
		}
		return new ResponseEntity<String>("Job Complete", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/updatePR")
	public ResponseEntity<String> updatePR(@RequestParam("oo_num") String oo_num, @RequestParam("pr_id") String pr_id) throws Exception {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("oo_num", oo_num);
		parameterMap.put("pr_id", pr_id);
		
		eService.updatePR(parameterMap);
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+vo);
		return new ResponseEntity<String>("Job Complete", HttpStatus.OK);
	}
	@RequestMapping(value = "/updateSHP")
	public ResponseEntity<String> updateSHP(@RequestParam("pr_num") String pr_num, @RequestParam("shp_id") String shp_id) throws Exception {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("pr_num", pr_num);
		parameterMap.put("shp_id", shp_id);
		
		eService.updateSHP(parameterMap);
		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+parameterMap);
		return new ResponseEntity<String>("Job Complete", HttpStatus.OK);
	}
}
