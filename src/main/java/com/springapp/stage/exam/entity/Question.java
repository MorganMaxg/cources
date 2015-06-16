package com.springapp.stage.exam.entity;

import com.alibaba.fastjson.JSONObject;

import java.io.Serializable;
import java.util.Map;

/**
 * Created by ASUS on 2015/4/16.
 */
public class Question implements Serializable {
    private Integer questionId;
    private String questionType;
    private String content;
    private String answer;
    private String choices;
    private Map choiceMap;
    private String studentAnswer;
    private Integer score;

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Map getChoiceMap() {
        if (this.choices != null && !"".equals(choices)) {
            this.choiceMap = JSONObject.parseObject(choices, Map.class);
        }
        return choiceMap;
    }

    public void setChoiceMap(Map choiceMap) {
        this.choiceMap = choiceMap;
    }

    public String getStudentAnswer() {
        return studentAnswer;
    }

    public void setStudentAnswer(String studentAnswer) {
        this.studentAnswer = studentAnswer;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getChoices() {
        return choices;
    }

    public void setChoices(String choices) {
        this.choices = choices;
    }
}
