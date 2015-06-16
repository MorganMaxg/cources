package com.springapp.mvc.entity;

import java.io.Serializable;

/**
 * Created by maomao on 2015/3/20.
 */
public class Student implements Serializable {
    private int id;
    private String studentName;
    private String studentID;
    private String password;
    private int classID;
    private String className;

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getClassID() {
        return classID;
    }

    public void setClassID(int classID) {
        this.classID = classID;
    }

    public void updateStudent(String studentID, String studentName, Integer classID) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.classID = classID;
    }
}
