
package com.hdsoft.techblog.utils;

import com.hdsoft.techblog.models.Like;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LikeMapper {

    public static Like map(ResultSet rs) throws SQLException {
        return new Like(rs.getLong("id"), rs.getLong("userid"), rs.getLong("postid"), rs.getString("date"));
    }
}
