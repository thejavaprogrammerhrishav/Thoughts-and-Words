
package com.hdsoft.techblog.models;


public class PostFile {
    private String name;
    private byte[] data;

    public PostFile() {
    }

    public PostFile(String name, byte[] data) {
        this.name = name;
        this.data = data;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }
    
    
}
