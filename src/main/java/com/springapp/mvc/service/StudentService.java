package com.springapp.mvc.service;

import com.springapp.mvc.dao.StudentDao;
import com.springapp.mvc.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by maomao on 2015/3/20.
 */
@Service
@Transactional
public class StudentService {
    @Autowired
    StudentDao studentDao;

    @Transactional(readOnly = true)
    public List<Student> findAllStudents() {
        return studentDao.findAllStudents();
    }

    @Transactional
    public int insertStudentAndReturnID(int classID, String studentID, String studentName) {
        studentDao.addStudent(classID, studentID, studentName);
        return studentDao.findCurrentStudentSequence();
    }

    public int classIDFindByName(String className) {
        return studentDao.classIDFindByName(className);
    }

    @Transactional
    public void updateStudent(Student student) {
        studentDao.updateStudent(student);
    }

    @Transactional
    public void deleteStudent(int id) {
        studentDao.deleteStudent(id);
    }

    @Transactional
    public Student findOneStudentByStudentID(int id) {
        return studentDao.findOneStudentByStudentID(id);
    }

    @Transactional
    public Student findOneStudentByID(int id) {
        return studentDao.findOneStudentByID(id);
    }

}
