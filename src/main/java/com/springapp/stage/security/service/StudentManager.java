package com.springapp.stage.security.service;

import ch.qos.logback.classic.Logger;
import com.springapp.stage.security.dao.StudentDao;
import com.springapp.stage.security.entity.Student;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by ASUS on 2015/6/6.
 */
@Service
@Transactional
public class StudentManager {
    private static Logger logger = (Logger) LoggerFactory.getLogger(StudentManager.class);

    @Autowired
    private StudentDao studentDao;

    /**
     *
     */
    @Transactional(readOnly = true)
    public Student findByStudentId(String studentId) {
        return studentDao.findByStudentId(studentId);
    }

    @Transactional
    public void updateTime(Student student) {
        studentDao.updateTime(student);
    }

}
