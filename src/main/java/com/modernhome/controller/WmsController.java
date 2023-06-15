package com.modernhome.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.modernhome.domain.InorderVO;
import com.modernhome.domain.WarehouseVO;
import com.modernhome.service.InorderService;
import com.modernhome.service.WarehouseService;

@Controller
@RequestMapping(value = "/wms/*")
public class WmsController {

    private static final Logger logger = LoggerFactory.getLogger(WmsController.class);
    
    // 의존성 주입
    @Inject
    private WarehouseService wService;
    
    @Inject
    private InorderService ioService;
    
    
    
    // 창고 조회
    // http://localhost:8088/wms/warehouse/warehouselist
    @RequestMapping(value = "/warehouse/warehouselist",method = RequestMethod.GET)
    public void warehouseGET(Model model) {
    	logger.debug(" warehouseGET() 호출 ");
    	
    	List<WarehouseVO> warehouseList = wService.getWarehouseList();
    	// Model 객체에 저장
    	model.addAttribute("warehouseList", warehouseList);
    }
    
    // 발주 조회
    // http://localhost:8088/wms/inorder/inorderlist
    @RequestMapping(value = "/inorder/inorderlist",method = RequestMethod.GET)
    public void inorderGET(Model model) {
    	logger.debug(" inorderGET() 호출 ");
    	
    	List<InorderVO> inorderList = ioService.getInorderList();
    	// Model 객체에 저장
    	model.addAttribute("inorderList", inorderList);
    }
    
}