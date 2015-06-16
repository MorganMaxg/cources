package com.springapp.stage.talk.service;

import ch.qos.logback.classic.Logger;
import com.springapp.stage.talk.dao.CommentDao;
import com.springapp.stage.talk.dao.NoteDao;
import com.springapp.stage.talk.entity.Comment;
import com.springapp.stage.talk.entity.Note;
import com.springapp.stage.utils.Page;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ASUS on 2015/6/5.
 */
@Service
@Transactional
public class NoteManager {
    private Logger logger = (Logger) LoggerFactory.getLogger(NoteManager.class);

    @Autowired
    private NoteDao noteDao;

    @Autowired
    private CommentDao commentDao;

    @Transactional(readOnly = true)
    public Note findById(Integer noteId) {
        return noteDao.findById(noteId);
    }

    @Transactional
    public void save(Note note) {
        noteDao.save(note);
    }

    @Transactional(readOnly = true)
    public List<Note> find(Integer studentId, Page<Note> page) {
        return noteDao.find(studentId, page);
    }

    @Transactional(readOnly = true)
    public Integer findCount(Integer studentId) {
        return noteDao.findCount(studentId);
    }

    @Transactional
    public void update(Note note) {
        noteDao.update(note);
    }

    @Transactional
    public void deleteById(Integer noteId) {
        noteDao.deleteById(noteId);
    }

    @Transactional
    public void saveComment(Comment comment) {
        commentDao.save(comment);
        Note note = new Note();
        note.setCurrentFloor(comment.getFloor());
        note.setNoteId(comment.getNoteId());
        noteDao.update(note);
    }

    @Transactional(readOnly = true)
    public List<Comment> findComments(Integer noteId, Page<Comment> page) {
        return commentDao.find(noteId, page);
    }

    @Transactional(readOnly = true)
    public Integer findCommentCount(Integer noteId) {
        return commentDao.finfCount(noteId);
    }
}
