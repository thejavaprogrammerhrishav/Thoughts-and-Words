
package com.hdsoft.techblog.dao.impl;

import com.hdsoft.techblog.dao.LikeDao;
import com.hdsoft.techblog.models.Like;
import com.hdsoft.techblog.utils.DBConnection;
import com.hdsoft.techblog.utils.DateUtils;
import com.hdsoft.techblog.utils.LikeMapper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class LikeDaoImpl implements LikeDao {
    
    private static final String INSERT = "INSERT INTO likes(userid,postid,date) values(?,?,?)";
    private static final String UPDATE = "UPDATE likes SET userid=?, postid=? date=? where id=?";
    private static final String DELETE = "DELETE FROM likes WHERE id=?";
    private static final String FIND_ALL = "SELECT * FROM likes";
    private static final String FIND_BY_ID = "SELECT * FROM likes WHERE id=?";
    private static final String FIND_BY_DATE = "SELECT * FROM likes WHERE date=?";
    private static final String FIND_BY_USER_ID = "SELECT * FROM likes WHERE userid=?";
    private static final String FIND_BY_POST_ID = "SELECT * FROM likes WHERE postid=?";
    private static final String DISLIKE = "DELETE FROM likes WHERE userid=? AND postid=?";
    private static final String COUNT = "SELECT COUNT(*) FROM likes";
    private static final String COUNT_LIKES = "SELECT COUNT(*) FROM likes WHERE userid=? AND postid=?";
    private static final String COUNT_POST_LIKES = "SELECT COUNT(*) FROM likes WHERE postid=?";
    
    private Connection conn;
    
    public LikeDaoImpl() {
        conn = DBConnection.getConnection();
    }
    
    @Override
    public List<Like> findByUser(long userid) {
        List<Like> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(FIND_BY_USER_ID);
            pst.setLong(1, userid);
            
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(LikeMapper.map(rs));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    @Override
    public List<Like> findByPost(long postid) {
        List<Like> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(FIND_BY_POST_ID);
            pst.setLong(1, postid);
            
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(LikeMapper.map(rs));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    @Override
    public List<Like> findByDate(String date) {
        List<Like> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(FIND_BY_DATE);
            pst.setString(1, date);
            
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(LikeMapper.map(rs));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    @Override
    public boolean like(long userid, long postid) {
        try {
            Like l = new Like();
            l.setUserid(userid);
            l.setPostid(postid);
            l.setDate(DateUtils.getDate());
            
            Long save = save(l);
            return save > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(LikeDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    @Override
    public boolean dislike(long userid, long postid) {
        try {
            PreparedStatement pst = conn.prepareStatement(DISLIKE);
            pst.setLong(1, userid);
            pst.setLong(2, postid);
            
            int x = pst.executeUpdate();
            return x > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    @Override
    public boolean isliked(long userid, long postid) {
        
        int countLikes = countLikes(userid, postid);
        return countLikes > 0;
    }
    
    @Override
    public int countLikes(long userid, long postid) {
        try {
            PreparedStatement pst = conn.prepareStatement(COUNT_LIKES);
            pst.setLong(1, userid);
            pst.setLong(2, postid);
            
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1;
    }
    
    @Override
    public Long save(Like t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(INSERT);
            pst.setLong(1, t.getUserid());
            pst.setLong(2, t.getPostid());
            pst.setString(3, t.getDate());
            
            int x = pst.executeUpdate();
            return (long) x;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return (long) -1;
    }
    
    @Override
    public boolean update(Like t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(UPDATE);
            pst.setLong(1, t.getUserid());
            pst.setLong(2, t.getPostid());
            pst.setString(3, t.getDate());
            pst.setLong(4, t.getId());
            
            int x = pst.executeUpdate();
            return x > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    @Override
    public boolean delete(Like t) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(DELETE);
            pst.setLong(1, t.getUserid());
            
            int x = pst.executeUpdate();
            return x > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    @Override
    public List<Like> findAll() throws SQLException {
        List<Like> list = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement(FIND_ALL);
            
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(LikeMapper.map(rs));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    @Override
    public Like findById(Long id) throws SQLException {
        try {
            PreparedStatement pst = conn.prepareStatement(FIND_BY_ID);
            pst.setLong(1, id);
            
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return LikeMapper.map(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
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
            ex.printStackTrace();
        }
        return -1;
    }
    
    @Override
    public int countLikes(long postid) {
        try {
            PreparedStatement pst = conn.prepareStatement(COUNT_POST_LIKES);
            pst.setLong(1, postid);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1;
    }
}
