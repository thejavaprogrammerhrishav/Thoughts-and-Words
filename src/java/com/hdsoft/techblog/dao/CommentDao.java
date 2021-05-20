
package com.hdsoft.techblog.dao;

import com.hdsoft.techblog.dao.GenericDao;
import com.hdsoft.techblog.models.Comment;
import java.util.List;


public interface CommentDao extends GenericDao<Comment, Long> {

    public abstract List<Comment> findByUserid(long userid);

    public abstract List<Comment> findByDate(String date);
    
    public abstract List<Comment> findByPostId(long postid);

}
