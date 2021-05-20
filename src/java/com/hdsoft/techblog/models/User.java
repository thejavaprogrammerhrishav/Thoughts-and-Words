
package com.hdsoft.techblog.models;


public class User {
    private long id;
    private String name;
    private String contact;
    private String email;
    private String about;
    private String gender;
    private String username;
    private String password;
    private String date;
    private String facebook;
    private String instagram;
    private String twitter;

    public User() {
    }

    public User(String name, String contact, String email, String about, String gender, String username, String password, String date, String facebook, String instagram, String twitter) {
        this.name = name;
        this.contact = contact;
        this.email = email;
        this.about = about;
        this.gender = gender;
        this.username = username;
        this.password = password;
        this.date = date;
        this.facebook = facebook;
        this.instagram = instagram;
        this.twitter = twitter;
    }

    public User(long id, String name, String contact, String email, String about, String gender, String username, String password, String date, String facebook, String instagram, String twitter) {
        this.id = id;
        this.name = name;
        this.contact = contact;
        this.email = email;
        this.about = about;
        this.gender = gender;
        this.username = username;
        this.password = password;
        this.date = date;
        this.facebook = facebook;
        this.instagram = instagram;
        this.twitter = twitter;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getInstagram() {
        return instagram;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public String getTwitter() {
        return twitter;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", contact=" + contact + ", email=" + email + ", about=" + about + ", gender=" + gender + ", username=" + username + ", password=" + password + ", date=" + date + ", facebook=" + facebook + ", instagram=" + instagram + ", twitter=" + twitter + '}';
    }
    
}