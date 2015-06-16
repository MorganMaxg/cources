package com.springapp.mvc.dao;

import com.springapp.mvc.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by maomao on 2015/4/3.
 */
public interface TeacherDao {
    public Teacher findByTeacherID(@Param("teacherID") String teacherID);

    public String findPasswordByTeacherID(@Param("username") String username);

    public List<Teacher> findAllTeachers();

    public void addTeacher(@Param("teacherID") String teacherID, @Param("teacherName") String teacherName, @Param("basicInfo") String basicInfo);

    public Teacher findOneTeachers(@Param("id") int id);

    public void updateTeacher(@Param("teacher") Teacher teacher);

    public void deleteTeacher(@Param("id") int id);
}
