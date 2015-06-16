package com.springapp.stage.security.entity;

/**
 * Created by ASUS on 2015/6/5.
 */
public class Lesson {
    private String name;
    private Integer id;
    private Integer score;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
}
