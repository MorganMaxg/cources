package com.springapp.mvc.entity;

/**
 * Created by maomao on 2015/6/4.
 */
public class Score {
    private int proportion; //ÿ�����Ա���
    private int id;//ѧ������ID
    private int score;//ÿ�����Է���
    private int examID;//��������ID


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
