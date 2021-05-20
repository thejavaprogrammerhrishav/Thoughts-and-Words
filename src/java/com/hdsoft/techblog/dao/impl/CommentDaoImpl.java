
package com.hdsoft.techblog.dao.impl;

import com.hdsoft.techblog.dao.CommentDao;
import com.hdsoft.techblog.models.Comment;
import com.hdsoft.techblog.utils.CommentMapper;
import com.hdsoft.techblog.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CommentDaoImpl implements CommentDao {

    private static final String INSERT = "INSERT INTO comments(userid,postid,comment,reply,date,time) VALUES(?,?,?,?,?,?)";
    private static final String UPDATE = "UPDATE comments SET userid=?, postid=?, comment=?, reply=?, date=?, time=? WHERE id=?";
    private static final String DELETE = "DELETE FROM comments WHERE id=?";
    private static final String SELECT_ALL = "SELECT * FROM comments";
    private static final String FIND_BY_ID = "SELECT * FROM comments WHERE id=?";
    private static final String FIND_BY_USER_ID = "SELECT * FROM comments WHERE userid=?";
    private static final String FIND_BY_POST_ID = "SELECT * FROM comments WHERE postid=?";
    private static final String FIND_BY_DATE = "SELECT * FROM comments WHERE date=?";
    private static final String COUNT_ALL = "SELECT COUNT(*) FROM comments";

    private Connection conn;

    public CommentDaoImpl() {
        conn = DBConnection.getConnection();
    }

    @Override
    public List<Comment> findByUserid(long userid) {
        List<Comment> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(FIND_BY_USER_ID);
            pst.setLong(1, userid);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(CommentMapper.map(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Comment> findByDate(String date) {
        List<Comment> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(FIND_BY_DATE);
            pst.setString(1, date);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(CommentMapper.map(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Long save(Comment t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(INSERT);
            pst.setLong(1, t.getUserid());
            pst.setLong(2, t.getPostid());
            pst.setString(3, t.getComment());
            pst.setString(4, t.getReply());
            pst.setString(5, t.getDate());
            pst.setString(6, t.getTime());
            int rs = pst.executeUpdate();
            System.out.println(rs);
            return (long) rs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1l;
    }

    @Override
    public boolean update(Comment t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(UPDATE);
            pst.setLong(1, t.getUserid());
            pst.setLong(2, t.getPostid());
            pst.setString(3, t.getComment());
            pst.setString(4, t.getReply());
            pst.setString(5, t.getDate());
            pst.setString(6, t.getTime());
            pst.setLong(7, t.getId());
            int rs = pst.executeUpdate();
            return rs > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(Comment t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(DELETE);
            pst.setLong(1, t.getId());
            int rs = pst.executeUpdate();
            return rs > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Comment> findAll() throws SQLException {
        List<Comment> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(SELECT_ALL);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(CommentMapper.map(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Comment findById(Long id) throws SQLException {
        try{
            PreparedStatement pst=conn.prepareStatement(FIND_BY_ID);
            pst.setLong(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                return CommentMapper.map(rs);
            }
        }catch(SQLException e){
            e.printStackTrace();
            throw e;
        }
        return null;
    }

    @Override
    public int countAll() throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(COUNT_ALL);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public List<Comment> findByPostId(long postid) {
        List<Comment> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(FIND_BY_POST_ID);
            pst.setLong(1, postid);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(CommentMapper.map(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
