package zust.dao;

import zust.model.Relation;
import zust.model.User;

import java.util.List;

public interface RelationMapper {
    int deleteByPrimaryKey(Integer relationId);

    int insert(Relation record);

    int insertSelective(Relation record);

    Relation selectByPrimaryKey(Integer relationId);

    int updateByPrimaryKeySelective(Relation record);

    int updateByPrimaryKey(Relation record);

    void deleteByUserIdAndFollowerId(int userId,int followerId);
}