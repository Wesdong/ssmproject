package zust.service;

import org.springframework.stereotype.Service;
import zust.model.Picture;

import java.util.List;

@Service
public interface PictureService {
    public List<Picture> GetPicture();
    public void insertSelectPicture(Picture picture);
    public Picture selectPictureByName(String pictureName);
}
