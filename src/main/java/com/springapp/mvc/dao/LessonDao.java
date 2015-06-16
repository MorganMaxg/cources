package com.springapp.mvc.dao;

import com.springapp.mvc.entity.Lesson;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by maomao on 2015/5/19.
 */
public interface LessonDao {
    public List<Lesson> findAllLessonByTeacherID(@Param("teacherID") int teacherID);

    public List<Lesson> findAllStudentIDByLessonID(@Param("lessonID") int lessonID);

    public List<Lesson> findAllStudentsByLessonID(@Param("lessonID") int lessonID, @Param("homeworkID") int homeworkID);

    public List<Lesson> findSampleStudentInfoByLessonID(@Param("lessonID") int lessonID);

    public List<Lesson> findAllStudentsAndLessonFinalScoreByLessonID(@Param("lessonID") int lessonID);

    public void insertLessonStudnet(@Param("lessonID") int lessonID, @Param("id") int id);

    public void updateFinalScore(@Param("finalScore") int finalScore, @Param("lessonID") int lessonID, @Param("id") int id);

    public void addLessonByTeacher(@Param("lessonName") String lessonName, @Param("teacherID") int teacherID, @Param("date") Date date);
}
