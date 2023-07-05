package com.modernhome.domain;

import java.time.LocalDateTime;

public class DefectiveVO {
	
	private int df_id;
	private String df_num;
	private String df_type;
	private int ma_id;
	private int line_id;
	private String repair_yn;
	private int df_cnt;
	private String df_rsns;
	private LocalDateTime reg_date;
	private LocalDateTime solved_date;
	
	
	// 결함 그래프 출력용
	private Integer totalDf;
	private Integer discolored;
	private Integer scratched;
	private Integer damaged;
	private Integer totalMr;
	public int getDf_id() {
		return df_id;
	}
	public void setDf_id(int df_id) {
		this.df_id = df_id;
	}
	public String getDf_num() {
		return df_num;
	}
	public void setDf_num(String df_num) {
		this.df_num = df_num;
	}
	public String getDf_type() {
		return df_type;
	}
	public void setDf_type(String df_type) {
		this.df_type = df_type;
	}
	public int getMa_id() {
		return ma_id;
	}
	public void setMa_id(int ma_id) {
		this.ma_id = ma_id;
	}
	public int getLine_id() {
		return line_id;
	}
	public void setLine_id(int line_id) {
		this.line_id = line_id;
	}
	public String getRepair_yn() {
		return repair_yn;
	}
	public void setRepair_yn(String repair_yn) {
		this.repair_yn = repair_yn;
	}
	public int getDf_cnt() {
		return df_cnt;
	}
	public void setDf_cnt(int df_cnt) {
		this.df_cnt = df_cnt;
	}
	public String getDf_rsns() {
		return df_rsns;
	}
	public void setDf_rsns(String df_rsns) {
		this.df_rsns = df_rsns;
	}
	public LocalDateTime getReg_date() {
		return reg_date;
	}
	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}
	public LocalDateTime getSolved_date() {
		return solved_date;
	}
	public void setSolved_date(LocalDateTime solved_date) {
		this.solved_date = solved_date;
	}
	public Integer getTotalDf() {
		return totalDf;
	}
	public void setTotalDf(Integer totalDf) {
		this.totalDf = totalDf;
	}
	public Integer getDiscolored() {
		return discolored;
	}
	public void setDiscolored(Integer discolored) {
		this.discolored = discolored;
	}
	public Integer getScratched() {
		return scratched;
	}
	public void setScratched(Integer scratched) {
		this.scratched = scratched;
	}
	public Integer getDamaged() {
		return damaged;
	}
	public void setDamaged(Integer damaged) {
		this.damaged = damaged;
	}
	public Integer getTotalMr() {
		return totalMr;
	}
	public void setTotalMr(Integer totalMr) {
		this.totalMr = totalMr;
	}
	@Override
	public String toString() {
		return "DefectiveVO [df_id=" + df_id + ", df_num=" + df_num + ", df_type=" + df_type + ", ma_id=" + ma_id
				+ ", line_id=" + line_id + ", repair_yn=" + repair_yn + ", df_cnt=" + df_cnt + ", df_rsns=" + df_rsns
				+ ", reg_date=" + reg_date + ", solved_date=" + solved_date + ", totalDf=" + totalDf + ", discolored="
				+ discolored + ", scratched=" + scratched + ", damaged=" + damaged + ", totalMr=" + totalMr + "]";
	}
	
	
	
	
	
	
	
	
	
	
}