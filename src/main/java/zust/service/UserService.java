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
    List<User> findfansListByUserId(int userId);
    List<User> findfollowsListByUserId(int userId);
    List<User> selectByAnyName(String name,int userId);
    List<User> AllUser();
    void deleteUserById(int userId);
    User selectByUserId(int userId);
}
