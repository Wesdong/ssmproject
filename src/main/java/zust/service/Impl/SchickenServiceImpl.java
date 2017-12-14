package zust.service.Impl;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zust.dao.SChickenMapper;
import zust.model.PageInfo;
import zust.model.SChicken;
import zust.service.SchickenService;

import java.util.List;

@Service
public class SchickenServiceImpl implements SchickenService {

    @Autowired
    SChickenMapper sChickenMapper;

    public PageInfo<SChicken> selectByTime(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<SChicken> list = sChickenMapper.selectByTime();
        return new PageInfo<SChicken>(list);
    }
}
