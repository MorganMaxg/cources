package com.springapp.mvc.service;

import com.springapp.mvc.dao.QuestionDao;
import com.springapp.mvc.entity.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by maomao on 2015/4/24.
 */
@Service
@Transactional
public class QuestionService {
    @Autowired
    QuestionDao questionDao;

    @Transactional
    public List findSingleChoiceQuestion() {
        return questionDao.findSingleChoiceQuestion();
    }

    @Transactional
    public void addSingleChoiceQuestion(Question question) {
        questionDao.addSingleChoiceQuestion(question);
    }

    @Transactional
    public void addCheckingQuestion(Question question) {
        questionDao.addCheckingQuestion(question);
    }

    @Transactional
    public List findCheckingQuestion() {
        return questionDao.findCheckingQuestion();
    }

    @Transactional
    public void addSubjectiveItemQuestion(Question question) {
        questionDao.addSubjectiveItemQuestion(question);
    }

    @Transactional
    public List findSubjectiveItemQuestion() {
        return questionDao.findSubjectiveItemQuestion();
    }

    @Transactional
    public void addShortAnswerQuestion(Question question) {
        questionDao.addShortAnswerQuestion(question);
    }

    @Transactional
    public List findShortAnswerQuestion() {
        return questionDao.findShortAnswerQuestion();
    }

    //    @Transactional
//    public List<Question> findByRandomAndLimitNum(List<Map> mapList){
//        List<Question> questions=new ArrayList<Question>();
//        for(Map map:mapList)
//        {
//            List<Question> list=questionDao.findByRandomAndLimitNum((String)map.get("type"),(Integer)map.get("num"));
//            questions.addAll(list);
//        }
//        return questions;
//    }
    @Transactional
    public List findByRandomAndLimitNum(Map<String, Object> map) {
        return questionDao.findByRandomAndLimitNum(map);
    }
}
