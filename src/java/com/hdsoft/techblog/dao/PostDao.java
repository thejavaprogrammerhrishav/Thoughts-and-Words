
package com.hdsoft.techblog.dao;

import com.hdsoft.techblog.models.Post;
import java.sql.SQLException;
import java.util.List;


public interface PostDao extends GenericDao<Post, Long> {

    public abstract List<Post> findByDate(String date)throws SQLException;

    public abstract List<Post> findByUserId(long id)throws SQLException;

    public abstract List<Post> findByCategory(long id)throws SQLException;

    public abstract List<Post> findByTitle(String title)throws SQLException;

    public abstract List<Post> findBySubTitle(String subTitle)throws SQLException;

    public abstract int countByDate(String date)throws SQLException;

    public abstract int countByUserId(long id)throws SQLException;

    public abstract int countByCategory(long id)throws SQLException;

    public abstract int countByTitle(String title)throws SQLException;

    public abstract int countBySubTitle(String subTitle)throws SQLException;

}
