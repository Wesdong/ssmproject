package zust.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zust.dao.UserMapper;
import zust.model.User;
import zust.service.UserService;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    public User insertUser(User user) {
        userMapper.insertSelective(user);
        return user;
    }

    public User selectByUserName(String username) {
        User user = userMapper.selectByUserName(username);
        return user;
    }

    public Integer selectFollows(Integer userId) {
        Integer follows = userMapper.selectFollows(userId);
        return follows;
    }

    public Integer selectFans(Integer userId) {
        Integer fans = userMapper.selectFans(userId);
        return fans;
    }

    public Integer selectscs(Integer userId) {
        Integer scs = userMapper.selectscs(userId);
        return scs;
    }

    public List<User> selectFansUserList(Integer userId) {
        List<User> userList = userMapper.selectFansUserList(userId);
        return userList;
    }

    public List<User> selectFollowsUserList(Integer userId) {
        List<User> followList = userMapper.selectFollowsUserList(userId);
        return followList;
    }

    public int updateByPrimaryKeySelective(User record){
        return userMapper.updateByPrimaryKeySelective(record);
    }


}
