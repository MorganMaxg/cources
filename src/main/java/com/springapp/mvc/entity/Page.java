package com.springapp.mvc.entity;

/**
 * Created by maomao on 2015/5/4.
 */
public class Page {
    private int totalPage;//总页数
    private int currentPage;//当前页数
    private int totalRecord;//总的记录条数
    private int currentRecord;//当前记录的条数
    private int pageSize;//每页显示的记录数量

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentRecord, int pageSize) {
        //如果当前记录数除以每页显示条数可以整除，商就是当前的页码
        if (currentRecord % pageSize == 0) {
            currentPage = currentRecord / pageSize;
        } else {
            //如果当前记录数除以每页显示条数不能整除，商加1才是当前的页码
            currentPage = currentRecord / pageSize + 1;
        }
    }

    public int getCurrentRecord() {
        return currentRecord;
    }

    public void setCurrentRecord(int currentRecord) {
        this.currentRecord = currentRecord;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalRecord, int pageSize) {
        //如果总记录数除以每页显示条数可以整除，商就是总页码
        if (totalRecord % pageSize == 0) {
            totalPage = totalRecord / pageSize;
        } else {
            //如果总记录数除以每页显示条数不能整除，商加1才是总页码
            totalPage = totalRecord / pageSize + 1;
        }
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }
}
