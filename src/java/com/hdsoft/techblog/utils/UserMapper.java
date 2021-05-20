
package com.hdsoft.techblog.utils;

import com.hdsoft.techblog.models.User;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserMapper {

    public static User map(ResultSet rs) throws SQLException {
        User user = new User(rs.getLong("id"), rs.getString("name"), rs.getString("contact"), rs.getString("email"), rs.getString("about"), rs.getString("gender"),
                rs.getString("username"), rs.getString("password"), rs.getString("date"),rs.getString("facebook"),rs.getString("instagram"),rs.getString("twitter"));
        return user;
    }
}
