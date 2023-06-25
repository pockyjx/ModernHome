package com.modernhome.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modernhome.domain.EmployeeVO;
import com.modernhome.domain.MaterialStockVO;
import com.modernhome.domain.ProductStockVO;
import com.modernhome.persistence.ProductStockDAO;
import com.modernhome.service.StockService;

@Controller
@RequestMapping(value = "/stock/*")
public class StockController {
	
	@Autowired
	private StockService sService;

	private static final Logger logger = LoggerFactory.getLogger(StockController.class);
	
	// 자재 재고 목록
	// http://localhost:8088/stock/materialStockList
	@RequestMapping(value = "/materialStockList", method = RequestMethod.GET)
	public void materialStockListGET(Model model,
									MaterialStockVO vo) throws Exception {
		
		List<MaterialStockVO> msList;
		
		if(vo.getMa_num() != null || vo.getMa_name() != null) {
			logger.debug("stockListGET(search) 호출!");
			msList = sService.searchMS(vo);
			model.addAttribute("msList", msList);
			
		}else {
			logger.debug("stockListGET() 호출!");
			msList = sService.getMsList();
			model.addAttribute("msList", msList);
		}
		
	}
	
	// 완제품 재고 목록
	// http://localhost:8088/stock/productStockList
	@RequestMapping(value = "/productStockList", method = RequestMethod.GET)
	public void productStockListGET(Model model, ProductStockVO vo) throws Exception {
		logger.debug("stockListGET() 호출!");
		
		List<ProductStockVO> psList;
		
		if(vo.getPro_num() != null || vo.getPro_name() != null) {
			logger.debug("stockListGET(search) 호출!");
			psList = sService.searchPS(vo);
			model.addAttribute("psList", psList);
			
		}else {
			logger.debug("stockListGET() 호출!");
			psList = sService.getPsList();
			model.addAttribute("psList", psList);
		}
	}
	




}
	

