package com.springapp.mvc.entity;

/**
 * Created by maomao on 2015/5/4.
 */
public class Page {
    private int totalPage;//��ҳ��
    private int currentPage;//��ǰҳ��
    private int totalRecord;//�ܵļ�¼����
    private int currentRecord;//��ǰ��¼������
    private int pageSize;//ÿҳ��ʾ�ļ�¼����

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentRecord, int pageSize) {
        //�����ǰ��¼������ÿҳ��ʾ���������������̾��ǵ�ǰ��ҳ��
        if (currentRecord % pageSize == 0) {
            currentPage = currentRecord / pageSize;
        } else {
            //�����ǰ��¼������ÿҳ��ʾ���������������̼�1���ǵ�ǰ��ҳ��
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
        //����ܼ�¼������ÿҳ��ʾ���������������̾�����ҳ��
        if (totalRecord % pageSize == 0) {
            totalPage = totalRecord / pageSize;
        } else {
            //����ܼ�¼������ÿҳ��ʾ���������������̼�1������ҳ��
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
