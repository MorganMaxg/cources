package com.springapp.stage.exam.dao;

import com.springapp.stage.exam.entity.Exam;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS on 2015/5/30.
 */
public interface ExamSDao {
    /**
     *
     */
    List<Exam> find(@Param("studentId") Integer studentId);

    /**
     *
     */
    Exam findById(@Param("examId") Integer examId);

    /**
     *
     */
    void updateES(
            @Param("examId") Integer examId,
            @Param("studentId") Integer studentId,
            @Param("finish") Integer finish
    );
}
