package zust.dao;

import com.github.pagehelper.PageInfo;
import zust.model.SChicken;

import java.util.List;

public interface SChickenMapper {
    int deleteByPrimaryKey(Integer scId);

    int insert(SChicken record);

    int insertSelective(SChicken record);

    SChicken selectByPrimaryKey(Integer scId);

    int updateByPrimaryKeySelective(SChicken record);

    int updateByPrimaryKey(SChicken record);

    List<SChicken> selectByTime();

    List<SChicken> selectByInfo(String searchinfo);

    List<SChicken> selectByUserID(int id);
}