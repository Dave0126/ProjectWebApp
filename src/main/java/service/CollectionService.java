package service;

import dao.CollectionDao;
import domain.Collection;

import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName: CollectionService
 * @Description: 用户对电影的收藏相关业务逻辑
 * @author: Guohao
 **/
public class CollectionService {
    private CollectionDao dao = new CollectionDao();

    /**
     * 添加用户对电影的收藏记录
     *
     * @param userName  用户名
     * @param movieName 电影名
     * @return void
     * @author Guohao
     */
    public void addUserCollectionMovie(String userName, String movieName) throws SQLException {
        dao.addUserCollectionMovie(userName, movieName);
    }

    /**
     * 删除用户对电影的收藏记录
     *
     * @param userName  用户名
     * @param movieName 电影名
     * @return void
     * @author Guohao
     */
    public void cancalUserCollection(String userName, String movieName) throws SQLException {
        dao.cancelUserCollectionMovie(userName, movieName);
    }


    /**
     * 查找对应用户的所有收藏记录
     *
     * @param userName 用户名
     * @return java.util.List<domain.Collection>
     * @author Guohao
     */
    public List<Collection> findAllRecordByUserName(String userName) throws SQLException {
        return dao.findAllRecordByUserName(userName);
    }
}
