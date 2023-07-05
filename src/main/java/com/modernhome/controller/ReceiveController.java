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
import org.springframework.web.bind.annotation.RequestParam;

import com.modernhome.domain.ClientVO;
import com.modernhome.domain.InorderVO;
import com.modernhome.domain.PageMaker;
import com.modernhome.domain.PageVO;
import com.modernhome.domain.ReceiveVO;
import com.modernhome.domain.WijoinVO;
import com.modernhome.service.ClientService;
import com.modernhome.service.InorderService;
import com.modernhome.service.QualityService;
import com.modernhome.service.ReceiveService;

@Controller
@RequestMapping(value = "/wms/*")
public class ReceiveController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(ReceiveController.class);
	
	// 의존성 주입
	@Autowired
	private ReceiveService rService;
	
	@Autowired
    private InorderService ioService;
	
	@Autowired
	private ClientService cService;
	
	@Autowired
	private QualityService qService;
	
	// 입고 조회
	// http://localhost:8088/wms/receive/receivelist
	@RequestMapping(value = "/receive/receivelist",method = RequestMethod.GET)
    public void receiveGET(Model model, 
    		@ModelAttribute(value = "startDate") String startDate, 
    		@ModelAttribute(value = "endDate") String endDate,
    		@ModelAttribute(value = "ma_name") String ma_name,
    		@ModelAttribute(value = "io_num") String io_num, 
    		PageVO pvo) throws Exception {
		
    	logger.debug(" receiveGET() 호출 ");
    	PageMaker pm = new PageMaker();
    	
		if (!startDate.isEmpty() || !endDate.isEmpty() || !ma_name.isEmpty() || !io_num.isEmpty()) {
    		
			List<ReceiveVO> receiveList = rService.getReceiveSearch(startDate, endDate, ma_name, io_num, pvo);
    		logger.debug("검색어O, 검색된 데이터만 출력");
    		
    		// 페이징 정보 전달
    		pm.setPageVO(pvo);
    		pm.setTotalCount(rService.getRecSearchCnt(startDate, endDate, ma_name, io_num));
    		model.addAttribute("pm", pm);
    	
    		// 검색 정보 전달
    		model.addAttribute("startDate", startDate);
    		model.addAttribute("endDate", endDate);
    		model.addAttribute("ma_name", ma_name);
    		model.addAttribute("io_num", io_num);
    		
    		model.addAttribute("receiveList", receiveList);
    		
    	}else {
    		
    		logger.debug("검색어X, 전체 데이터 출력");
    		List<ReceiveVO> receiveList = rService.getReceiveList(pvo);
    		model.addAttribute("receiveList", receiveList);
    		
    		// 페이징 정보 전달
    		pm.setPageVO(pvo);
    		pm.setTotalCount(rService.getTotalCntRec());
    		model.addAttribute("pm", pm);
    	}
    }
	
	
	// 입고 등록 시 팝업
    // http://localhost:8088/wms/receive/popUpReceive
    @RequestMapping(value = "/receive/addPopup", method = RequestMethod.GET )
	public String popUpGET(Model model, @ModelAttribute("txt") String txt, PageVO pvo) throws Exception {
		logger.debug("popUpReceiveGET() 호출!");
		PageMaker pm = new PageMaker();
		
		if(txt.equals("io")) { // 발주 목록 팝업
			List<InorderVO> popUpIo = ioService.getInorderList(pvo);
			model.addAttribute("popUpIo", popUpIo);
			
			// 페이징 정보 추가
			pm.setPageVO(pvo);
			pm.setTotalCount(ioService.getTotalCntMate());
			
			model.addAttribute("pm", pm);
			
			return "/wms/receive/popUpInorder";
			
		}
		
			return "/wms/receive/receivelist";
    }		
		
    
    
    // 입고 등록 + 수정
    @RequestMapping(value = "/wms/regReceive", method = RequestMethod.POST)
    public String regReceivePOST(ReceiveVO rvo) throws Exception {
    		
    	if(rvo.getRec_num() == "") {
    		logger.debug("regReceivePOST() 호출-입고등록");
    		logger.debug("rvo : " + rvo);
    		
    		rService.regReceive(rvo);
    		
    		// 품질 테이블에 입고 정보 자동 저장
    		int maxRecId = rService.getRecId();
    		
    		WijoinVO wvo = new WijoinVO();
    		wvo.setRec_id(maxRecId);
    		wvo.setMa_id(rvo.getMa_id());
    		
    		qService.addQC(wvo);
    		
    		
    	}else {
    		logger.debug("regReceivePOST() 호출-입고수정");
			logger.debug("rvo : " + rvo);
			
			rService.updateReceive(rvo);
    	}	
    		
    		return "redirect:/wms/receive/receivelist";
    }
    
    // 입고 삭제
    @RequestMapping(value = "/wms/deleteReceive")
    public String deleteReceive(@RequestParam(value = "selectedRecId", required = false) Integer[] selectedRecIds) {
    	
    	if(selectedRecIds != null) {
		    for (Integer rec_id : selectedRecIds) {
		    	rService.deleteReceive(rec_id);
		    }
		}
	    
	    return "redirect:/wms/receive/receivelist";
    }
	
    // 입고 처리 (재고 반영)
    @RequestMapping(value = "/acceptReceive")
    public String acceptReceive(
    		@RequestParam(value = "rec_id", required = false) Integer rec_id, 
    		@RequestParam(value = "ma_id", required = false) Integer ma_id, 
    		@RequestParam(value = "rec_cnt", required = false) Integer rec_cnt) throws Exception {
    	
    	logger.debug("입고 처리 : 재고 반영!");
    	rService.acceptReceive(rec_id, ma_id, rec_cnt);
    	
    	return "redirect:/wms/receive/receivelist";
    }
	
	
	
	
}