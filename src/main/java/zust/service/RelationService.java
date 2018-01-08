package zust.service;

import org.springframework.stereotype.Service;
import zust.model.Relation;
import zust.model.User;

import java.util.List;

@Service
public interface RelationService {
    void deleteByUserIdAndFollowerId(int userId,int followerId);
    void insertRelation(Relation relation);
}
