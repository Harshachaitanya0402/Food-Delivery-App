package com.foodapp.dao;

import com.foodapp.model.*;
import jakarta.persistence.*;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO {

    @PersistenceContext
    private EntityManager em;

    public List<Restaurant> findAllActive(){
        return em.createQuery("select r from Restaurant r where r.active=true order by r.restaurantId",Restaurant.class).getResultList();
    }
}