package domain;

import java.util.Date;

/**
 * @ClassName: User.java
 * @Description: 用户实体类
 * @author: Guohao
 * @version: V1.0
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String gender;
    private String email;
    private String telephone;
    private String introduce; // 自我介绍 self introduction
    private String activeCode; // 注册时激活码
    private int state; // 用户状态 1表示激活 0表示未激活
    private String role; // 用户角色：普通用户，管理员
    private Date registTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getActiveCode() {
        return activeCode;
    }

    public void setActiveCode(String activeCode) {
        this.activeCode = activeCode;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Date getRegistTime() {
        return registTime;
    }

    public void setRegistTime(Date registTime) {
        this.registTime = registTime;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", username=" + username + ", password=" + password + ", gender=" + gender
                + ", email=" + email + ", telephone=" + telephone + ", introduce=" + introduce + ", activeCode="
                + activeCode + ", state=" + (state==1?"已激活":"未激活") + ", role=" + role + ", registTime=" + registTime + "]";
    }

}

