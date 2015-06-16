package com.springapp.mvc.dao;

import com.springapp.mvc.entity.Homework;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by maomao on 2015/4/24.
 */
public interface HomeworkDao {
    public void addHomework(@Param("homework") Homework homework);

    public Integer findLessonIDByTeacherID(String teacherID);

    public List<Homework> findAllHomework(@Param("teacherID") int teacherID);

    public String findTeacherUriByHomeworkID(int homeworkID);

    public String findTeacherFileNameByHomeworkID(int homeworkID);

    public void updateSetHomeworkProportion(@Param("proportion") int proportion, @Param("homeworkID") int homeworkID, @Param("lessonID") int lessonID);

    public void addHomeworkLesson(@Param("homeworkID") int homeworkID, @Param("lessonID") int lessonID);

    public int findCurrentHomeworkSequence();//返回Homework表自增序列的当前值

    public int findCurrentHomeworkLessonSequence();//返回Homework_Lesson表自增序列的当前值

    public List<Homework> findAllHomeworkByLessonID(@Param("lessonID") int lessonID);

    public void addHomeworkAndAddStudents(@Param("homeworkLessonID") int homeworkLessonID, @Param("lessonID") int lessonID);//添加学生作业的同时绑定作业和学生

    public List<Homework> findLessonsByHomeworkID(@Param("homeworkID") int homeworkID);

    public List<Homework> findAllHomeworkByID(@Param("id") int id);

}
