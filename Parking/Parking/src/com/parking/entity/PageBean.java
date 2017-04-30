package com.parking.entity;

import java.util.List;

public class PageBean {
		private List list;
		private int allRow;
		private int currentPage;
		private static int PageSize;
		private int totalPage;
		
		private boolean isFirstPage;
		private boolean isLastPage;
		private boolean hasPreviousPage;
		private boolean hasNextPage;
		public List getList() {
			return list;
		}
		public void setList(List list) {
			this.list = list;
		}
		public int getAllRow() {
			return allRow;
		}
		public void setAllRow(int allRow) {
			this.allRow = allRow;
		}
		public int getCurrentPage() {
			return currentPage;
		}
		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}
		public int getPageSize() {
			return PageSize;
		}
		public void setPageSize(int pageSize) {
			PageSize = pageSize;
		}
		
		
		
		
		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}
		public boolean isFirstPage() {
			return currentPage==1;
		}

		public boolean isLastPage() {
			return currentPage==totalPage;
		}
		public boolean isHasPreviousPage() {
			return currentPage!=1;
		}

		public boolean isHasNextPage() {
			return currentPage!=totalPage;
		}

		
		
		/*
		 * 初始化分页信息
		 */
		public void init(){
			this.isFirstPage=isFirstPage();
			this.isLastPage=isLastPage();
			this.hasPreviousPage=isHasPreviousPage();
			this.hasNextPage=isHasNextPage();
		}
		
		public static int countTotalPage(final int pageSize,final int allRow){
			int totalPage=allRow % pageSize==0?allRow/pageSize:allRow/PageSize+1;
			return totalPage;
		}
		
		public static int countOffset(final int pageSize,final int currentPage){
			final int offset = pageSize*(currentPage-1);
			return offset;
		}
		
		public static int countCurrentPage(int page){
			final int curPage=(page==0?1:page);
			return curPage;
		}
}		
