
package com.hdsoft.techblog.utils;


public class Message {
    private final String message;
    private final String cssClass;

    public Message(String message, String cssClass) {
        this.message = message;
        this.cssClass = cssClass;
    }

    public String getMessage() {
        return message;
    }

    public String getCssClass() {
        return cssClass;
    }
}
