package com.modernhome.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.modernhome.domain.ClientVO;
import com.modernhome.domain.InorderVO;
import com.modernhome.domain.MaterialVO;
import com.modernhome.domain.WarehouseVO;
import com.modernhome.service.ClientService;
import com.modernhome.service.InorderService;
import com.modernhome.service.ItemService;
import com.modernhome.service.WarehouseService;

@Controller
@RequestMapping(value = "/wms/*")
public class WmsController {

	WarehouseVO wvo = null;
	InorderVO iovo = null;
	
    private static final Logger logger = LoggerFactory.getLogger(WmsController.class);
    
    // 의존성 주입
    @Inject
    private WarehouseService wService;
    
    @Autowired
    private InorderService ioService;
    
    @Autowired
    private ItemService iService;
    
    @Autowired
    private ClientService cService;
    
    
    // 창고 조회
    // http://localhost:8088/wms/warehouse/warehouselist
    @RequestMapping(value = "/warehouse/warehouselist", method = RequestMethod.GET)
    public void warehouseGET(Model model, WarehouseVO wvo) throws Exception{
    	logger.debug(" warehouseGET() 호출 ");
    	
    	// 검색어가 하나라도 있으면 if문 실행, 아닐경우 else문 실행 
    	if(wvo.getWh_type() != null || wvo.getWh_name() != null) {
    		logger.debug("검색어 O, 검색된 데이터만 출력 " + wvo);
    		// 서비스 -> 창고 목록 가져오기
        	List<WarehouseVO> warehouseList = wService.warehouseListSearch(wvo);
        	// Model 객체에 저장
        	model.addAttribute("warehouseList", warehouseList);
    	}else {
    		logger.debug("검색어 X, 전체 데이터 출력 " + wvo);
    		// 서비스 -> 창고 목록 가져오기
        	List<WarehouseVO> warehouseList = wService.warehouseList();
        	// Model 객체에 저장
        	model.addAttribute("warehouseList", warehouseList);
    	}
    }
    
    // 창고 등록 + 수정
    @RequestMapping(value = "/wms/regWarehouse", method = RequestMethod.POST)
    public String regWarehousePOST(WarehouseVO wvo) {
    		
    	if(wvo.getWh_num() == "") {
    		logger.debug("regWarehousePOST() 호출-창고등록");
    		logger.debug("wvo : " + wvo);
    		
    		wService.regWarehouse(wvo);
    	}else {
    		logger.debug("regWarehousePOST() 호출-창고수정");
			logger.debug("wvo : " + wvo);
			
			wService.updateWarehouse(wvo);
    	}	
    		
    		return "redirect:/wms/warehouse/warehouselist";
    }
    
    // 창고 삭제
    @RequestMapping(value = "/wms/deleteWarehouse")
    public String deleteWarehouse(@RequestParam(value = "selectedWhId", required = false) Integer[] selectedWhIds) {
    	
    	if(selectedWhIds != null) {
		    for (Integer wh_id : selectedWhIds) {
		    	wService.deleteWarehouse(wh_id);
		    }
		}
	    
	    return "redirect:/wms/warehouse/warehouselist";
    }
    
    // --------------------------------------------------------
    // 발주 조회
    // http://localhost:8088/wms/inorder/inorderlist
    @RequestMapping(value = "/inorder/inorderlist",method = RequestMethod.GET)
    public void inorderGET(Model model, 
    		@ModelAttribute("istartDate") String istartDate, 
    		@ModelAttribute("iendDate") String iendDate,
    		@ModelAttribute("rstartDate") String rstartDate, 
    		@ModelAttribute("rendDate") String rendDate,
    		@ModelAttribute("ma_name") String ma_name,
    		@ModelAttribute("io_state") String io_state) throws Exception {
    	logger.debug(" inorderGET() 호출 ");
    	
    	
    	if(!istartDate.isEmpty() || !iendDate.isEmpty() || !rstartDate.isEmpty() || !rendDate.isEmpty() ||
    			!ma_name.isEmpty() || !io_state.isEmpty()) {
    		
    		List<InorderVO> inorderList = ioService.getInorderSearch(istartDate, iendDate,rstartDate, rendDate, ma_name, io_state);
    		logger.debug("검색어O, 검색된 데이터만 출력");	
    		
    		model.addAttribute("inorderList", inorderList);
    	}else {
    		logger.debug("검색어X, 전체 데이터 출력");
    		List<InorderVO> inorderList = ioService.getInorderList();
    		model.addAttribute("inorderList", inorderList);
    	}
    }
    
    // 발주 등록 시 팝업
    // http://localhost:8088/wms/inorder/popUpInorder
    @RequestMapping(value = "/inorder/addPopup", method = RequestMethod.GET )
	public String popUpGET(Model model, @ModelAttribute("txt") String txt) throws Exception {
		logger.debug("popUpInorderGET() 호출!");
		
		if(txt.equals("clt")) { // 거래처 목록 팝업
			List<ClientVO> popUpClt = cService.clientList();
			model.addAttribute("popUpClt", popUpClt);
			
			return "/wms/inorder/popUpClient";
			
		}else if(txt.equals("ma")) { // 자재 목록 팝업
			List<MaterialVO> popUpMate = iService.getMaterialList();
			model.addAttribute("popUpMate", popUpMate);
			
			return "/wms/inorder/popUpMaterial";
		}
		
		return "/wms/inorder/inorderlist";
		
	}
    
    
    // 발주 등록 + 수정
    @RequestMapping(value = "/wms/regInorder", method = RequestMethod.POST)
    public String regInorderPOST(InorderVO iovo) throws Exception {
    		
    	if(iovo.getIo_num() == "") {
    		logger.debug("regInorderPOST() 호출-발주등록");
    		logger.debug("iovo : " + iovo);
    		
    		ioService.regInorder(iovo);
    	}else {
    		logger.debug("regInorderPOST() 호출-발주수정");
			logger.debug("iovo : " + iovo);
			
			ioService.updateInorder(iovo);
    	}	
    		
    		return "redirect:/wms/inorder/inorderlist";
    }
    
    // 발주 삭제
    @RequestMapping(value = "/wms/deleteInorder")
    public String deleteInorder(@RequestParam(value = "selectedIoId", required = false) Integer[] selectedIoIds) {
    	
    	if(selectedIoIds != null) {
		    for (Integer io_id : selectedIoIds) {
		    	ioService.deleteInorder(io_id);
		    }
		}
	    
	    return "redirect:/wms/inorder/inorderlist";
    }
    
    
    
    
}