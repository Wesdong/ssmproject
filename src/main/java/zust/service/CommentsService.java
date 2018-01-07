package zust.service;

import org.springframework.stereotype.Service;
import zust.model.Comments;

@Service
public interface CommentsService {
    public void insertComment(Comments comments);
}
