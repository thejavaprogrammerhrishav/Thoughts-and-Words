
package com.hdsoft.techblog.models;


public class Post {
    private long id;
    private long userId;
    private String name;
    private String title;
    private String subTitle;
    private String date;
    private String time;
    private long categoryId;
    private String content;
    private String files;
    private String privacy;
    
    //shuru kora jaay ki 

    public Post() {
    }

    public Post(long userId, String name, String title, String subTitle, String date, String time, long categoryId, String content, String files, String privacy) {
        this.userId = userId;
        this.name = name;
        this.title = title;
        this.subTitle = subTitle;
        this.date = date;
        this.time = time;
        this.categoryId = categoryId;
        this.content = content;
        this.files = files;
        this.privacy = privacy;
    }

    public Post(long id, long userId, String name, String title, String subTitle, String date, String time, long categoryId, String content, String files, String privacy) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.title = title;
        this.subTitle = subTitle;
        this.date = date;
        this.time = time;
        this.categoryId = categoryId;
        this.content = content;
        this.files = files;
        this.privacy = privacy;
    }

   

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
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

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFiles() {
        return files;
    }

    public void setFiles(String files) {
        this.files = files;
    }

    public String getPrivacy() {
        return privacy;
    }

    public void setPrivacy(String privacy) {
        this.privacy = privacy;
    }

    @Override
    public String toString() {
        return "Post{" + "id=" + id + ", userId=" + userId + ", name=" + name + ", title=" + title + ", subTitle=" + subTitle + ", date=" + date + ", time=" + time + ", categoryId=" + categoryId + ", content=" + content + ", files=" + files + '}';
    }
    
    
   
}
