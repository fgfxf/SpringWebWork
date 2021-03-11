package fmf.webwork.fmf.controller;

import fmf.webwork.fmf.Entity.Users;
import fmf.webwork.fmf.common.RC4Util;
import fmf.webwork.fmf.common.StatusCode;
import fmf.webwork.fmf.common.encryptionUtil;
import fmf.webwork.fmf.common.loginResult;
import fmf.webwork.fmf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.SQLException;
import java.util.regex.Pattern;

@Controller
public class LoginRegisterController {


    @RequestMapping(value = "/auth/login", method = RequestMethod.GET)
    public String login(Model model, HttpServletRequest request, HttpServletResponse response) {
        System.out.println("在login");
        return "login";
    }

    @RequestMapping(value = "/auth/register", method = RequestMethod.GET)
    public String register(Model model, HttpServletRequest request, HttpServletResponse response) {
        System.out.println("在register");
        return "register";
    }

    @RequestMapping(value = "/auth/reset",method = RequestMethod.GET)
    public String reset(Model model, HttpServletRequest request, HttpServletResponse response){
        System.out.println("在reset");
        return "reset";
    }
    @RequestMapping(value = "/auth/logout",method = RequestMethod.GET)
    public  String logout(Model model, HttpServletRequest request, HttpServletResponse response){
        request.getSession().invalidate();
        Cookie cookie = new Cookie("usernameCookies","guest");
        cookie.setPath("/");
        response.addCookie(cookie);
        return "login";
    }

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/auth/reset", method = RequestMethod.POST)
    @ResponseBody
    public String getReset(Model model, HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");//邮箱
        String passwd = request.getParameter("passwd");//密码
        String wechat = request.getParameter("wechat");//联系方式
        String imtype = request.getParameter("imtype");//答案

        if (email.isEmpty() || email.trim().equals("")  || passwd.isEmpty() || passwd.trim().equals("")  || wechat.isEmpty() || wechat.trim().equals("") || imtype.isEmpty() || imtype.trim().equals("")) {
            return new loginResult(StatusCode.error, "请完善信息").toString();
        }

        String pattern = "^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$";
        boolean isMatch = Pattern.matches(pattern, email);//判断是否邮箱
        if (!isMatch) {
            return new loginResult(StatusCode.error, "请输入正确邮箱").toString();
        }
        if ( passwd.trim().length() > 20 || passwd.trim().length() < 6) {
            return new loginResult(StatusCode.error, "请输入6-18位密码！").toString();
        }
        passwd = encryptionUtil.getSHA256StrJava(passwd);
        try {
            Users loginuser = userService.findByUserEmail(email);
            if(loginuser==null){
                return new loginResult(StatusCode.error, "email或者预留联系方式出错").toString();
            }
            if(!loginuser.getUser_wechat().equals(wechat)){
                return new loginResult(StatusCode.error, "email或者预留联系方式出错").toString();
            }
            if(!loginuser.getUser_imtype().equals(imtype)){
                return new loginResult(StatusCode.error, "email或者预留联系方式出错").toString();
            }
            userService.updatePwdByUser_email(passwd,email);
            return new loginResult(StatusCode.success, "更改已经提交").toString();


        } catch (Exception e) {
            Integer errorcode = ((SQLException) e.getCause().getCause()).getErrorCode();
            System.out.println(e.getCause());
            System.out.println(e.getCause().getCause());
            System.out.println("SQL error Code= " + errorcode);

            return new loginResult(StatusCode.error, "被大风吹离了布吉岛 "+errorcode).toString();
        }


    }

    @RequestMapping(value = "/auth/login", method = RequestMethod.POST)
    @ResponseBody
    public String getLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try{
            if(email.isEmpty()||password.isEmpty() ||email.trim().equals("") ||password.trim().equals("")){
                return new loginResult(StatusCode.error, "走后门是不好的！").toString();
            }
        }catch(Exception e){
            return new loginResult(StatusCode.error, "走后门是不好的！").toString();
        }

