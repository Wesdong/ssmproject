package zust.dao;

import zust.model.Messages;

public interface MessagesMapper {
    int deleteByPrimaryKey(Integer messagesId);

    int insert(Messages record);

    int insertSelective(Messages record);

    Messages selectByPrimaryKey(Integer messagesId);

    int updateByPrimaryKeySelective(Messages record);

    int updateByPrimaryKey(Messages record);
}