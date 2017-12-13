package zust.model;

public class Picture {
    private Integer pictureId;

    private Integer pictureUserId;

    private String pictureUrl;

    public Integer getPictureId() {
        return pictureId;
    }

    public void setPictureId(Integer pictureId) {
        this.pictureId = pictureId;
    }

    public Integer getPictureUserId() {
        return pictureUserId;
    }

    public void setPictureUserId(Integer pictureUserId) {
        this.pictureUserId = pictureUserId;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl == null ? null : pictureUrl.trim();
    }
}