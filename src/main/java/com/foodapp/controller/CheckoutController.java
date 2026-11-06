package com.foodapp.controller;

import com.foodapp.model.Cart;
import com.foodapp.model.User;
import com.foodapp.service.FoodService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CheckoutController {
    private final FoodService service;

    public CheckoutController(FoodService service) {
        this.service = service;
    }

    @PostMapping("/checkout")
    public String checkout(@RequestParam(value = "paymentMethod", defaultValue = "Cash on Delivery") String paymentMethod,
                           @RequestParam(value = "address", required = false) String address,
                           HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");
        if (user == null) return "redirect:/login";
        if (cart == null || cart.getItems().isEmpty()) {
            model.addAttribute("error", "Your cart is empty.");
            return "cart";
        }
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");
        if (restaurantId == null) {
            model.addAttribute("error", "Please choose a restaurant and add items again.");
            return "cart";
        }
        try {
            service.checkout(user, restaurantId, paymentMethod, address, cart);
            session.removeAttribute("cart");
            session.removeAttribute("restaurantId");
            return "redirect:/order-success";
        } catch (RuntimeException ex) {
            model.addAttribute("error", "Unable to place your order. Check the server console and database configuration.");
            return "checkout";
        }
    }

    @GetMapping("/order-success")
    public String success() {
        return "order-success";
    }
}
