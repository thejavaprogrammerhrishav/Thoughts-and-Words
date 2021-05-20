
package com.hdsoft.techblog.dao;

import com.hdsoft.techblog.models.User;
import java.sql.SQLException;
import java.util.List;

public interface UserDao extends GenericDao<User, Long> {

    public abstract List<User> findByDate(String date) throws SQLException;

    public abstract List<User> findByGender(String gender) throws SQLException;
    
    public abstract User login(String username,String password) throws SQLException;
    
    public abstract User findByUsernameEmail(String username, String email);

}
