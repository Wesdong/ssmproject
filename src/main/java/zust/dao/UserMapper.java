package zust.dao;

import zust.model.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    User selectByUserName(String userName);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    Integer selectFollows(Integer userId);

    Integer selectFans(Integer userId);

    Integer selectscs(Integer userId);

    List<User> selectFansUserList(Integer userId);

    List<User> selectFollowsUserList(Integer userId);

    List<User> selectFansByUserId(int userId);

    List<User> selectFollowsByUserId(int userId);

    List<User> selectByAnyName(String name,int userId);

    List<User> AllUser();
}