package com.springapp.mvc.entity;

/**
 * Created by maomao on 2015/5/15.
 */
public class QuestionLimitNum {
    private int limitNum;
    private String questionType;

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public int getLimitNum() {
        return limitNum;
    }

    public void setLimitNum(int limitNum) {
        this.limitNum = limitNum;
    }
}
