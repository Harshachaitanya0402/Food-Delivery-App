package com.foodapp.dao;

import com.foodapp.model.*;
import jakarta.persistence.*;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class MenuDAOImpl implements MenuDAO {

    @PersistenceContext
    private EntityManager em;

    public List<Menu> findByRestaurantId(int id){
        return em.createQuery("select m from Menu m where m.restaurantId=:id and m.available=true order by m.menuId",Menu.class).setParameter("id",id).getResultList();
    }

    public Menu findById(int id){
        return em.find(Menu.class,id);
    }

}