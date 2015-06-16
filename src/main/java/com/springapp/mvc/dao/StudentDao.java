package com.springapp.mvc.dao;

import com.springapp.mvc.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by maomao on 2015/3/20.
 */
public interface StudentDao {
    public List findAllStudents();

    public void addStudent(@Param("classID") int classID, @Param("studentID") String studentID, @Param("studentName") String studentName);

    //    public void addTempStudent(@Param("studentID")int  studentID,@Param("studentName")String studentName,@Param("className")String className);
    public Integer classIDFindByName(@Param("className") String className);

    public void updateStudent(@Param("student") Student student);

    public void deleteStudent(@Param("id") int id);

    public Student findOneStudentByStudentID(@Param("id") int id);

    public Student findOneStudentByID(@Param("id") int id);

    public int findCurrentStudentSequence();
}
