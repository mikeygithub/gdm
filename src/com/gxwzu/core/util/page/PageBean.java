package com.gxwzu.core.util.page;

import java.util.List;

import com.gxwzu.core.util.SysConstant;


/** 
 * PageInfo
 * @author MR.AMU
 * @version  1.0
 * @since 2014
 * <br> create time:2014-5-3
 */
public class PageBean {
 
	private List list;          //
    private int allRow;         //
    private int totalPage;      //
    private int currentPage;    //
    private int pageSize;       //
    private int firstResult;	//
    
    private boolean isFirst;    //
    private boolean isLast;     //
    private boolean hasPre;     //
    private boolean hasNext;    //
    
    public PageBean(Integer page,Integer pageSize) {
    	if(pageSize==null){
    		this.pageSize=SysConstant.DEFAULT_PAGESIZE;
    	}else{
    		this.pageSize=pageSize;
    	}
    	if(page==null){
    		page=1;
    		this.firstResult=0;	
    	}else{
    		this.firstResult=(page-1)*this.pageSize;
    	}
    	this.currentPage=page;
	}  

    @SuppressWarnings("rawtypes")
	public void init(int allRow,List list){
    	this.allRow=allRow;
    	this.list=list;
        this.isFirst = isFirstPage();
        this.isLast = isLastPage();
        this.hasPre = isHasPreviousPage();
        this.hasNext = isHasNextPage();
        this.totalPage=countTotalPage();
    }

    private boolean isFirstPage() {
        return currentPage == 1;    
    }
    private boolean isLastPage() {
        return currentPage == totalPage;    
    }
    private boolean isHasPreviousPage() {
        return currentPage != 1;       
    }
    private boolean isHasNextPage() {
        return currentPage != totalPage;  
    }

    /** 
     * 
     * @param pageSize 
     * @param allRow 
     * @return 
     */
    private int countTotalPage(){
    	int totalPage = (allRow %pageSize == 0 )? (allRow/pageSize ):( allRow/pageSize+1);
        return totalPage;
    }
 
    /**
     * 
     * @param page 
     * @return 
     */
    public static int countCurrentPage(int page){
        final int curPage = (page==0?1:page);
        return curPage;
    }
	@SuppressWarnings("rawtypes")
	public List getList() {
        return list;
    }
    @SuppressWarnings("rawtypes")
	public void setList(List list) {
        this.list = list;
    }
    public int getAllRow() {
        return allRow;
    }
    public void setAllRow(int allRow) {
        this.allRow = allRow;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

	public int getFirstResult() {
		return firstResult;
	}
	public void setFirstResult(int firstResult) {
		this.firstResult = firstResult;
	}

	public boolean isFirst() {
		return isFirst;
	}

	public void setFirst(boolean isFirst) {
		this.isFirst = isFirst;
	}

	public boolean isLast() {
		return isLast;
	}

	public void setLast(boolean isLast) {
		this.isLast = isLast;
	}

	public boolean isHasPre() {
		return hasPre;
	}

	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}

	public boolean isHasNext() {
		return hasNext;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	
}
