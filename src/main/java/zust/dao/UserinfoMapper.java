package zust.dao;

import zust.model.Userinfo;

public interface UserinfoMapper {
    int deleteByPrimaryKey(Integer userinfoId);

    int insert(Userinfo record);

    int insertSelective(Userinfo record);

    Userinfo selectByPrimaryKey(Integer userinfoId);

    int updateByPrimaryKeySelective(Userinfo record);

    int updateByPrimaryKey(Userinfo record);
}