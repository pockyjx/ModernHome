package com.modernhome.domain;

public class OutOrderResultVO {
	
	private String month;
	private Integer monthlyOrderCount;
	private Integer monthlyOrderAmount;
	
	
	public Integer getMonthlyOrderCount() {
		return monthlyOrderCount;
	}
	public void setMonthlyOrderCount(Integer monthlyOrderCount) {
		this.monthlyOrderCount = monthlyOrderCount;
	}
	public Integer getMonthlyOrderAmount() {
		return monthlyOrderAmount;
	}
	public void setMonthlyOrderAmount(Integer monthlyOrderAmount) {
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
