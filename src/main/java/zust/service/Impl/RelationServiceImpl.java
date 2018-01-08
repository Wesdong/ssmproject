package zust.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zust.dao.RelationMapper;
import zust.model.Relation;
import zust.model.User;
import zust.service.RelationService;

import java.util.List;

@Service
public class RelationServiceImpl implements RelationService {

    @Autowired
    RelationMapper relationMapper;


    public void deleteByUserIdAndFollowerId(int userId, int followerId) {
        relationMapper.deleteByUserIdAndFollowerId(userId,followerId);
    }

    public void insertRelation(Relation relation) {
        relationMapper.insertSelective(relation);
    }
}
