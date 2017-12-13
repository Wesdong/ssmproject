package zust.model;

public class File {
    private Integer fileId;

    private String fileUrl;

    private Integer fileMessagesId;

    public Integer getFileId() {
        return fileId;
    }

    public void setFileId(Integer fileId) {
        this.fileId = fileId;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl == null ? null : fileUrl.trim();
    }

    public Integer getFileMessagesId() {
        return fileMessagesId;
    }

    public void setFileMessagesId(Integer fileMessagesId) {
        this.fileMessagesId = fileMessagesId;
    }
}