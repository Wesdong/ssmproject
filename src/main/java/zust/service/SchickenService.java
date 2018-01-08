package zust.service;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import zust.model.SChicken;

import java.util.List;

@Service
public interface SchickenService {
    public PageInfo<SChicken> selectByTime(int pageNum, int pageSize);
    public SChicken selectByPK(int id);
    public List<SChicken> selectBYTIME();
    public PageInfo<SChicken> selectByInfo(String what2search,int pageNum, int pageSize);
    public void insertSC(SChicken sc);
    public  List<SChicken> selectFollowsSCByUserId(int userId);
    public void updateSchicken(SChicken sChicken);
    void deletscByPk(int scId);
}
