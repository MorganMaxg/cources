package com.springapp.stage.exam.dao;

import com.springapp.stage.exam.entity.Question;
import com.springapp.stage.utils.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS on 2015/5/30.
 */
public interface QuestionSDao {

    /**
     *
     */
    List<Question> find(
            @Param("examId") Integer examId,
            @Param("studentId") Integer studentId,
            @Param("page") Page<Question> page
    );

    /**
     * @param examId
     * @return
     */
    Integer findCountInExam(@Param("examId") Integer examId);

    /**
     *
     */
    Question findById(@Param("id") Integer questionId);

    /**
     *
     */
    void updateESQ(
            @Param("examId") Integer examId,
            @Param("studentId") Integer studentId,
            @Param("questionId") Integer questionId,
            @Param("studentAnswer") String studentAnswer,
            @Param("score") Integer score
    );


}
