package com.springapp.mvc.service;

import com.springapp.mvc.dao.HomeworkDao;
import com.springapp.mvc.entity.Homework;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by maomao on 2015/5/7.
 */
@Service
@Transactional
public class HomeworkService {
    @Autowired
    HomeworkDao homeworkDao;

    @Transactional
    public Integer findLessonIDByTeacherID(String teacherID) {
        return homeworkDao.findLessonIDByTeacherID(teacherID);
    }

    @Transactional
    public List<Homework> findAllHomework(int teacherID) {
        return homeworkDao.findAllHomework(teacherID);
    }

    @Transactional
    public String findTeacherUriByHomeworkID(int homeworkID) {
        return homeworkDao.findTeacherUriByHomeworkID(homeworkID);
    }

    @Transactional
    public String findTeacherFileNameByHomeworkID(int homeworkID) {
        return homeworkDao.findTeacherFileNameByHomeworkID(homeworkID);
    }

    @Transactional
    public void updateSetHomeworkProportion(int proportion, int homeworkID, int lessonID) {
        homeworkDao.updateSetHomeworkProportion(proportion, homeworkID, lessonID);
    }

    @Transactional
    public int addHomeworkAndReturnHomeworkID(Homework homework) {
        homeworkDao.addHomework(homework);
        return homeworkDao.findCurrentHomeworkSequence();
    }

    @Transactional
    public void addHomeworkAndAddStudents(int homeworkID,int homeworkId,int lessonID) {
        homeworkDao.addHomeworkAndAddStudents(homeworkID,homeworkId, lessonID);
    }

    @Transactional
    public int addHomeworkAndLessonAndReturnHomeworkLessonID(int homeworkID, int lessonID) {
        homeworkDao.addHomeworkLesson(homeworkID, lessonID);
        return homeworkDao.findCurrentHomeworkLessonSequence();
    }

    @Transactional
    public List<Homework> findAllHomeworkByLessonID(int lessonID) {
        return homeworkDao.findAllHomeworkByLessonID(lessonID);
    }

    @Transactional
    public List<Homework> findLessonsByHomeworkID(int homeworkID) {
        return homeworkDao.findLessonsByHomeworkID(homeworkID);
    }

    @Transactional
    public List<Homework> findAllHomeworkByID(int id) {
        return homeworkDao.findAllHomeworkByID(id);
    }


}
