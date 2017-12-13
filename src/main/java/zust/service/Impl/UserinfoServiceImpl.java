package zust.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zust.dao.UserinfoMapper;
import zust.model.Userinfo;
import zust.service.UserinfoService;

@Service
public class UserinfoServiceImpl implements UserinfoService {

    @Autowired
    UserinfoMapper userinfoMapper;

    public void InsertUserinfo(Userinfo userinfo) {
        userinfoMapper.insertSelective(userinfo);
    }
}
