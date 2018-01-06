package zust.model;

import java.util.Date;
import java.util.List;

public class SChicken {
    private Integer scId;

    private Integer scUserId;

    private String scInfo;

    private Date scDate;

    private Integer scLike;

    private Integer scComments;

    private Byte scIfcomments;

    private Integer scPictureId;

    private Picture picture;

    private User user;

    private Userinfo userinfo;

    private List<Comments> commentsList;

    public List<Comments> getCommentsList() {
        return commentsList;
    }

    public void setCommentsList(List<Comments> commentsList) {
        this.commentsList = commentsList;
    }

    public Userinfo getUserinfo() {
        return userinfo;
    }

    public void setUserinfo(Userinfo userinfo) {
        this.userinfo = userinfo;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Picture getPicture() {
        return picture;
    }

    public void setPicture(Picture picture) {
        this.picture = picture;
    }

    public Integer getScId() {
        return scId;
    }

    public void setScId(Integer scId) {
        this.scId = scId;
    }

    public Integer getScUserId() {
        return scUserId;
    }

    public void setScUserId(Integer scUserId) {
        this.scUserId = scUserId;
    }

    public String getScInfo() {
        return scInfo;
    }

    public void setScInfo(String scInfo) {
        this.scInfo = scInfo == null ? null : scInfo.trim();
    }

    public Date getScDate() {
        return scDate;
    }

    public void setScDate(Date scDate) {
        this.scDate = scDate;
    }

    public Integer getScLike() {
        return scLike;
    }

    public void setScLike(Integer scLike) {
        this.scLike = scLike;
    }

    public Integer getScComments() {
        return scComments;
    }

    public void setScComments(Integer scComments) {
        this.scComments = scComments;
    }

    public Byte getScIfcomments() {
        return scIfcomments;
    }

    public void setScIfcomments(Byte scIfcomments) {
        this.scIfcomments = scIfcomments;
    }

    public Integer getScPictureId() {
        return scPictureId;
    }

    public void setScPictureId(Integer scPictureId) {
        this.scPictureId = scPictureId;
    }
}