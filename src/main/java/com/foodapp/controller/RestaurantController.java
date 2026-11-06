package com.foodapp.controller;

import com.foodapp.service.FoodService;
import com.foodapp.model.Cart;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RestaurantController {
    private final FoodService service;

    public RestaurantController(FoodService service) {
        this.service = service;
    }

    @GetMapping("/restaurants")
    public String restaurants(Model model) {
        model.addAttribute("restaurants", service.restaurants());
        return "restaurants";
    }

    @GetMapping("/menu")
    public String menu(@RequestParam("restaurantId") int restaurantId,
                       HttpSession session, Model model) {
        // Keep the cart's restaurant when the user browses another menu; the cart controller
        // switches/clears it explicitly if an item from a different restaurant is added.
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            session.setAttribute("restaurantId", restaurantId);
        }
        model.addAttribute("menus", service.menu(restaurantId));
        return "menu";
    }
}
