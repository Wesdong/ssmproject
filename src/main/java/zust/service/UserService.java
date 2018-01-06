package zust.service;

import org.springframework.stereotype.Service;
import zust.model.User;

import java.util.List;

@Service
public interface UserService {
    public User insertUser(User user);
    public User selectByUserName(String username);
    public Integer selectFollows(Integer userId);
    public Integer selectFans(Integer userId);
    public Integer selectscs(Integer userId);
    public List<User> selectFansUserList(Integer userId);
    List<User> selectFollowsUserList(Integer userId);
    int updateByPrimaryKeySelective(User record);
}
