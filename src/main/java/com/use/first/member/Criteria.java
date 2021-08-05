package com.use.first.member;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {

	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;

	

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.searchType = null;
		this.keyword = null;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	


	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if (pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	
	
	
		//searchType, keyword 추가
		public String makeQuery() {
			UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", this.perPageNum);
					
			if (searchType!=null) {
				uriComponentsBuilder
						.queryParam("searchType", this.searchType)
						.queryParam("keyword", this.keyword);
			}
			return uriComponentsBuilder.build().encode().toString();
		}

		@Override
		public String toString() {
			return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
		}
	
	
	
	

}
