package zust.model;

import java.util.Date;

public class Userinfo {
    private Integer userinfoId;

    private String userinfoPicurl;

    private Byte userinfoVip;

    private String userinfoStatement;

    private Date userinfoBirth;

    public Integer getUserinfoId() {
        return userinfoId;
    }

    public void setUserinfoId(Integer userinfoId) {
        this.userinfoId = userinfoId;
    }

    public String getUserinfoPicurl() {
        return userinfoPicurl;
    }

    public void setUserinfoPicurl(String userinfoPicurl) {
        this.userinfoPicurl = userinfoPicurl == null ? null : userinfoPicurl.trim();
    }

    public Byte getUserinfoVip() {
        return userinfoVip;
    }

    public void setUserinfoVip(Byte userinfoVip) {
        this.userinfoVip = userinfoVip;
    }

    public String getUserinfoStatement() {
        return userinfoStatement;
    }

    public void setUserinfoStatement(String userinfoStatement) {
        this.userinfoStatement = userinfoStatement == null ? null : userinfoStatement.trim();
    }

    public Date getUserinfoBirth() {
        return userinfoBirth;
    }

    public void setUserinfoBirth(Date userinfoBirth) {
        this.userinfoBirth = userinfoBirth;
    }
}