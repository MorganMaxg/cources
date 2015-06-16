package com.springapp.mvc.dao;

import com.springapp.mvc.entity.HomeworkStudents;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by maomao on 2015/5/10.
 */
public interface HomeworkStudentsDao {
    public List<HomeworkStudents> findAllHomeworkStudents();

    public List<HomeworkStudents> findHomeworkStudentsByTeacherFileName(String teacherFileName);

    public List<HomeworkStudents> findAllHomeworkStudentsByHomeworkID(@Param("homeworkID") int homeworkID, @Param("lessonID") int lessonID);

    public void updateScore(@Param("score") int score, @Param("id") int id);

    public List<HomeworkStudents> findHomeworkAndScoreByID(@Param("id") int id);
}
