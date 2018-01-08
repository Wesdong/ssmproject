package zust.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zust.dao.CommentsMapper;
import zust.model.Comments;
import zust.service.CommentsService;

@Service
public class CommentsServiceImpl implements CommentsService{

    @Autowired
    CommentsMapper commentsMapper;

    public void insertComment(Comments comments) {
        commentsMapper.insertSelective(comments);
    }
}
