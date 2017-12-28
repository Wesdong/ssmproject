package zust.service;

import org.springframework.stereotype.Service;
import zust.model.User;

@Service
public interface UserService {
    public User insertUser(User user);
    public User selectUserByUserName(String username);
}
