
package com.hdsoft.techblog.models;

public class Like {

    private long id;
    private long userid;
    private long postid;
    private String date;

    public Like() {
    }

    public Like(long userid, long postid, String date) {
        this.userid = userid;
        this.postid = postid;
        this.date = date;
    }

    public Like(long id, long userid, long postid, String date) {
        this.id = id;
        this.userid = userid;
        this.postid = postid;
        this.date = date;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserid() {
        return userid;
    }

    public void setUserid(long userid) {
        this.userid = userid;
    }

    public long getPostid() {
        return postid;
    }

    public void setPostid(long postid) {
        this.postid = postid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Like{" + "id=" + id + ", userid=" + userid + ", postid=" + postid + ", date=" + date + '}';
    }

}