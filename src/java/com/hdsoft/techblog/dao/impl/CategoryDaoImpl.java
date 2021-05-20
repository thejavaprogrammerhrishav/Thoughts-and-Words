
package com.hdsoft.techblog.dao.impl;

import com.hdsoft.techblog.dao.CategoryDao;
import com.hdsoft.techblog.models.Category;
import com.hdsoft.techblog.utils.CategoryMapper;
import com.hdsoft.techblog.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CategoryDaoImpl implements CategoryDao {

    private static final String INSERT = "insert into category(category,description,date,userId) values(?,?,?,?)";
    private static final String UPDATE = "update category set category=?,description=?, date=?, userId=? where id=?";
    private static final String DELETE = "delete from category where id=?";
    private static final String SEARCH_DATE = "select * from category where date=?";
    private static final String SEARCH_USER_ID = "select * from category where userId=?";
    private static final String SEARCH_CATEGORY = "select * from category where category=?";
    private static final String SEARCH_ID = "select * from category where id=?";
    private static final String COUNT = "select count(*) from category";
    private static final String SHOW_ALL = "select * from category";

    private Connection conn;

    public CategoryDaoImpl() {
        conn = DBConnection.getConnection();
    }

    @Override
    public List<Category> findByDate(String date) throws SQLException {
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SEARCH_DATE);
            pst.setString(1, date);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(CategoryMapper.map(rs));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }
        return list;
    }

    @Override
    public List<Category> findByUserId(long id) throws SQLException {
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SEARCH_USER_ID);
            pst.setLong(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(CategoryMapper.map(rs));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }
        return list;
    }

    @Override
    public boolean existsCategory(String category) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(SEARCH_CATEGORY);
            pst.setString(1, category);
            ResultSet rs = pst.executeQuery();

            return rs.next();
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }
    }

    @Override
    public Long save(Category t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(INSERT);
            pst.setString(1, t.getCategory());
            pst.setString(2, t.getDescription());
            pst.setString(3, t.getDate());
            pst.setLong(4, t.getUserId());

            return (long) pst.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }
    }

    @Override
    public boolean update(Category t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(UPDATE);
            pst.setString(1, t.getCategory());
            pst.setString(2, t.getDescription());
            pst.setString(3, t.getDate());
            pst.setLong(4, t.getUserId());
            pst.setLong(5, t.getId());

            int x = pst.executeUpdate();

            return x != -1;
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }
    }

    @Override
    public boolean delete(Category t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(DELETE);
            pst.setLong(1, t.getId());

            int x = pst.executeUpdate();

            return x != -1;
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }
    }

    @Override
    public List<Category> findAll() throws SQLException {
        try {
            List<Category> list = new ArrayList<>();

            PreparedStatement pst = conn.prepareStatement(SHOW_ALL);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(CategoryMapper.map(rs));
            }

            return list;
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }
    }

    @Override
    public Category findById(Long id) throws SQLException {
        try {

            PreparedStatement pst = conn.prepareStatement(SEARCH_ID);
            pst.setLong(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return CategoryMapper.map(rs);
            } else {
                return null;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }
    }

    @Override
    public int countAll() throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(COUNT);
            ResultSet rs = pst.executeQuery();
            return rs.getInt(1);
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }
    }

}
