
package com.hdsoft.techblog.utils;

import com.hdsoft.techblog.dao.CommentDao;
import com.hdsoft.techblog.dao.CategoryDao;
import com.hdsoft.techblog.dao.LikeDao;
import com.hdsoft.techblog.dao.PostDao;
import com.hdsoft.techblog.dao.UserDao;
import com.hdsoft.techblog.dao.impl.CategoryDaoImpl;
import com.hdsoft.techblog.dao.impl.CommentDaoImpl;
import com.hdsoft.techblog.dao.impl.LikeDaoImpl;
import com.hdsoft.techblog.dao.impl.PostDaoImpl;
import com.hdsoft.techblog.dao.impl.UserDaoImpl;


public class Dao {

    public static UserDao getUserDao() {
        return new UserDaoImpl();
    }

    public static CategoryDao getCategoryDao() {
        return new CategoryDaoImpl();
    }

    public static PostDao getPostDao() {
        return new PostDaoImpl();
    }

    public static LikeDao getLikeDao() {
        return new LikeDaoImpl();
    }
    
    public static CommentDao getCommentDao(){
        return new CommentDaoImpl();
    }
}
