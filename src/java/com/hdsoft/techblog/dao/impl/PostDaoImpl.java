
package com.hdsoft.techblog.dao.impl;

import com.hdsoft.techblog.dao.PostDao;
import com.hdsoft.techblog.models.Post;
import com.hdsoft.techblog.utils.DBConnection;
import com.hdsoft.techblog.utils.PostMapper;
import java.io.ByteArrayInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class PostDaoImpl implements PostDao {

    private static final String INSERT = "insert into post(userid,name,title,subtitle,date,time,categoryid,content,files,privacy) values(?,?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE = "update post set userid=?, name=?, title=?, subtitle=?, date=?, time=?, categoryid=?, content=?, files=?, privacy=? where id=?";
    private static final String DELETE = "delete from post where id=?";
    private static final String SHOW_ALL = "select * from post";
    private static final String SHOW_BY_TITLE = "select * from post where title like ?";
    private static final String SHOW_BY_DATE = "select * from post where date=?";
    private static final String SHOW_BY_SUB_TITLE = "select * from post where subtitle like ?";
    private static final String SHOW_BY_USER = "select * from post where userid=?";
    private static final String SHOW_BY_CATEGORY = "select * from post where categoryid=?";
    private static final String SHOW_BY_ID = "select * from post where id=?";
    private static final String COUNT = "select count(*) from post";
    private static final String COUNT_BY_TITLE = "select count(*) from post where title like ?";
    private static final String COUNT_BY_DATE = "select count(*) from post where date=?";
    private static final String COUNT_BY_SUB_TITLE = "select count(*) from post where subtitle like ?";
    private static final String COUNT_BY_USER = "select count(*) from post where userid=?";
    private static final String COUNT_BY_CATEGORY = "select count(*) from post where categoryid=?";

    private Connection conn;

    public PostDaoImpl() {
        conn = DBConnection.getConnection();
    }

    @Override
    public List<Post> findByDate(String date) throws SQLException {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SHOW_BY_DATE);
            pst.setString(1, date);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(PostMapper.getPost(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public List<Post> findByUserId(long id) throws SQLException {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SHOW_BY_USER);
            pst.setLong(1, id);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(PostMapper.getPost(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public List<Post> findByCategory(long id) throws SQLException {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SHOW_BY_CATEGORY);
            pst.setLong(1, id);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(PostMapper.getPost(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public List<Post> findByTitle(String title) throws SQLException {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SHOW_BY_TITLE);
            pst.setString(1, "%" + title + "%");

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(PostMapper.getPost(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public List<Post> findBySubTitle(String subTitle) throws SQLException {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SHOW_BY_SUB_TITLE);
            pst.setString(1, "%" + subTitle + "%");

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(PostMapper.getPost(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public int countByDate(String date) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(COUNT_BY_DATE);
            pst.setString(1, date);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public int countByUserId(long id) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(COUNT_BY_USER);
            pst.setLong(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public int countByCategory(long id) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(COUNT_BY_CATEGORY);
            pst.setLong(1, id);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public int countByTitle(String title) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(COUNT_BY_TITLE);
            pst.setString(1, "%" + title + "%");
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public int countBySubTitle(String subTitle) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(COUNT_BY_SUB_TITLE);
            pst.setString(1, "%" + subTitle + "%");
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public Long save(Post t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(INSERT);
            pst.setLong(1, t.getUserId());
            pst.setString(2, t.getName());
            pst.setString(3, t.getTitle());
            pst.setString(4, t.getSubTitle());
            pst.setString(5, t.getDate());
            pst.setString(6, t.getTime());
            pst.setLong(7, t.getCategoryId());
            pst.setString(8, t.getContent());
            pst.setString(9, t.getFiles());
            pst.setString(10, t.getPrivacy());

            return (long) pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public boolean update(Post t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(UPDATE);
            pst.setLong(1, t.getUserId());
            pst.setString(2, t.getName());
            pst.setString(3, t.getTitle());
            pst.setString(4, t.getSubTitle());
            pst.setString(5, t.getDate());
            pst.setString(6, t.getTime());
            pst.setLong(7, t.getCategoryId());
            pst.setString(8, t.getContent());
            pst.setString(9, t.getFiles());
            
            pst.setLong(10, t.getId());

            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public boolean delete(Post t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(DELETE);
            pst.setLong(1, t.getId());

            int x = pst.executeUpdate();

            return x > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public List<Post> findAll() throws SQLException {
        List<Post> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SHOW_ALL);

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(PostMapper.getPost(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public Post findById(Long id) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(SHOW_BY_ID);
            pst.setLong(1, id);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return PostMapper.getPost(rs);
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public int countAll() throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(COUNT);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

}
