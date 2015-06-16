package com.springapp.stage.security.dao;

import com.springapp.stage.security.entity.Student;
import org.apache.ibatis.annotations.Param;

/**
 * Created by ASUS on 2015/4/9.
 */
public interface StudentDao {
    /**
     *
     */
    Student findByStudentId(@Param("studentId") String studentId);

    /**
     *
     */
    void updateTime(Student student);
}
