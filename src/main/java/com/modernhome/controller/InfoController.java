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
import com.modernhome.domain.PageMaker;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ProductVO;
import com.modernhome.domain.ReqJoinVO;
import com.modernhome.domain.RequirementVO;
import com.modernhome.service.ItemService;
import com.modernhome.service.RequirmentService;
import com.modernhome.service.StockService;

@Controller
@RequestMapping(value = "/info/*")
public class InfoController {

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	// 의존성 주입
	@Inject
	private ItemService iService;
	
	@Autowired
	private RequirmentService rService;
	
	@Autowired
	private StockService sService;
	
	// 완제품 목록
	// http://localhost:8088/info/item/productList
	@RequestMapping(value = "/item/productList", method = RequestMethod.GET)
	public void productListGET(Model model, ProductVO vo, PageVO pvo) throws Exception {
		logger.debug("productListGET() 호출!");
		
		logger.debug(vo + "");
		
		List<ProductVO> productList;
		PageMaker pm = new PageMaker();
		
		// 검색어가 하나라도 있으면 if문 실행, 아닐 경우
		if(vo.getPro_num() != null || vo.getPro_name() != null) {
			productList = iService.getProductList(vo, pvo);
			model.addAttribute("productList", productList);
			
			pm.setPageVO(pvo);
			pm.setTotalCount(iService.getProSearchCnt(vo));
			model.addAttribute("pm", pm);
			
			model.addAttribute("productVO", vo);
			
			
		} else { 
			productList = iService.getProListPage(pvo);
//			productList = iService.getProductList();
			model.addAttribute("productList", productList);
			
			pm.setPageVO(pvo);
			pm.setTotalCount(iService.getTotalCntPro());
			
			model.addAttribute("pm", pm);
		}
		
	}
	
