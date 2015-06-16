package com.springapp.mvc.dao;

import com.springapp.mvc.entity.Question;

import java.util.List;
import java.util.Map;

/**
 * Created by maomao on 2015/4/24.
 */
public interface QuestionDao {
    public List findSingleChoiceQuestion();

    public void addSingleChoiceQuestion(Question question);

    public void addCheckingQuestion(Question question);

    public List findCheckingQuestion();

    public void addSubjectiveItemQuestion(Question question);

    public List findSubjectiveItemQuestion();

    public void addShortAnswerQuestion(Question question);

    public List findShortAnswerQuestion();

    //    public List findByRandomAndLimitNum(@Param("questionType")String questionType,@Param("limitNum") Integer limit);
    public List findByRandomAndLimitNum(Map<String, Object> map);
}
