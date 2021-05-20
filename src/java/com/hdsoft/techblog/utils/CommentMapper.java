
package com.hdsoft.techblog.utils;

import com.hdsoft.techblog.models.Comment;
import java.sql.ResultSet;
import java.sql.SQLException;


public class CommentMapper {

    public static Comment map(ResultSet rs) throws SQLException {
        return new Comment(rs.getLong("id"), rs.getLong("userid"), rs.getLong("postid"), rs.getString("comment"),
                rs.getString("reply"), rs.getString("date"), rs.getString("time"));
    }

}
