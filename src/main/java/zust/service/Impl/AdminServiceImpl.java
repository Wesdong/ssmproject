package zust.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zust.dao.AdminMapper;
import zust.model.Admin;
import zust.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    public Admin selectByName(String name) {
        return adminMapper.selectByPrimaryKey(1);
    }
}
