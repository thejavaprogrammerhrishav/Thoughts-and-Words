
package com.hdsoft.techblog.dao.impl;

import com.hdsoft.techblog.dao.UserDao;
import com.hdsoft.techblog.models.User;
import com.hdsoft.techblog.utils.DBConnection;
import com.hdsoft.techblog.utils.UserMapper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class UserDaoImpl implements UserDao {

    private static final String INSERT = "insert into user(name,contact,email,about,gender,username,password,date) values(?,?,?,?,?,?,?,?)";
    private static final String UPDATE = "update user set name=?,contact=?, email=?, about=?, gender=?, username=?, password=?, date=?, facebook=?, instagram=?, twitter=? where id=?";
    private static final String DELETE = "delete from user where id=?";
    private static final String SEARCH_DATE = "select * from user where date=?";
    private static final String SEARCH_GENDER = "select * from user where gender=?";
    private static final String SEARCH_ID = "select * from user where id=?";
    private static final String SEARCH_USERNAME_EMAIL = "select * from user where username=? and email=?";
    private static final String COUNT = "select count(*) from user";
    private static final String SHOW_ALL = "select * from user";
    private static final String LOGIN = "select * from user where username=? and password=?";

    private Connection conn;

    public UserDaoImpl() {
        conn = DBConnection.getConnection();
    }

    @Override
    public List<User> findByDate(String date) throws SQLException {
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SEARCH_DATE);
            pst.setString(1, date);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(UserMapper.map(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return list;
    }

    @Override
    public List<User> findByGender(String gender) throws SQLException {
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SEARCH_GENDER);
            pst.setString(1, gender);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(UserMapper.map(rs));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return list;
    }

    @Override
    public Long save(User t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(INSERT);
            pst.setString(1, t.getName());
            pst.setString(2, t.getContact());
            pst.setString(3, t.getEmail());
            pst.setString(4, t.getAbout());
            pst.setString(5, t.getGender());
            pst.setString(6, t.getUsername());
            pst.setString(7, t.getPassword());
            pst.setString(8, t.getDate());

            long executeUpdate = pst.executeUpdate();

            return executeUpdate;
        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }

    @Override
    public boolean update(User t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(UPDATE);
            pst.setString(1, t.getName());
            pst.setString(2, t.getContact());
            pst.setString(3, t.getEmail());
            pst.setString(4, t.getAbout());
            pst.setString(5, t.getGender());
            pst.setString(6, t.getUsername());
            pst.setString(7, t.getPassword());
            pst.setString(8, t.getDate());
            pst.setString(9, t.getFacebook());
            pst.setString(10, t.getInstagram());
            pst.setString(11, t.getTwitter());
            pst.setLong(12, t.getId());

            int executeUpdate = pst.executeUpdate();

            return executeUpdate != -1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }

    @Override
    public boolean delete(User t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(DELETE);
            pst.setLong(1, t.getId());

            int executeUpdate = pst.executeUpdate();

            return executeUpdate != -1;
        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class
                    .getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }

    @Override
    public List<User> findAll() throws SQLException {
        List<User> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SHOW_ALL);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(UserMapper.map(rs));

            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class
                    .getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return list;
    }

    @Override
    public User findById(Long id) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(SEARCH_ID);
            pst.setLong(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return UserMapper.map(rs);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return null;
    }

    @Override
    public int countAll() throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(COUNT);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return -1;
    }

    @Override
    public User login(String username, String password) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(LOGIN);
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return UserMapper.map(rs);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return null;
    }

    @Override
    public User findByUsernameEmail(String username, String email) {
        try {
            PreparedStatement pst = conn.prepareStatement(SEARCH_USERNAME_EMAIL);
            pst.setString(1, username);
            pst.setString(2, email);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return UserMapper.map(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
