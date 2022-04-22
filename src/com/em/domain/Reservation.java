package com.em.domain;

import java.util.Date;

/**
 * Created by Admiral on 2018/1/18.
 */
public class Reservation {
    private int id;

    private int roomId;

    private String user;
    
    private String username;
    
    private String reason;

    private String mobile;

    private Date date;

    private Date beginTime;

    private Date endTime;

    private String mark;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Override
	public String toString() {
		return "Reservation [id=" + id + ", roomId=" + roomId + ", user=" + user + ", username=" + username
				+ ", reason=" + reason + ", mobile=" + mobile + ", date=" + date + ", beginTime=" + beginTime
				+ ", endTime=" + endTime + ", mark=" + mark + "]";
	}
    
}
