package com.springapp.stage.security.entity;

import java.io.Serializable;

/**
 * Created by ASUS on 2015/4/16.
 */
public class Teacher implements Serializable {
    private Integer teacherId;
    private Integer id;
    private String teacherName;
    private String basicInfo;
    private String password;
    private Integer wordTime;

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getBasicInfo() {
        return basicInfo;
    }

    public void setBasicInfo(String basicInfo) {
        this.basicInfo = basicInfo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getWordTime() {
        return wordTime;
    }

    public void setWordTime(Integer wordTime) {
        this.wordTime = wordTime;
    }
}
