package com.springapp.mvc.entity;

/**
 * Created by maomao on 2015/6/4.
 */
public class Score {
    private int proportion; //每场考试比例
    private int id;//学生主键ID
    private int score;//每场考试分数
    private int examID;//考试主键ID


    public int getExamID() {
        return examID;
    }

    public void setExamID(int examID) {
        this.examID = examID;
    }

    public int getProportion() {
        return proportion;
    }

    public void setProportion(int proportion) {
        this.proportion = proportion;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
