
package com.hdsoft.techblog.utils;

import com.hdsoft.techblog.models.Post;
import com.hdsoft.techblog.models.User;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;


public class HomeUtils {

    public static List<Post> users(List<Post> posts, String auth) {
        try {
            List<User> users = Dao.getUserDao().findAll();

            List<Long> collect = users.parallelStream().filter(f -> f.getName().toLowerCase().contains(auth.toLowerCase())).map(User::getId).collect(Collectors.toList());

            return posts.parallelStream().filter(f -> collect.contains(f.getUserId())).collect(Collectors.toList());
        } catch (SQLException ex) {
            Logger.getLogger(HomeUtils.class.getName()).log(Level.SEVERE, null, ex);
        }

        return posts;
    }
}
