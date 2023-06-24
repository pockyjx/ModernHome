package com.modernhome.persistence;

import java.util.List;

import com.modernhome.domain.OutOrderJoinVO;
import com.modernhome.domain.OutOrderVO;

public interface OutOrderDAO {
public List<OutOrderJoinVO> outOrderList();
public List<OutOrderJoinVO> outOrderListSearch(OutOrderJoinVO ovo);
	
	// 수주 등록
	public void regOutOrder(OutOrderVO ovo);
	
	// 수주 삭제
	public void deleteOutOrder(String oo_num);
	
	// 수주 수정
	public void updateOutOrder(OutOrderVO ovo);
}
