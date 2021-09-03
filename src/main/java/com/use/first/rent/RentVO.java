	
package com.use.first.rent;

import java.sql.Date;

public class RentVO {
		private int r_id;
		private String r_mid;
		private String r_pid;
		private String p_name;
		private Date r_sdate;
		private int r_rent;
		private String r_state;
		private Date r_pdate;
		private int p_canRent;
		private String p_category;
		public int getR_id() {
			return r_id;
		}
		public void setR_id(int r_id) {
			this.r_id = r_id;
		}
		public String getR_mid() {
			return r_mid;
		}
		public void setR_mid(String r_mid) {
			this.r_mid = r_mid;
		}
		public String getR_pid() {
			return r_pid;
		}
		public void setR_pid(String r_pid) {
			this.r_pid = r_pid;
		}
		public String getP_name() {
			return p_name;
		}
		public void setP_name(String p_name) {
			this.p_name = p_name;
		}
		public Date getR_sdate() {
			return r_sdate;
		}
		public void setR_sdate(Date r_sdate) {
			this.r_sdate = r_sdate;
		}
		public int getR_rent() {
			return r_rent;
		}
		public void setR_rent(int r_rent) {
			this.r_rent = r_rent;
		}
		public String getR_state() {
			return r_state;
		}
		public void setR_state(String r_state) {
			this.r_state = r_state;
		}
		public Date getR_pdate() {
			return r_pdate;
		}
		public void setR_pdate(Date r_pdate) {
			this.r_pdate = r_pdate;
		}
		public int getP_canRent() {
			return p_canRent;
		}
		public void setP_canRent(int p_canRent) {
			this.p_canRent = p_canRent;
		}
		public String getP_category() {
			return p_category;
		}
		public void setP_category(String p_category) {
			this.p_category = p_category;
		}
		@Override
		public String toString() {
			return "RentVO [r_id=" + r_id + ", r_mid=" + r_mid + ", r_pid=" + r_pid + ", p_name=" + p_name
					+ ", r_sdate=" + r_sdate + ", r_rent=" + r_rent + ", r_state=" + r_state + ", r_pdate=" + r_pdate
					+ ", p_canRent=" + p_canRent + ", p_category=" + p_category + "]";
		}
		
		
}
	
	

