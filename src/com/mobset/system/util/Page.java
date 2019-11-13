package com.mobset.system.util;

public class Page {
	private int curPage = 1; // 当前页
    private int pageSize = 8; // 每页多少行
    private int start;// 当前页起始行
    private int pageCount;//
    private int count;//
    
    public int getPageCount() {
		return  getCount()% getPageSize()== 0 ? getCount()/ getPageSize() : getCount()/ getPageSize()+ 1 ;
	}
    
    public int getPage(){
   	 if (curPage < 1) {
            curPage = 1;
        } else {
            start = pageSize * (curPage - 1);
        }
		return start;
   }

    
    
    public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
  
    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getStart() {
        // start=curPage*pageSize;
        return start;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

}
