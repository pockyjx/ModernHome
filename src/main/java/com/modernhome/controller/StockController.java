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
	public void materialStockListGET(Model model) throws Exception {
		logger.debug("stockListGET() 호출!");
		
		// 자재 재고 목록
		List<MaterialStockVO> msList = sService.getMsList();
		model.addAttribute("msList", msList);
	}
	
	// 완제품 재고 목록
	// http://localhost:8088/stock/productStockList
	@RequestMapping(value = "/productStockList", method = RequestMethod.GET)
	public void productStockListGET(Model model) throws Exception {
		logger.debug("stockListGET() 호출!");
		
		// 완제품 재고 목록
		List<ProductStockVO> psList = sService.getPsList();
		model.addAttribute("psList", psList);
	}
	
	// 재고 검색 결과
	@RequestMapping(value = "/stockSearchResult", method = RequestMethod.GET)
	public void stockSearchResult(@ModelAttribute("wh_name") String wh_name,
								@ModelAttribute("itemOption") String itemOption,
								@ModelAttribute("search") String search) {
		
		logger.debug("stockSearchResult() 호출!");
		logger.debug(wh_name);
		logger.debug(itemOption);
		logger.debug(search);
		
			
		}
		
	}
	

