package fmf.webwork.fmf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class layuiAdminController {
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
}
