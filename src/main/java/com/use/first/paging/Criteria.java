package com.use.first.paging;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {

	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;
	private String v_pid;
	private String color;
	private String sort;
	private int minPrice;
	private int maxPrice;
	private String tab;
	
	

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public String getTab() {
		return tab;
	}

	public void setTab(String tab) {
		this.tab = tab;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getV_pid() {
		return v_pid;
	}

	public void setV_pid(String v_pid) {
		this.v_pid = v_pid;
	}

	public Criteria() {
		this.page = 1;
		this.perPageNum = 9;
		
		this.searchType = null;
		this.keyword = null;
		this.color = null;
		this.sort = null;
		this.tab = null;
		this.minPrice = -1;
		this.maxPrice = -1;
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

	// pageStart를 반환
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

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
		} else {
			this.perPageNum = perPageNum;
		}
	}

	// searchType, keyword 추가
	public String makeQuery() {


		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", this.perPageNum);
		if (searchType!=null) {
			uriComponentsBuilder
					.queryParam("searchType", this.searchType)
					.queryParam("keyword", this.keyword);
		}
		if(sort!=null) {
			uriComponentsBuilder
			.queryParam("sort", this.sort);
		}
		return uriComponentsBuilder.build().encode().toString();
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType + ", keyword="
				+ keyword + ", v_pid=" + v_pid + ", color=" + color + ", sort=" + sort + ", minPrice=" + minPrice
				+ ", maxPrice=" + maxPrice + ", tab=" + tab + "]";
	}

	
	
	

}