        System.out.println(email+"  "+password);
        try {
            Users loginuser = userService.findByUserEmail(email);
            System.out.println(loginuser.getUser_pwd()+"  "+loginuser.getUser_email());
            if(loginuser.getUser_pwd().trim().equals(encryptionUtil.getSHA256StrJava(password).trim())){

                Cookie cookie = new Cookie("usernameCookies", RC4Util.encrypt(loginuser.getUser_email(),"fgfxf"));
                cookie.setPath("/");
                response.addCookie(cookie);

                request.getSession().setAttribute("email",loginuser.getUser_email());
                request.getSession().setAttribute("username",loginuser.getUser_name());
                request.getSession().setAttribute("introduce",loginuser.getUser_introduce());
                return new loginResult(StatusCode.success, "成功上岸").toString();
            }

        } catch (Exception e) {
            Integer errorcode = ((SQLException) e.getCause().getCause()).getErrorCode();
            System.out.println(e.getCause());
            System.out.println(e.getCause().getCause());
            System.out.println("SQL error Code= " + errorcode);

            return new loginResult(StatusCode.error, "被大风吹离了布吉岛 "+errorcode).toString();
        }

        return new loginResult(StatusCode.error, "被大风吹离了布吉岛").toString();
    }

    @RequestMapping(value = "/auth/register", method = RequestMethod.POST)
    @ResponseBody
    public String getRegister(Model model, HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");//邮箱
        String name = request.getParameter("name");//用户名
        String passwd = request.getParameter("passwd");//密码
        String repasswd = request.getParameter("repasswd");//重复密码
        String wechat = request.getParameter("wechat");//联系方式
        String imtype = request.getParameter("imtype");//答案
        String introduce = request.getParameter("introduce");//介绍

        if (email.isEmpty() || email.trim().equals("") || name.isEmpty() || name.trim().equals("") || passwd.isEmpty() || passwd.trim().equals("") || repasswd.isEmpty() || repasswd.trim().equals("") || wechat.isEmpty() || wechat.trim().equals("") || imtype.isEmpty() || imtype.trim().equals("")) {
            return new loginResult(StatusCode.error, "请完善信息").toString();
        }
        if (!passwd.trim().equals(repasswd.trim())) {
            return new loginResult(StatusCode.error, "请正确两次输入密码").toString();
        }
        String pattern = "^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$";
        boolean isMatch = Pattern.matches(pattern, email);//判断是否邮箱
        if (!isMatch) {
            return new loginResult(StatusCode.error, "请输入正确邮箱").toString();
        }
        if (name.trim().length() > 20 || passwd.trim().length() > 20 || passwd.trim().length() < 6) {
            return new loginResult(StatusCode.error, "请输入6-18位密码！").toString();
        }

        if (introduce.isEmpty() || introduce.trim().equals("")) {
            introduce = " 这家伙很懒，没有留下任何签名！";
        }
        passwd = encryptionUtil.getSHA256StrJava(passwd);
        //sql注册：
        try {
            userService.insertUser(email, name, passwd, wechat, imtype, introduce);
        } catch (Exception e) {
            Integer errorcode = ((SQLException) e.getCause().getCause()).getErrorCode();
            System.out.println(e.getCause());
            System.out.println(e.getCause().getCause());
            System.out.println("SQL error Code= " + errorcode);
            // e.printStackTrace();
            String errorString = "错误代码 " + errorcode + "：";
            switch (errorcode) {
                case 1062:
                    errorString += "邮箱已经被注册！";
                    break;
                default:
                    errorString += "未知错误！";
                    break;
            }
            return new loginResult(StatusCode.error, errorString).toString();
        }
//        System.out.println(email);
//        System.out.println(name);
//        System.out.println(passwd);
//        System.out.println(repasswd);
//        System.out.println(wechat);
//        System.out.println(imtype);
//        System.out.println(introduce);

        return new loginResult(StatusCode.success, "注册成功").toString();
    }
}
