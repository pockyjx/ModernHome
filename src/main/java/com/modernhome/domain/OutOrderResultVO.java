package com.modernhome.domain;

public class OutOrderResultVO {
	
	private String month;
	private Integer monthlyOrderCount;
	private long monthlyOrderAmount;
	
	
	public Integer getMonthlyOrderCount() {
		return monthlyOrderCount;
	}
	public void setMonthlyOrderCount(Integer monthlyOrderCount) {
		this.monthlyOrderCount = monthlyOrderCount;
	}
	public long getMonthlyOrderAmount() {
		return monthlyOrderAmount;
	}
	public void setMonthlyOrderAmount(long monthlyOrderAmount) {
		this.monthlyOrderAmount = monthlyOrderAmount;
	}
	
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	@Override
	public String toString() {
		return "OutOrderResultVO [month=" + month + ", monthlyOrderCount=" + monthlyOrderCount + ", monthlyOrderAmount="
				+ monthlyOrderAmount + "]";
	}
	
	
	
	
}
