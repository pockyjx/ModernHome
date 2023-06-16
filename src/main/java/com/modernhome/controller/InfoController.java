package com.modernhome.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.ProductVO;
import com.modernhome.domain.RequirementVO;
import com.modernhome.service.ItemService;
import com.modernhome.service.RequirmentService;

@Controller
@RequestMapping(value = "/info/*")
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	// 의존성 주입
	@Inject
	private ItemService iService;
	
	@Autowired
	private RequirmentService rService;
	
	// 완제품 목록
	// http://localhost:8088/info/item/productList
	@RequestMapping(value = "/item/productList", method = RequestMethod.GET)
	public void productListGET(Model model) {
		logger.debug("productListGET() 호출!");
		
		List<ProductVO> productList = iService.getProductList();
		model.addAttribute("productList", productList);
		
	}
	
	// 자재 목록
	// http://localhost:8088/info/item/materialList
	@RequestMapping(value = "/item/materialList", method = RequestMethod.GET)
	public void materialListGET(Model model) {
		logger.debug("materialList() 호출!");
		
		List<MaterialVO> materialList = iService.getMaterialList();
		model.addAttribute("materialList", materialList);
	}
	
	// 검색 결과
	@RequestMapping(value = "/item/itemSearchResult", method = RequestMethod.POST)
	public void itemSearchResultPOST(@ModelAttribute("itemType") String itemType,
									@ModelAttribute("itemOption") String itemOption,
									@ModelAttribute("search") String search,
									Model model) {
		
		logger.debug("itemType : " + itemType);
		logger.debug("itemOption : " + itemOption);
		logger.debug("search : " + search);
		
		List<ProductVO> proSearchList; // 완제품 결과 목록
		List<MaterialVO> maSearchList; // 자재 결과 목록
		
		if(itemType.equals("product")) {
			
			// 완제품 선택 시 완제품 테이블에서 조건 검색
			proSearchList = iService.getProductList(itemOption, search);
			model.addAttribute("proSearchList", proSearchList);
			
		}else {
			
			// 자재 선택 시, 자재 테이블에서 조건 검색
			maSearchList = iService.getMaterialList(itemOption, search);
			model.addAttribute("maSearchList", maSearchList);
			
		}
		
	}
	
	///////////////////////////////////////////////////////////////////////
	
	// 소요량 목록
	// http://localhost:8088/info/req/reqList
	@RequestMapping(value = "/req/reqList", method = RequestMethod.GET)
	public void reqListGET(Model model) throws Exception {
		logger.debug("reqList() 호출!");
		
		List<RequirementVO> reqList = rService.getListAll();
		model.addAttribute("reqList", reqList);
	}
	
	
	
}
