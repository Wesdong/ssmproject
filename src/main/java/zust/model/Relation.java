package zust.model;

import java.util.List;

public class Relation {
    private Integer relationId;

    private Integer relationUserId;

    private Integer relatedUserId;

    private Integer relationType;

    private List<User> userList;

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public Integer getRelationId() {
        return relationId;
    }

    public void setRelationId(Integer relationId) {
        this.relationId = relationId;
    }

    public Integer getRelationUserId() {
        return relationUserId;
    }

    public void setRelationUserId(Integer relationUserId) {
        this.relationUserId = relationUserId;
    }

    public Integer getRelatedUserId() {
        return relatedUserId;
    }

    public void setRelatedUserId(Integer relatedUserId) {
        this.relatedUserId = relatedUserId;
    }

    public Integer getRelationType() {
        return relationType;
    }

    public void setRelationType(Integer relationType) {
        this.relationType = relationType;
    }
}