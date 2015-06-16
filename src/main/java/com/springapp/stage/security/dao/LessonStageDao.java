package com.springapp.stage.security.dao;

import com.springapp.stage.security.entity.Lesson;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS on 2015/6/5.
 */
public interface LessonStageDao {

    List<Lesson> findGrade(@Param("studentId") Integer studentId);
}
