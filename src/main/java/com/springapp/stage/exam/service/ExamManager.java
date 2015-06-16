package com.springapp.stage.exam.service;

import ch.qos.logback.classic.Logger;
import com.springapp.stage.exam.dao.ExamSDao;
import com.springapp.stage.exam.dao.QuestionSDao;
import com.springapp.stage.exam.entity.Exam;
import com.springapp.stage.exam.entity.Question;
import com.springapp.stage.utils.Page;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ASUS on 2015/5/30.
 */
@Service
@Transactional
public class ExamManager {

    private static Logger logger = (Logger) LoggerFactory.getLogger(ExamManager.class);
    @Autowired
    private ExamSDao examSDao;

    @Autowired
    private QuestionSDao questionSDao;

    @Transactional(readOnly = true)
    public List<Exam> find(Integer studentId) {
        return examSDao.find(studentId);
    }

    @Transactional(readOnly = true)
    public Exam findById(Integer examId) {
        return examSDao.findById(examId);
    }

    @Transactional(readOnly = true)
    public List<Question> findQuestions(Integer examId, Integer studentId, Page<Question> page) {
        return questionSDao.find(examId, studentId, page);
    }

    @Transactional(readOnly = true)
    public Integer findCountQuestionsInExam(Integer examId) {
        return questionSDao.findCountInExam(examId);
    }

    @Transactional
    public void saveStudentAnswer(Integer examId, Integer studentId, Integer questionId, String studentAnswer) {
        Question question = questionSDao.findById(questionId);
        Integer score = 0;
        if (question != null) {
            if (StringUtils.equals(question.getAnswer(), studentAnswer.trim())) {
                score = 1;
            }
            questionSDao.updateESQ(examId, studentId, questionId, studentAnswer.trim(), score);
        }
    }

    @Transactional
    public void submitExam(Integer examId, Integer studentId) {
        examSDao.updateES(examId, studentId, 1);
    }
}
