package com.springapp.stage.grade.service;

import ch.qos.logback.classic.Logger;
import com.springapp.stage.exam.dao.ExamSDao;
import com.springapp.stage.exam.entity.Exam;
import com.springapp.stage.homework.dao.HomeworkSDao;
import com.springapp.stage.homework.entity.Homework;
import com.springapp.stage.security.dao.LessonStageDao;
import com.springapp.stage.security.entity.Lesson;
import com.springapp.stage.utils.Page;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ASUS on 2015/6/3.
 */
@Service
@Transactional
public class GradeManager {
    private static final Logger logger = (Logger) LoggerFactory.getLogger(GradeManager.class);

    @Autowired
    private LessonStageDao lessonStageDao;

    @Autowired
    private ExamSDao examSDao;

    @Autowired
    private HomeworkSDao homeworkSDao;

    /**
     * 查询总成绩
     *
     * @param studentId
     * @return
     */
    @Transactional(readOnly = true)
    public List<Lesson> findLessonGrade(Integer studentId) {
        return lessonStageDao.findGrade(studentId);
    }

    /**
     * 查询考试成绩
     */
    @Transactional(readOnly = true)
    public List<Exam> findExamGrade(Integer studnetId) {
        return examSDao.find(studnetId);
    }

    /**
     * 查询作业成绩
     */
    @Transactional(readOnly = true)
    public List<Homework> findHomeworkGrade(Integer studentId, Page<Homework> page) {
        return homeworkSDao.find(studentId, null, page);
    }

}
