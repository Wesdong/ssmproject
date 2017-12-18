package zust.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zust.dao.PictureMapper;
import zust.model.Picture;
import zust.service.PictureService;

import java.util.List;

@Service
public class PictureServiceImpl implements PictureService {

    @Autowired
    PictureMapper pictureMapper;

    public List<Picture> GetPicture() {
        List<Picture> list = pictureMapper.selectAllPicture();
        return list;
    }
}
