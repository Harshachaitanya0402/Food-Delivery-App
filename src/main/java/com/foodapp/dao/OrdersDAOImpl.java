package com.foodapp.dao;

import com.foodapp.model.*;
import jakarta.persistence.*;
import org.springframework.stereotype.Repository;
//import java.util.*;

@Repository
public class OrdersDAOImpl implements OrdersDAO {

    @PersistenceContext
    private EntityManager em;

    public void save(Orders o){
        em.persist(o);
        em.flush();
    }
}