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
import com.modernhome.domain.PageMaker;
import com.modernhome.domain.PageVO;
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
									MaterialStockVO vo, PageVO pvo) throws Exception {
		
		List<MaterialStockVO> msList;
		PageMaker pm = new PageMaker();
		
		if(vo.getMa_num() != null || vo.getMa_name() != null) {
			logger.debug("stockListGET(search) 호출!");
			msList = sService.searchMS(vo, pvo);
			model.addAttribute("msList", msList);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(sService.getMsSearchCnt(vo));
			model.addAttribute("pm", pm);
			
			// 검색 정보 전달
			model.addAttribute("msvo", vo);
			
		}else {
			logger.debug("stockListGET() 호출!");
			msList = sService.getMsList(pvo);
			model.addAttribute("msList", msList);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(sService.getTotalCntMs());
			
			model.addAttribute("pm", pm);
		}
		
	}
	
	// 완제품 재고 목록
	// http://localhost:8088/stock/productStockList
	@RequestMapping(value = "/productStockList", method = RequestMethod.GET)
	public void productStockListGET(Model model, ProductStockVO vo, 
									PageVO pvo) throws Exception {
		logger.debug("stockListGET() 호출!");
		
		List<ProductStockVO> psList;
		PageMaker pm = new PageMaker();
		
		if(vo.getPro_num() != null || vo.getPro_name() != null) {
			logger.debug("stockListGET(search) 호출!");
			psList = sService.searchPS(vo, pvo);
			model.addAttribute("psList", psList);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(sService.getPsSearchCnt(vo));
			model.addAttribute("pm", pm);
			
			// 검색 정보 전달
			model.addAttribute("psvo", vo);
			
		}else {
			logger.debug("stockListGET() 호출!");
			psList = sService.getPsList(pvo);
			model.addAttribute("psList", psList);
			
			// 페이징 정보 전달
			pm.setPageVO(pvo);
			pm.setTotalCount(sService.getTotalCntPs());
			
			model.addAttribute("pm", pm);
			
		}
	}
	




}
	

