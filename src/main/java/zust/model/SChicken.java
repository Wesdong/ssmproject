package zust.model;

import java.util.Date;

public class SChicken {
    private Integer scId;

    private Integer scUserId;

    private String scInfo;

    private Date scDate;

    private Integer scLike;

    private Integer scComments;

    private Byte scIfcomments;

    private Integer scPictureId;

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