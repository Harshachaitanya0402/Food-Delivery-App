package com.foodapp.model;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name="user")

public class User {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="user_id")
    private Integer userId;

    @Column(name="username")
    private String username;

    @Column(name="password")
    private String password;

    @Column(name="email")
    private String email;

    @Column(name="phone")
    private String phone;

    @Column(name="address")
    private String address;

    @Column(name="role")
    private String role;

    @Column(name="created_date", insertable=false, updatable=false)
    private Timestamp createdDate;

    @Column(name="last_login_date")
    private Timestamp lastLoginDate;

    public User(){}

    public User(String username,String password,String email,String phone,String address,String role){
        this.username=username;
        this.password=password;
        this.email=email;
        this.phone=phone;
        this.address=address;
        this.role=role;
    }

    public Integer getUserId(){
        return userId;
    }

    public void setUserId(Integer v){
        userId=v;
    }

    public String getUsername(){
        return username;
    }

    public void setUsername(String v){
        username=v;
    }

    public String getPassword(){
        return password;
    }

    public void setPassword(String v){
        password=v;
    }

    public String getEmail(){
        return email;
    }

    public void setEmail(String v){
        email=v;
    }

    public String getPhone(){
        return phone;
    }

    public void setPhone(String v){
        phone=v;
    }

    public String getAddress(){
        return address;
    }

    public void setAddress(String v){
        address=v;
    }

    public String getRole(){
        return role;
    }

    public void setRole(String v){
        role=v;
    }

    public Timestamp getCreatedDate(){
        return createdDate;
    }

    public void setCreatedDate(Timestamp v){
        createdDate=v;
    }

    public Timestamp getLastLoginDate(){
        return lastLoginDate;
    }

    public void setLastLoginDate(Timestamp v){
        lastLoginDate=v;
    }

}