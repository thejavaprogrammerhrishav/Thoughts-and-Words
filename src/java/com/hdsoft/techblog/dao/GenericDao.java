
package com.hdsoft.techblog.dao;

import java.sql.SQLException;
import java.util.List;


public interface GenericDao<T, ID> {

    public abstract ID save(T t) throws SQLException;

    public abstract boolean update(T t) throws SQLException;

    public abstract boolean delete(T t) throws SQLException;

    public abstract List<T> findAll() throws SQLException;

    public abstract T findById(ID id) throws SQLException;

    public abstract int countAll() throws SQLException;

}
