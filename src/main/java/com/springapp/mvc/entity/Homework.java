package com.springapp.mvc.entity;

import java.util.Date;

/**
 * Created by maomao on 2015/5/3.
 */
public class Homework {
    private int homeworkID;
    private String teacherFileName;
    private String teacherUri;
    private int lessonID;
    private String lessonName;
    private String content;
    private Date deadline;
    private int proportion;
    private int count;
    private int score;
    private String uri;
    private String homeworkName;

    public String getHomeworkName() {
        return homeworkName;
    }

    public void setHomeworkName(String homeworkName) {
        this.homeworkName = homeworkName;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getProportion() {
        return proportion;
    }

    public void setProportion(int proportion) {
        this.proportion = proportion;
    }

    public int getHomeworkID() {
        return homeworkID;
    }

    public void setHomeworkID(int homeworkID) {
        this.homeworkID = homeworkID;
    }


    public int getLessonID() {
        return lessonID;
    }

    public void setLessonID(int lessonID) {
        this.lessonID = lessonID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getTeacherFileName() {
        return teacherFileName;
    }

    public void setTeacherFileName(String teacherFileName) {
        this.teacherFileName = teacherFileName;
    }

    public String getTeacherUri() {
        return teacherUri;
    }

    public void setTeacherUri(String teacherUri) {
        this.teacherUri = teacherUri;
    }
}
