package com.springapp.stage.talk.dao;

import com.springapp.stage.talk.entity.Note;
import com.springapp.stage.utils.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ASUS on 2015/6/5.
 */
public interface NoteDao {
    /**
     *
     */
    Note findById(@Param("id") Integer id);

    /**
     *
     */
    void save(Note note);

    /**
     *
     */
    List<Note> find(
            @Param("createrId") Integer createrId,
            @Param("page") Page<Note> page
    );

    /**
     *
     */
    Integer findCount(
            @Param("createrId") Integer createrId
    );

    /**
     *
     */
    void update(Note note);

    /**
     *
     */
    void deleteById(@Param("id") Integer noteId);
}
