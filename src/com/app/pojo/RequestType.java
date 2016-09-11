package com.app.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="RequestType")
public class RequestType implements Serializable {

    List<Topic> topicList;
    private String location;
    Date start;
    Date end;
    String userId;
    String companyId;
    String requestId;

    public RequestType() {
    }

    public RequestType(List<Topic> topicList, String location, Date start, Date end, String userId,
                       String requestId, String companyId) {
        this.topicList = topicList;
        this.location = location;
        this.start = start;
        this.end = end;
        this.userId = userId;
        this.requestId = requestId;
        this.companyId = companyId;
    }

    public List<Topic> getTopicList() {
        return topicList;
    }

    public void setTopicList(List<Topic> topicList) {
        this.topicList = topicList;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }
}