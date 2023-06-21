package com.modernhome.domain;

public class PagingVO {
	
	private int pageNum; // 현재 페이지
	private int startPage; // 시작 페이지
	private int endPage; // 끝 페이지
	private int result; // 게시글 총 개수
	private int pageSize; // 페이지 당 글 개수
	private int lastPage; // 마지막 페이지
	
	private int pageBlock = 5; // 한 화면에 보여줄 페이지 번호 개수
	
	private int start; // 쿼리에 사용
	private int end; // 쿼리에 사용
	
	public PagingVO() {}
	
	public PagingVO(int result, int pageNum, int pageSize) {
		setPageNum(pageNum);
		setPageSize(pageSize);
		setResult(result);
		
	}
	
	// 마지막 페이지
	public void calcLastPage(int result, int pageSize) {
		setLastPage((int)Math.ceil((double)result/pageSize));
		
	}
	
	// 시작, 끝 페이지
	public void calcStartEndPage(int pageNum, int pageBlock) {
		
		// 끝 페이지 계산
		setEndPage(((int)Math.ceil((double)pageNum/pageBlock)) * pageBlock );
		
		if(getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		
		// 시작 페이지 계산
		setStartPage(getEndPage() - pageSize + 1);
		
		if(getStartPage() < 1) {
			setStartPage(1);
		}
	}
	
	// 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int pageNum, int pageSize) {
		setEnd(pageNum * pageSize);
		setStart(getEnd() - pageSize);
	}
	
	// getter, setter
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	
	

}
