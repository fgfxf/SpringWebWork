package fmf.webwork.fmf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class layuiImgController {

    @RequestMapping(value = "/admin/layuiImgUpload", method = RequestMethod.GET)
    public String login(Model model, HttpServletRequest request, HttpServletResponse response) {
        System.out.println("在layuiImgUpload");
        return "admin/layuiImgUpload";
    }
}
