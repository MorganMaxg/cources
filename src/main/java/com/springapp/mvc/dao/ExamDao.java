package com.springapp.mvc.dao;

import com.springapp.mvc.entity.Exam;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by maomao on 2015/4/24.
 */
public interface ExamDao {
    public void addExamTitle(@Param("exam") Exam exam);

    public void addQuestionsToExam(@Param("examID") int examID, @Param("questionID") int questionID);

    public List<Exam> findAllQuestionsByExamID(int examID);

    public List<Exam> findOnlyExams(@Param("teacherID") int teacherID);

    public List<Exam> findAllExamsLessons(@Param("teacherID") int teacherID);

    public String findExamTitleByExamID(int examID);

    public void addReleaseExam(@Param("examID") int examID);

    public void updateStartTime(@Param("startTime") Date startTime, @Param("examID") int examID);

    public void updateDeadline(@Param("deadline") Date deadline, @Param("examID") int examID);

    public void addExamStudentToExam(@Param("examID") int examID);

    public void updateLessonID(@Param("lessonID") int lessonID, @Param("examID") int examID);

    public int findCurrentSequence();//返回自增序列当前序列值

    public void addExamLesson(@Param("examID") int examID, @Param("lessonID") int lessonID);

    public List<Exam> findStudentByExamIDAndLessonID(@Param("examID") int examID, @Param("lessonID") int lessonID);

    public List<Exam> findExamLessonByExamID(@Param("examID") int examID);

    public List<Exam> findExamScoreByExamIDAndStudentID(@Param("lessonID") int lessonID, @Param("examID") int examID);

    public List<Exam> findExamAndExamScoreByStudentID(@Param("studentID") int studentID);

    public List<Exam> findExamsByLessonID(@Param("lessonID") int lessonID);

    public void updateExamSetProportion(@Param("proportion") int proportion, @Param("examID") int examID, @Param("lessonID") int lessonID);

    public List<Exam> findOneByOneRecordByExamIDAndStudntID(@Param("currentPage") int currentPage, @Param("examID") int examID, @Param("studentID") int studentID);

    public int findCountByExamIDAndStudntID(@Param("examID") int examID, @Param("studentID") int studentID);

    public void updateStudentScoreByExamIDAndStudntID(@Param("studentScore") int studentScore, @Param("questionID") int questionID, @Param("examID") int examID, @Param("studentID") int studentID);

    public List<Exam> findAllExams();
}
