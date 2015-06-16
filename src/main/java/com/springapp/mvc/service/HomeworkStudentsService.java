package com.springapp.mvc.service;

import com.springapp.mvc.dao.HomeworkStudentsDao;
import com.springapp.mvc.entity.HomeworkStudents;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by maomao on 2015/5/10.
 */
@Service
@Transactional
public class HomeworkStudentsService {
    @Autowired
    HomeworkStudentsDao homeworkStudentsDao;

    @Transactional
    public List<HomeworkStudents> findAllHomeworkStudents() {
        return homeworkStudentsDao.findAllHomeworkStudents();
    }

    @Transactional
    public List<HomeworkStudents> findAllHomeworkStudentsByHomeworkID(int homeworkID, int lessonID) {
        return homeworkStudentsDao.findAllHomeworkStudentsByHomeworkID(homeworkID, lessonID);
    }

    @Transactional
    public List<HomeworkStudents> findHomeworkStudentsByTeacherFileName(String teacherFileName) {
        return homeworkStudentsDao.findHomeworkStudentsByTeacherFileName(teacherFileName);
    }

    @Transactional
    public void updateScore(int score, int id) {
        homeworkStudentsDao.updateScore(score, id);
    }

    @Transactional
    public List<HomeworkStudents> findHomeworkAndScoreByID(int id) {
        return homeworkStudentsDao.findHomeworkAndScoreByID(id);
    }
}
