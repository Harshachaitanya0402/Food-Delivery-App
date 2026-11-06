package com.foodapp.dao;

import com.foodapp.model.*;
import jakarta.persistence.*;
import org.springframework.stereotype.Repository;
//import java.util.*;

@Repository
public class OrderItemDAOImpl implements OrderItemDAO {

    @PersistenceContext
    private EntityManager em;

    public void save(OrderItem i){
        em.persist(i);
    }
}