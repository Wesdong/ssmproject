package zust.model;

import java.util.Date;

public class Messages {
    private Integer messagesId;

    private Integer messagesUserId;

    private Integer messagedUserId;

    private String messagesInfo;

    private Date messagesDate;

    private String messagesStatus;

    public Integer getMessagesId() {
        return messagesId;
    }

    public void setMessagesId(Integer messagesId) {
        this.messagesId = messagesId;
    }

    public Integer getMessagesUserId() {
        return messagesUserId;
    }

    public void setMessagesUserId(Integer messagesUserId) {
        this.messagesUserId = messagesUserId;
    }

    public Integer getMessagedUserId() {
        return messagedUserId;
    }

    public void setMessagedUserId(Integer messagedUserId) {
        this.messagedUserId = messagedUserId;
    }

    public String getMessagesInfo() {
        return messagesInfo;
    }

    public void setMessagesInfo(String messagesInfo) {
        this.messagesInfo = messagesInfo == null ? null : messagesInfo.trim();
    }

    public Date getMessagesDate() {
        return messagesDate;
    }

    public void setMessagesDate(Date messagesDate) {
        this.messagesDate = messagesDate;
    }

    public String getMessagesStatus() {
        return messagesStatus;
    }

    public void setMessagesStatus(String messagesStatus) {
        this.messagesStatus = messagesStatus == null ? null : messagesStatus.trim();
    }
}