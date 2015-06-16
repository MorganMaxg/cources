package com.springapp.mvc.service;

import com.springapp.mvc.dao.LessonDao;
import com.springapp.mvc.entity.Lesson;
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
public class LessonService {
    @Autowired
    LessonDao lessonDao;

    @Transactional
    public List<Lesson> findAllLessonByTeacherID(int teacherID) {
        return lessonDao.findAllLessonByTeacherID(teacherID);
    }

    @Transactional
    public List<Lesson> findAllStudentIDByLessonID(int lessonID) {
        return lessonDao.findAllStudentIDByLessonID(lessonID);
    }

    @Transactional
    public List<Lesson> findAllStudentsByLessonID(int lessonID, int homeworkID) {
        return lessonDao.findAllStudentsByLessonID(lessonID, homeworkID);
    }

    @Transactional
    public List<Lesson> findSampleStudentInfoByLessonID(int lessonID) {
        return lessonDao.findSampleStudentInfoByLessonID(lessonID);
    }

    @Transactional
    public List<Lesson> findAllStudentsAndLessonFinalScoreByLessonID(int lessonID) {
        return lessonDao.findAllStudentsAndLessonFinalScoreByLessonID(lessonID);
    }

    @Transactional
    public void insertLessonStudnet(int lessonID, int id) {
        lessonDao.insertLessonStudnet(lessonID, id);
    }

    @Transactional
    public void updateFinalScore(int finalScore, int lessonID, int id) {
        lessonDao.updateFinalScore(finalScore, lessonID, id);
    }

    @Transactional
    public void addLessonByTeacher(String lessonName, int teacherID, Date date) {
        lessonDao.addLessonByTeacher(lessonName, teacherID, date);
    }
}
