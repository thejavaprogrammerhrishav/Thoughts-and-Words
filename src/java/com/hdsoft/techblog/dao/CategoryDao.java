
package com.hdsoft.techblog.dao;

import com.hdsoft.techblog.models.Category;
import java.sql.SQLException;
import java.util.List;


public interface CategoryDao extends GenericDao<Category, Long> {

    public abstract List<Category> findByDate(String date) throws SQLException;

    public abstract List<Category> findByUserId(long id) throws SQLException;

    public abstract boolean existsCategory(String category) throws SQLException;
}
