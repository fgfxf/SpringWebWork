package fmf.webwork.fmf.interceptor;

import fmf.webwork.fmf.common.RC4Util;
import fmf.webwork.fmf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 登录拦截器
public class loginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("在登录拦截器");
        System.out.println("request : "+ request.getContextPath()+ request.getRequestURI());
        if(request.getSession().getAttribute("username")==null){
            request.getSession().setAttribute("username","guest");
        }else if(request.getSession().getAttribute("username").toString().isEmpty()){
            request.getSession().setAttribute("username","guest");
        }
        if(request.getRequestURI().equals("index")|| request.getRequestURI().equals("/auth/register") ||request.getRequestURI().equals("/auth/reset") ||request.getRequestURI().equals("/")){
            return true;
        }

        Cookie[] cookies = request.getCookies();
        Object email=request.getSession().getAttribute("email");
        Object username=request.getSession().getAttribute("username");
        boolean islogin=isLogin(cookies,email,username);
        System.out.println("islogin:"+islogin);
        if(request.getRequestURI().equals("/auth/login")){
            if(islogin){
                response.sendRedirect("/admin/layuiAdmin");
                return false;
            }else{
                return true;
            }
        }
        if(!islogin){
            response.sendRedirect("/auth/login");
            return false;
        }

       // log.debug("没有cookie-----cookie时间可能到期，重定向到登录页面后请重新登录。。。");
//        request.getRequestDispatcher("login").forward(request,response);
        //返回false，不执行原来controller的方法
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
    private boolean isLogin(Cookie[] cookies,Object email,Object username){
        if(username.toString().equals("guest")){
            return false;
        }
        boolean find=false;
        if(cookies!=null && cookies.length>0){
            for(Cookie cookie:cookies) {
                if(cookie.getName().equals("usernameCookies")){

                    if(RC4Util.decrypt(cookie.getValue(),"fgfxf").equals(email.toString())){
                        find=true;
                        return  true;
                    }
                }
            }
            return find;
        }else{
            return false;//一定存在cookie
        }
    }

}
