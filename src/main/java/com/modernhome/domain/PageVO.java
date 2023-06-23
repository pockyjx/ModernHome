package com.modernhome.domain;

public class PageVO {
	
	// 페이지 정보 저장 객체
	
	// 페이지 정보
	private int page;
	
	// 페이지 크기(한 페이지에 출력될 글 개수)
	private int pageSize;
	
	public PageVO() {
		// 페이징 처리 기본값 설정
		this.page = 1;
		this.pageSize = 10;
	}
	
	// 페이지 정보에 따른 인덱스 정보
	private int pageIndex;
	
	// setter -> getter 순서로 정렬
	public void setPage(int page) {

		if(page <= 0) {
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setPageSize(int pageSize) {

		if(pageSize <= 0 || pageSize > 100) {
			this.pageSize = 10;
			return;
		}
		
		this.pageSize = pageSize;
	}
	
	// get() : mapper의 #{000}에서 사용

	public int getPage() {
		return page;
	}

	public int getPageSize() {
		return pageSize;
	}
	
	// 페이지에 따른 시작 인덱스 계산
	// mapper에만 사용되는 메서드
	public int getStartPage() {
		return (this.page - 1) * this.pageSize;
	}

	@Override
	public String toString() {
		return "PageVO [page=" + page + ", pageSize=" + pageSize + "]";
	}

}
