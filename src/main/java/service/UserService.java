package service;

import dao.UserDao;
import domain.User;
import exception.LoginException;
import exception.RegisterException;
import exception.UpdateUserException;
import utils.BlackBox;

import java.sql.SQLException;

/**
 * @ClassName: UserService.java
 * @Description: 与用户相关的业务逻辑层
 * @author: Guohao
 */
public class UserService {

    private UserDao dao = new UserDao();

    /**
     * @param params 验证所需参数
     * @return
     * @throws LoginException 参数
     * @Description: 登录操作
     */
    public User login(String username, String password) throws LoginException {
        try {
            // 根据登录时表单输入的用户名和密码，查找用户
			User user = dao.findUserByUsernameAndPassword(username, password);

            // 如果找到，还需要确定用户是否为激活用户
            if (user != null) {
                // 只有是激活才能登录成功，否则提示“用户未激活”
                if (user.getState() == 1) {
                    return user;
                }
                throw new LoginException("User is not activity!");
            }

            throw new LoginException("Username or Password is wrong!");
        } catch (Exception e) {
            e.printStackTrace();
            throw new LoginException("Login failed, please try again...");
        }
    }

    public void register(User user) throws RegisterException {
        try {
            // 调用 dao完成注册操作
            dao.addUser(user);

            // TODO:后期补充，发送邮件过去激活
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            throw new RegisterException("Register failed! Username is exited!");
        }
    }

    public void updateUser(User user) throws UpdateUserException {
        try {
            dao.updateUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new UpdateUserException("Failed to modify the information!");
        }
    }

    public User findUserByUserName(String userName) throws SQLException {
        return dao.findUserByUserName(userName);
    }
}
