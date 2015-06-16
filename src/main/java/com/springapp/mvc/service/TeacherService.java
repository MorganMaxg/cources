package com.springapp.mvc.service;

import com.springapp.mvc.dao.TeacherDao;
import com.springapp.mvc.entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by maomao on 2015/4/3.
 */
@Service
@Transactional
public class TeacherService {
    @Autowired
    TeacherDao teacherDao;

    public Teacher findByTeacherID(String teacherID) {
        return teacherDao.findByTeacherID(teacherID);
    }

    @Transactional
    public String findPasswordByTeacherID(String username) {
        return teacherDao.findPasswordByTeacherID(username);
    }

    @Transactional
    public List<Teacher> findAllTeachers() {
        return teacherDao.findAllTeachers();
    }

    @Transactional
    public void addTeacher(String teacherID, String teacherName, String basicInfo) {
        teacherDao.addTeacher(teacherID, teacherName, basicInfo);
    }

    @Transactional
    public Teacher findOneTeachers(int id) {
        return teacherDao.findOneTeachers(id);
    }

    @Transactional
    public void updateTeacher(Teacher teacher) {
        teacherDao.updateTeacher(teacher);
    }

    @Transactional
    public void deleteTeacher(int id) {
        teacherDao.deleteTeacher(id);
    }
}
