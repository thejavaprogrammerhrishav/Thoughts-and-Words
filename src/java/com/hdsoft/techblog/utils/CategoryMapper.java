
package com.hdsoft.techblog.utils;

import com.hdsoft.techblog.models.Category;
import java.sql.ResultSet;
import java.sql.SQLException;


public class CategoryMapper {

    public static Category map(ResultSet rs) throws SQLException {
        Category category = new Category(rs.getLong("id"), rs.getString("category"), rs.getString("description"), rs.getString("date"));
        category.setUserId(rs.getLong("userId"));
        return category;
    }
}
