package com.foodapp.dao;

import com.foodapp.model.*;
import jakarta.persistence.*;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class UserDAOImpl implements UserDAO {

    @PersistenceContext
    private EntityManager em;

    public User findByEmail(String email){
        List<User> l=em.createQuery("select u from User u where u.email=:email",User.class).setParameter("email",email).setMaxResults(1).getResultList();
        return l.isEmpty()?null:l.get(0);
    }

    public User findById(int id){
        return em.find(User.class,id);
    }

    public void save(User u){
        em.persist(u);
    }

    public void update(User u){
        em.merge(u);
    }

    public void updateLastLogin(int id){
        User u=em.find(User.class,id);
        if(u!=null)u.setLastLoginDate(new java.sql.Timestamp(System.currentTimeMillis()));
    }
}