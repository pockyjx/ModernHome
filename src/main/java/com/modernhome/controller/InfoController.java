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
import org.springframework.web.bind.annotation.RequestParam;

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
		
//		logger.debug("itemType : " + itemType);
//		logger.debug("itemOption : " + itemOption);
//		logger.debug("search : " + search);
		
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
	
	// 완제품 등록 + 수정
	@RequestMapping(value = "/info/regProduct", method = RequestMethod.POST)
	public String regProductPOST(ProductVO vo) {
		logger.debug("regProductPOST() 호출!");
		
		if(vo.getPro_num() == "") {
			logger.debug("완제품 정보 등록!");
			iService.regProduct(vo);
		}else {
			logger.debug("완제품 정보 수정!");
			iService.modifyProduct(vo);
		}
		
		return "redirect:/info/item/productList";
	}
	
	// 완제품 삭제
	@RequestMapping(value = "/info/delProduct")
	public String deleteProduct(@RequestParam(value = "selectedProId", required = false) Integer[] selectedProIds) {
		logger.debug("deleteProduct() 호출!");
		logger.debug(selectedProIds+"");
		
		if(selectedProIds != null) {
			for(Integer pro_id : selectedProIds) {
				iService.deleteProduct(pro_id);
			}
		}
		
		return "redirect:/info/item/productList";
	}
	
	// 자재 등록 + 수정
	@RequestMapping(value = "/info/regMaterial", method = RequestMethod.POST)
	public String regMaterialPOST(MaterialVO mvo) {
		logger.debug("regMaterialPOST() 호출!");
		
		if(mvo.getMa_num() == "") {
			logger.debug("재고 정보 등록!");
			iService.regMaterial(mvo);
		}else {
			logger.debug("재고 정보 수정!");
			iService.modifyMaterial(mvo);
		}
		
		return "redirect:/info/item/materialList";
		
	}
	
	// 자재 삭제
	@RequestMapping(value = "/info/delMaterial")
	public String deleteMaterial(@RequestParam(value = "selectedMaId", required = false) Integer[] selectedMaIds) {
		logger.debug("deleteMaterial() 호출!");
		logger.debug(selectedMaIds+"");
		
		if(selectedMaIds != null) {
			for(Integer ma_id : selectedMaIds) {
				iService.delMaterial(ma_id);
			}
		}
		
		return "redirect:/info/item/materialList";
		
	}
	
	///////////////////////////////////////////////////////////////////////
	
	// 소요량 목록
	// http://localhost:8088/info/req/reqList
	@RequestMapping(value = "/req/reqList", method = RequestMethod.GET)
	public void reqListGET(Model model, 
						@ModelAttribute("option") String option, 
						@ModelAttribute("search") String search) throws Exception {
		
		logger.debug("reqListGET() 호출!");
		
		List<RequirementVO> reqList;
		
		
		logger.debug(option);
		logger.debug(search);
		
		if(option != null && search != null) {
			reqList = rService.getReqSearch(option, search);
			model.addAttribute("reqList", reqList);
		}else {
			reqList = rService.getListAll();
			model.addAttribute("reqList", reqList);
		}
		
		
	}
	
	// 소요량 등록 시 완제품 코드 조회 (팝업)
	// http://localhost:8088/info/req/popUpProduct
	@RequestMapping(value = "/req/popUpProduct", method = RequestMethod.GET )
	public void popUpProductGET(Model model) {
		logger.debug("popUpProductGET() 호출!");
		
		List<ProductVO> popUpPro = iService.getPopUpPro();
		model.addAttribute("popUpPro", popUpPro);
	}
	

	
}
