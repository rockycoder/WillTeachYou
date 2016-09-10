package com.app.pojo;

import java.util.List;

public class ClassRoom {

    protected String name;
    protected int capacity;
    protected List<Topic> topics;
    protected String classRoomId;

    // to mark the availability
    protected boolean isAvailable;

    public ClassRoom(int capacity, List<Topic> topics, String classRoomId, boolean isAvailable, String name) {
        this.capacity = capacity;
        this.topics = topics;
        this.classRoomId = classRoomId;
        this.isAvailable = isAvailable;
        this.name = name;
    }

    public ClassRoom() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public List<Topic> getTopics() {
        return topics;
    }

    public void setTopics(List<Topic> topics) {
        this.topics = topics;
    }

    public String getClassRoomId() {
        return classRoomId;
    }

    public void setClassRoomId(String classRoomId) {
        this.classRoomId = classRoomId;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    
    
}