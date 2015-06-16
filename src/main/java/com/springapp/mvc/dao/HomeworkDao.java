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

    public int findCurrentHomeworkSequence();//����Homework���������еĵ�ǰֵ

    public int findCurrentHomeworkLessonSequence();//����Homework_Lesson���������еĵ�ǰֵ

    public List<Homework> findAllHomeworkByLessonID(@Param("lessonID") int lessonID);

    public void addHomeworkAndAddStudents(@Param("homeworkLessonID") int homeworkLessonID, @Param("lessonID") int lessonID);//���ѧ����ҵ��ͬʱ����ҵ��ѧ��

    public List<Homework> findLessonsByHomeworkID(@Param("homeworkID") int homeworkID);

    public List<Homework> findAllHomeworkByID(@Param("id") int id);

}
