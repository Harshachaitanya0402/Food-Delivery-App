package com.foodapp.dao;

import com.foodapp.model.Menu;
import java.util.*;

public interface MenuDAO {

    List<Menu> findByRestaurantId(int restaurantId);

    Menu findById(int id);

}