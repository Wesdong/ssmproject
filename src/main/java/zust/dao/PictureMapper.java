package zust.dao;

import zust.model.Picture;

import java.util.List;

public interface PictureMapper {
    int deleteByPrimaryKey(Integer pictureId);

    int insert(Picture record);

    int insertSelective(Picture record);

    Picture selectByPrimaryKey(Integer pictureId);

    int updateByPrimaryKeySelective(Picture record);

    int updateByPrimaryKey(Picture record);

    List<Picture> selectAllPicture();

    Picture selectByPictureName(String pictureName);

    void deleteByScPk(int scId);
}