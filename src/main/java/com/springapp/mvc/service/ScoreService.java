package com.springapp.mvc.service;

import com.springapp.mvc.dao.ScoreDao;
import com.springapp.mvc.entity.Score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by maomao on 2015/6/4.
 */
@Service
@Transactional
public class ScoreService {
    @Autowired
    ScoreDao scoreDao;

    @Transactional
    public List<Score> findExamProportionAndScoreByStudentID(int id) {
        return scoreDao.findExamProportionAndScoreByStudentID(id);
    }

    @Transactional
    public List<Score> findHomeworkProportionAndScoreByStudentID(int id) {
        return scoreDao.findHomeworkProportionAndScoreByStudentID(id);
    }
}
