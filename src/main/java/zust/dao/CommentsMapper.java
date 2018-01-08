package zust.dao;

import zust.model.Comments;

public interface CommentsMapper {
    int deleteByPrimaryKey(Integer commentsId);

    int insert(Comments record);

    int insertSelective(Comments record);

    Comments selectByPrimaryKey(Integer commentsId);

    int updateByPrimaryKeySelective(Comments record);

    int updateByPrimaryKey(Comments record);

    void deleteByScId(int scId);
}