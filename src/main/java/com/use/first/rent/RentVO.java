	
	package com.use.first.rent;

import java.sql.Date;

public class RentVO {
		private String r_id;
		private String r_mid;
		private String r_pid;
		private Date r_sdate;
		private int r_rent;
		private String r_state;
		private Date r_pdate;
		private String searchCondition;
		private String searchKeyword;
		
		
		public String getR_id() {
			return r_id;
		}
		public void setR_id(String r_id) {
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
		
		public String getSearchCondition() {
			return searchCondition;
		}
		public void setSearchCondition(String searchCondition) {
			this.searchCondition = searchCondition;
		}
		public String getSearchKeyword() {
			return searchKeyword;
		}
		public void setSearchKeyword(String searchKeyword) {
			this.searchKeyword = searchKeyword;
		}
		@Override
		public String toString() {
			return "RentVO [r_id=" + r_id + ", r_mid=" + r_mid + ", r_pid=" + r_pid + ", r_sdate=" + r_sdate
					+ ", r_rent=" + r_rent + ", r_state=" + r_state + ", r_pdate=" + r_pdate + ", searchCondition="
					+ searchCondition + ", searchKeyword=" + searchKeyword + "]";
		}
		
		
		
		
		// 성훈 시작 ( rental 과 product 조인해서 product p_name 가져오려는데 
	      // 다른방법있으면 삭제 가능한데 다른 방법이 생각나지 않습니다 ㅠㅠ)
	      private String p_name;


	      public String getP_name() {
	         return p_name;
	      }
	      public void setP_name(String p_name) {
	         this.p_name = p_name;
	      }
	      // 성훈 끝
		
		
		
		
	}

	
	
	
	

