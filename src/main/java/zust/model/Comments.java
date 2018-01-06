package zust.model;

import java.util.Date;

public class Comments {
    private Integer commentsId;

    private Integer commentsUserId;

    private Integer commentsScId;

    private String commentsInfo;

    private Date commentsDate;

    private User user_commented;

    public User getUser_commented() {
        return user_commented;
    }

    public void setUser_commented(User user_commented) {
        this.user_commented = user_commented;
    }

    public Integer getCommentsId() {
        return commentsId;
    }

    public void setCommentsId(Integer commentsId) {
        this.commentsId = commentsId;
    }

    public Integer getCommentsUserId() {
        return commentsUserId;
    }

    public void setCommentsUserId(Integer commentsUserId) {
        this.commentsUserId = commentsUserId;
    }

    public Integer getCommentsScId() {
        return commentsScId;
    }

    public void setCommentsScId(Integer commentsScId) {
        this.commentsScId = commentsScId;
    }

    public String getCommentsInfo() {
        return commentsInfo;
    }

    public void setCommentsInfo(String commentsInfo) {
        this.commentsInfo = commentsInfo == null ? null : commentsInfo.trim();
    }

    public Date getCommentsDate() {
        return commentsDate;
    }

    public void setCommentsDate(Date commentsDate) {
        this.commentsDate = commentsDate;
    }
}