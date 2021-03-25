package fmf.webwork.fmf.controller;

import fmf.webwork.fmf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class layuiAdminController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin/layuiAdmin", method = RequestMethod.GET)
    public String layuiAdmin(Model model, HttpServletRequest request, HttpServletResponse response) {
        System.out.println("在layuiAdmin");
        return "admin/layuiAdmin";
    }

    @RequestMapping(value = "/admin/layuiUploadList",method = RequestMethod.GET)
    public String layuiUploadList(Model model, HttpServletRequest request, HttpServletResponse response){
        System.out.println("layuiUploadList");
        return "admin/layuiUploadList";
    }

    @RequestMapping(value = "/admin/User",method = RequestMethod.GET)
    public String layuiUser(Model model, HttpServletRequest request, HttpServletResponse response){
        System.out.println("layuiUser");
        model.addAttribute("email",request.getSession().getAttribute("email"));
        model.addAttribute("username",request.getSession().getAttribute("username"));
        model.addAttribute("introduce",request.getSession().getAttribute("introduce"));
        return "admin/layuiUser";
    }
    @RequestMapping(value = "/admin/User",method = RequestMethod.POST)
    public String layuiUserSet(Model model, HttpServletRequest request, HttpServletResponse response){
        System.out.println("layuiUser");
        String username=request.getParameter("username");
        String introduce=request.getParameter("introduce");
        String email=request.getSession().getAttribute("email").toString();
        userService.updateNameandIntroduceByUser_email(username,introduce,email);
        request.getSession().setAttribute("username",username);
        request.getSession().setAttribute("introduce",introduce);

        model.addAttribute("email",request.getSession().getAttribute("email"));
        model.addAttribute("username",request.getSession().getAttribute("username"));
        model.addAttribute("introduce",request.getSession().getAttribute("introduce"));
        return "admin/layuiUser";
    }
}
