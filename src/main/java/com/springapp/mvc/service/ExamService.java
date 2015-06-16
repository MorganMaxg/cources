package com.springapp.mvc.service;

import com.springapp.mvc.dao.ExamDao;
import com.springapp.mvc.entity.Exam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by maomao on 2015/5/19.
 */
@Service
@Transactional
public class ExamService {
    @Autowired
    ExamDao examDao;

    @Transactional
    public int addExamTitleAndReturnCurrentExamID(Exam exam) {
        examDao.addExamTitle(exam);
        return examDao.findCurrentSequence();
    }

    @Transactional
    public void addQuestionsToExam(int examID, int questionID) {
        examDao.addQuestionsToExam(examID, questionID);
    }

    @Transactional
    public List<Exam> findAllQuestionsByExamID(int examID) {
        return examDao.findAllQuestionsByExamID(examID);
    }

    @Transactional
    public List<Exam> findOnlyExams(int teacherID) {
        return examDao.findOnlyExams(teacherID);
    }

    @Transactional
    public List<Exam> findAllExamsLessons(int teacherID) {
        return examDao.findAllExamsLessons(teacherID);
    }

    @Transactional
    public String findExamTitleByExamID(int examID) {
        return examDao.findExamTitleByExamID(examID);
    }

    @Transactional
    public void addReleaseExam(int examID) {
        examDao.addReleaseExam(examID);
    }

    @Transactional
    public void updateStartTime(Date startTime, int examID) {
        examDao.updateStartTime(startTime, examID);
    }

    @Transactional
    public void updateDeadline(Date deadline, int examID) {
        examDao.updateDeadline(deadline, examID);
    }

    @Transactional
    public void addExamStudentToExam(int examID) {
        examDao.addExamStudentToExam(examID);
    }

    @Transactional
    public void updateLessonID(int lessonID, int examID) {
        examDao.updateLessonID(lessonID, examID);
    }

    @Transactional
    public void addExamLesson(int examID, int lessonID) {
        examDao.addExamLesson(examID, lessonID);
    }

    @Transactional
    public List<Exam> findStudentByExamIDAndLessonID(int examID, int lessonID) {
        return examDao.findStudentByExamIDAndLessonID(examID, lessonID);
    }

    @Transactional
    public List<Exam> findExamLessonByExamID(int examID) {
        return examDao.findExamLessonByExamID(examID);
    }

    @Transactional
    public List<Exam> findExamScoreByExamIDAndStudentID(int lessonID, int examID) {
        return examDao.findExamScoreByExamIDAndStudentID(lessonID, examID);
    }

    @Transactional
    public List<Exam> findExamAndExamScoreByStudentID(int studentID) {
        return examDao.findExamAndExamScoreByStudentID(studentID);
    }

    @Transactional
    public List<Exam> findExamsByLessonID(int lessonID) {
        return examDao.findExamsByLessonID(lessonID);
    }

    @Transactional
    public void updateExamSetProportion(int proportion, int examID, int lessonID) {
        examDao.updateExamSetProportion(proportion, examID, lessonID);
    }

    @Transactional
    public List<Exam> findOneByOneRecordByExamIDAndStudntID(int currentPage, int examID, int studentID) {
        return examDao.findOneByOneRecordByExamIDAndStudntID(currentPage, examID, studentID);
    }

    @Transactional
    public int findCountByExamIDAndStudntID(int examID, int studentID) {
        return examDao.findCountByExamIDAndStudntID(examID, studentID);
    }

    @Transactional
    public void updateStudentScoreByExamIDAndStudntID(int studentScore, int questionID, int examID, int studentID) {
        examDao.updateStudentScoreByExamIDAndStudntID(studentScore, questionID, examID, studentID);
    }
}
