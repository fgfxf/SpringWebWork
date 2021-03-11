package fmf.webwork.fmf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class IndexPageController  {

    @RequestMapping("/")
    public String IndexController(Model model, HttpServletRequest request, HttpServletResponse response){
        System.out.println("在IndexController");
        return "index";
    }

    @RequestMapping("/index")
    public String IndexController2(Model model, HttpServletRequest request, HttpServletResponse response){
        System.out.println("在IndexController");
        return "index";
    }

}