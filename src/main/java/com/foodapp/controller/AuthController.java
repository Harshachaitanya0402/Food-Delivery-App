package com.foodapp.controller;

import com.foodapp.model.User;
import com.foodapp.service.FoodService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
    private final FoodService service;

    public AuthController(FoodService service) {
        this.service = service;
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        HttpSession session, Model model)
    {
        User user = service.login(email, password);
        if (user == null) 
        {
            model.addAttribute("error", "Invalid email or password.");
            return "login";
        }
        session.setAttribute("user", user);
        return "redirect:/restaurants";
    }

    @PostMapping("/register")
    public String register(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("email") String email,
                           @RequestParam(value = "phone", required = false) String phone,
                           @RequestParam(value = "address", required = false) String address,
                           Model model) {
        User user = new User(username, password, email, phone, address, "customer");
        String error = service.register(user);
        if (error != null) 
        {
            model.addAttribute("error", error);
            return "register";
        }
        model.addAttribute("message", "Registration successful. Please log in.");
        return "login";
    }

    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
