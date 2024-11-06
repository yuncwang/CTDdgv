package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

// 首页控制器
@Controller
public class index {
    @RequestMapping("/")
    public ModelAndView doView() {
        return new ModelAndView("/index");
    }

}
