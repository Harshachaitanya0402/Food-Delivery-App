package com.foodapp.service;

import com.foodapp.dao.*;
import com.foodapp.model.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.Timestamp;
import java.util.*;

@Service
public class FoodService {

    private final UserDAO users;
    private final RestaurantDAO restaurants;
    private final MenuDAO menus;
    private final OrdersDAO orders;
    private final OrderItemDAO orderItems;

    public FoodService(UserDAO users,RestaurantDAO restaurants,MenuDAO menus,OrdersDAO orders,OrderItemDAO orderItems){
        this.users=users;
        this.restaurants=restaurants;
        this.menus=menus;
        this.orders=orders;
        this.orderItems=orderItems;
    }

    public List<Restaurant> restaurants(){
        return restaurants.findAllActive();
    }

    public List<Menu> menu(int restaurantId){
        return menus.findByRestaurantId(restaurantId);
    }

    public Menu menuItem(int id){
        return menus.findById(id);
    }

    @Transactional
    public String register(User u){
        if(u.getUsername()==null||u.getUsername().isBlank()||u.getEmail()==null||u.getEmail().isBlank()||u.getPassword()==null||u.getPassword().length()<6)
            return "Enter a username, email, and password of at least 6 characters.";
        if(users.findByEmail(u.getEmail())!=null)
            return "An account with this email already exists.";
        u.setPassword(BCrypt.hashpw(u.getPassword(),BCrypt.gensalt()));
        u.setRole("customer");
        users.save(u);
        return null;
    }

    @Transactional
    public User login(String email,String password)
    {
        User u=users.findByEmail(email);
        if(u==null||password==null||u.getPassword()==null)
            return null;
        try{
            if(!BCrypt.checkpw(password,u.getPassword()))
                return null;
        }catch(IllegalArgumentException ex){
            return null;
        }
        users.updateLastLogin(u.getUserId());
        u.setLastLoginDate(new Timestamp(System.currentTimeMillis()));
        u.setPassword(null);
        return u;
    }

    @Transactional
    public void checkout(User user,int restaurantId,String paymentMode,String address,Cart cart)
    {
        if(user==null||cart==null||cart.getItems().isEmpty())
            throw new IllegalArgumentException("Please sign in and add items before checkout.");
        Orders order=new Orders();
        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurantId);
        order.setTotalAmount(cart.getTotal());
        order.setStatus("pending");
        order.setPaymentMode(paymentMode);
        order.setDeliveryAddress(address);
        orders.save(order);
        for(CartItem ci:cart.getItems().values())
        {
            OrderItem oi=new OrderItem();
            oi.setOrderId(order.getOrderId());
            oi.setMenuId(ci.getId());
            oi.setQuantity(ci.getQuantity());
            oi.setPrice(ci.getTotalPrice());
            orderItems.save(oi);
        }
    }

}