
package com.hdsoft.techblog.models;


public class Comment {
    private long id;
    private long userid;
    private long postid;
    private String comment;
    private String reply;
    private String date;
    private String time;

    public Comment() {
    }

    public Comment(long userid, long postid, String comment, String reply, String date, String time) {
        this.userid = userid;
        this.postid = postid;
        this.comment = comment;
        this.reply = reply;
        this.date = date;
        this.time = time;
    }

    public Comment(long id, long userid, long postid, String comment, String reply, String date, String time) {
        this.id = id;
        this.userid = userid;
        this.postid = postid;
        this.comment = comment;
        this.reply = reply;
        this.date = date;
        this.time = time;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Comment{" + "id=" + id + ", userid=" + userid + ", postid=" + postid + ", comment=" + comment + ", reply=" + reply + ", date=" + date + ", time=" + time + '}';
    }
}
