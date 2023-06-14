package com.modernhome.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modernhome.domain.ProductVO;
import com.modernhome.service.ItemService;

@Controller
@RequestMapping(value = "/info/*")
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	// 의존성 주입
	@Inject
	private ItemService iService;
	
	// 완제품 목록
	// http://localhost:8088/info/item/productList
	@RequestMapping(value = "/item/productList", method = RequestMethod.GET)
	public void productListGET(Model model) {
		logger.debug("productListGET() 호출!");
		
		List<ProductVO> productList = iService.getProductList();
		model.addAttribute("productList", productList);
		
	}
	
}
