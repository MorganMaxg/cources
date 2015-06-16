package com.springapp.mvc.entity;

/**
 * Created by maomao on 2015/5/10.
 */
public class HomeworkStudents {
    private int id;   //作业学生表的主键
    private int homeworkID;
    private int score;
    private String className;
    private String studentUri;
    private String studentFileName; //用于学生上传作业
    private String studentName;
    private String studentID;
    private String teacherFileName;


    public String getTeacherFileName() {
        return teacherFileName;
    }

    public void setTeacherFileName(String teacherFileName) {
        this.teacherFileName = teacherFileName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHomeworkID() {
        return homeworkID;
    }

    public void setHomeworkID(int homeworkID) {
        this.homeworkID = homeworkID;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
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

    public String getStudentUri() {
        return studentUri;
    }

    public void setStudentUri(String studentUri) {
        this.studentUri = studentUri;
    }

    public String getStudentFileName() {
        return studentFileName;
    }

    public void setStudentFileName(String studentFileName) {
        this.studentFileName = studentFileName;
    }
}
