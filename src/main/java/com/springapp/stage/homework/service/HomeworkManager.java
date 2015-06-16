package com.springapp.stage.homework.service;

import com.springapp.stage.homework.dao.HomeworkDao;
import com.springapp.stage.homework.entity.Homework;
import com.springapp.stage.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ASUS on 2015/5/7.
 */
@Service
@Transactional
public class HomeworkManager {
    @Autowired
    HomeworkDao homeworkDao;

    @Transactional(readOnly = true)
    public List<Homework> find(Integer studentId, Integer finish, Page page) {
        return homeworkDao.find(studentId, finish, page);
    }

    @Transactional(readOnly = true)
    public Homework findById(Integer id) {
        Homework homework = homeworkDao.findById(id);
        return homework;
    }

    @Transactional
    public void submitHomework(Integer homeworkId, Integer lessonId, Integer studentId, String fileName) {
        String uri = "" + System.currentTimeMillis();
        homeworkDao.updateHomeworkStudent(homeworkId, studentId, uri, fileName, 1);
        homeworkDao.updateCount(homeworkId, lessonId);
    }

    @Transactional(readOnly = true)
    public Homework findStudentHomework(Integer studentId, Integer homeworkId) {
        return homeworkDao.findStudentHomework(studentId, homeworkId);
    }

}
