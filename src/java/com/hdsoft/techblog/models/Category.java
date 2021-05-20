
package com.hdsoft.techblog.models;

public class Category {

    private long id;
    private String category;
    private String description;
    private String date;
    private long userId;

    public Category() {
    }

    public Category(String category, String description, String date) {
        this.category = category;
        this.description = description;
        this.date = date;
    }

    public Category(long id, String category, String description, String date) {
        this.id = id;
        this.category = category;
        this.description = description;
        this.date = date;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getUserId() {
        return userId;
    }

    @Override
    public String toString() {
        return "Category{" + "id=" + id + ", category=" + category + ", description=" + description + ", date=" + date + '}';
    }

}
