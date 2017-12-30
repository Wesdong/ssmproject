package zust.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zust.dao.UserMapper;
import zust.model.User;
import zust.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    public User insertUser(User user) {
        userMapper.insertSelective(user);
        return user;
    }

    public User selectUserByUserName(String username) {
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
}
