package com.foodapp.dao;
import com.foodapp.model.Restaurant;
import java.util.*;
public interface RestaurantDAO 
	{
		List<Restaurant> findAllActive(); 
	}
