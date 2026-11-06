package com.foodapp.dao;
import com.foodapp.model.User;
//import java.util.*;
public interface UserDAO
	{
		User findByEmail(String email); 
		User findById(int id); 
		void save(User entity);
		void update(User entity); 
		void updateLastLogin(int id); 
	}
