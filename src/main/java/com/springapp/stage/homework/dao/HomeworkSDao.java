package com.springapp.stage.homework.dao;

import com.springapp.stage.homework.entity.Homework;
import com.springapp.stage.utils.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS on 2015/5/7.
 */
public interface HomeworkSDao {
    /**
     * @param studentId
     * @param page
     * @return
     */
    public List<Homework> find(
            @Param("studentId") Integer studentId,
            @Param("finish") Integer finish,
            @Param("page") Page page
    );

    /**
     *
     */
    public Homework findById(@Param("id") Integer id);

    /**
     * 计数+1
     */
    public int updateCount(
            @Param("homeworkId") Integer homeworkId,
            @Param("lessonId") Integer lessonId
    );

    /**
     * 更新homework_students
     */
    public int updateHomeworkStudent(
            @Param("homeworkId") Integer homeworkId,
            @Param("studentId") Integer studentId,
            @Param("uri") String uri,
            @Param("fileName") String fileName,
            @Param("finish") Integer finish
    );

    /**
     *
     */
    Homework findStudentHomework(
            @Param("studentId") Integer studentId,
            @Param("homeworkId") Integer homeworkId
    );
}
