package com.springapp.mvc.dao;

import com.springapp.mvc.entity.Score;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by maomao on 2015/6/4.
 */
public interface ScoreDao {
    public List<Score> findExamProportionAndScoreByStudentID(@Param("id") int id);

    public List<Score> findHomeworkProportionAndScoreByStudentID(@Param("id") int id);
}
