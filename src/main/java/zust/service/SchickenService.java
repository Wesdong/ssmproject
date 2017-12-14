package zust.service;

import org.springframework.stereotype.Service;
import zust.model.PageInfo;
import zust.model.SChicken;

@Service
public interface SchickenService {
    public PageInfo<SChicken> selectByTime(int pageNum,int pageSize);
}