	// 자재 목록
	// http://localhost:8088/info/item/materialList
	@RequestMapping(value = "/item/materialList", method = RequestMethod.GET)
	public void materialListGET(Model model, MaterialVO vo, PageVO pvo) throws Exception {
		logger.debug("materialList() 호출!");
		
		List<MaterialVO> materialList;
		PageMaker pm = new PageMaker();
		
		logger.debug(vo + "");
		
		// 검색어가 하나라도 있으면 if문 실행, 아닐 경우
		if(vo.getMa_name() != null || vo.getMa_num() != null) {
			materialList = iService.getMaterialList(vo);
			model.addAttribute("materialList", materialList);
		} else {
			
			materialList = iService.getMaterialList(pvo);
			model.addAttribute("materialList", materialList);
			
			pm.setPageVO(pvo);
			pm.setTotalCount(iService.getTotalCntMate());
			
			model.addAttribute("pm", pm);
			
		}
		
	}
	
	
	// 완제품 등록 + 수정
	@RequestMapping(value = "/info/regProduct", method = RequestMethod.POST)
	public String regProductPOST(ProductVO vo) throws Exception {
		logger.debug("regProductPOST() 호출!");
		
		if(vo.getPro_num() == "") {
			logger.debug("완제품 정보 등록!");
			iService.regProduct(vo);
			
			// 완제품 재고 테이블에 재고 정보 자동 업데이트
			int maxProId = iService.getProId();
			sService.regProStock(maxProId);
			
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
	public String regMaterialPOST(MaterialVO mvo) throws Exception {
		logger.debug("regMaterialPOST() 호출!");
		
		if(mvo.getMa_num() == "") { 
			logger.debug("재고 정보 등록!");
			iService.regMaterial(mvo);
			
			// 자재 재고 테이블에 재고 정보 자동 업데이트
			int maxMaId = iService.getMaId();
			sService.regMaStock(maxMaId);
			
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
		
		List<ReqJoinVO> reqList;
		
		
		logger.debug(option);
		logger.debug(search);
		
		if(option != null || search != null) {
			logger.debug("reqListGET(search) 호출!");
			reqList = rService.getReqSearch(option, search);
			model.addAttribute("reqList", reqList);
		}else {
			logger.debug("reqListGET(all) 호출!");
			reqList = rService.getListAll();
			model.addAttribute("reqList", reqList);
		}
		
		
	}
	
	// 소요량 등록 시 팝업
	@RequestMapping(value = "/req/addPopup", method = RequestMethod.GET )
	public String popUpGET(Model model, @ModelAttribute("txt") String txt, 
							ProductVO prvo, MaterialVO mvo, PageVO pvo) throws Exception {
		
		PageMaker pm = new PageMaker();
		
		if(txt.equals("pro")) { // 완제품 목록 팝업
			
			List<ProductVO> popUpPro;
			
			if(prvo.getPro_name() != null) { // 완제품 팝업창에서 검색했을 때
				
				logger.debug("완제품 팝업(검색) 호출!");
				popUpPro = iService.getProductList(prvo, pvo); // 기존 페이징 적용된 검색 메서드 사용!
				model.addAttribute("popUpPro", popUpPro);
				
				pm.setPageVO(pvo);
				pm.setTotalCount(iService.getProSearchCnt(prvo));
				model.addAttribute("pm", pm);
				
				model.addAttribute("productVO", prvo);
				
				
				
			}else { // 완제품 팝업 처음 실행했을 때
				
				logger.debug("완제품 팝업 호출!");
				popUpPro = iService.getProListPage(pvo); // 기존 페이징 적용된 검색 메서드 사용!
				model.addAttribute("popUpPro", popUpPro);
				
				pm.setPageVO(pvo);
				pm.setTotalCount(iService.getTotalCntPro());
				
				model.addAttribute("pm", pm);
				
			}
			
			return "/info/req/popUpProduct";
			
		}else if(txt.equals("ma")) { // 자재 목록 팝업
			
			List<MaterialVO> popUpMate;
			
			if(mvo.getMa_name() != null) { // 자재 팝업창에서 검색했을 때
				
				logger.debug("자재 팝업(검색) 호출!");
				popUpMate = iService.getMaterialList(mvo); // 기존 자재 검색 메서드 사용
				model.addAttribute("popUpMate", popUpMate);
				
			}else { // 자재 팝업 처음 실행했을 때
				
				logger.debug("자재 팝업 호출!");
				popUpMate = iService.getMaterialList(pvo);
				model.addAttribute("popUpMate", popUpMate);
				
				pm.setPageVO(pvo);
				pm.setTotalCount(iService.getTotalCntMate());
				
				model.addAttribute("pm", pm);
			}
			
			return "/info/req/popUpMaterial";
		}
		
		return "/info/req/reqList";
		
	}
	
	// 소요량 등록 + 수정
	@RequestMapping(value = "/info/regRequirement", method = RequestMethod.POST)
	public String regRequirementPOST(ReqJoinVO vo) throws Exception {
		logger.debug("regMaterialPOST() 호출!");
		
		logger.debug(vo + "");
		
		if(vo.getReq_num() == "") {
			logger.debug("소요량 정보 등록!");
			rService.regRequirement(vo);
		}else {
			logger.debug("소요량 정보 수정!");
			rService.modifyRequirement(vo);;
			
		}
		
		return "redirect:/info/req/reqList";
	}
	
	// 소요량 삭제
	@RequestMapping(value = "/info/delRequirement")
	public String deleteRequirement(@RequestParam(value = "selectedReqId", required = false) Integer[] selectedReqIds) throws Exception {
		logger.debug("deleteRequirement() 호출!");
		logger.debug(selectedReqIds+"");
		
		if(selectedReqIds != null) {
			for(Integer req_id : selectedReqIds) {
				rService.deleteRequirement(req_id);
			}
		}
		
		return "redirect:/info/req/reqList";
		
	}
	
	// BOM
	// http://localhost:8088/info/req/BOM
	@RequestMapping(value = "/req/BOM", method = RequestMethod.GET)
	public void BOM(@RequestParam(value = "pro_id") Integer pro_id, Model model) throws Exception {
		logger.debug("BOM() 호출!");
		
		List<ReqJoinVO> BOMList = rService.getBOMList(pro_id);
		model.addAttribute("BOMList", BOMList);
		
	}
	
	// BOMList
	// http://localhost:8088/info/req/BOMList
	@RequestMapping(value = "/req/BOMList", method = RequestMethod.GET)
	public void BOMList(Model model) throws Exception {
		List<ReqJoinVO> BOMList = rService.getListAll();
		model.addAttribute("BOMList", BOMList);
	}
	
}
