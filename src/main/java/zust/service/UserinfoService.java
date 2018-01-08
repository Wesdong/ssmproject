package zust.service;

import org.springframework.stereotype.Service;
import zust.model.Userinfo;

@Service
public interface UserinfoService {
    public void InsertUserinfo(Userinfo userinfo);
    public void updateUserinfo(Userinfo userinfo);
}
