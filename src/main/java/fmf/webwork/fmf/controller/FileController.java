package fmf.webwork.fmf.controller;

import fmf.webwork.fmf.common.FileUtil;
import fmf.webwork.fmf.common.uploadResult;
import fmf.webwork.fmf.mapper.FileMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class FileController {
    public static SqlSession initMybatis(String conf) throws Exception{
        Reader reader = Resources.getResourceAsReader(conf);
        SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        return  sessionFactory.openSession();
    }
    Map<String,Object> map;
    @Autowired
    private FileUtil fileu;
    private String filePath = "c:\\hsd_path";

    @ResponseBody
    @RequestMapping(value = "/admin/upload", method = RequestMethod.GET)
    public String getUpload(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //return "admin/layuiImgUpload";
        return new uploadResult( " "," "," ").toString();
    }

    @ResponseBody
    @RequestMapping(value = "/admin/upload",method = RequestMethod.POST)
    public String upload(@RequestParam("file") MultipartFile file,HttpServletRequest request, HttpServletResponse response) throws Exception {
        map=fileu.upload(filePath,"img",file);
        SqlSession session = initMybatis("config/mybatis.xml");

        FileMapper fileMapper = session.getMapper(FileMapper.class);
        Integer sqlret = fileMapper.fileInsert(map.get("fileName").toString(),map.get("fileSqlPath").toString(),map.get("fileSize").toString(),map.get("ext").toString(),map.get("uploadTime").toString(),request.getSession().getAttribute("email").toString());
        uploadResult uploadRet=new uploadResult(map.get("fileName").toString(),map.get("uploadTime").toString(),map.get("fileSqlPath").toString());
        System.out.println("上传结果>>>"+sqlret);
        if(sqlret<1)
            uploadRet.setFiles(" ");
        session.commit();
        session.close();
        response.setContentType("application/json");
        return uploadRet.toString();
    }

    @ResponseBody
    @RequestMapping(value = "/admin/getFileList",method = RequestMethod.GET)
    public String getFileList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SqlSession session = initMybatis("config/mybatis.xml");
        FileMapper fileMapper = session.getMapper(FileMapper.class);
        Object object;
        if(request.getSession().getAttribute("email").equals("1216700206@qq.com"))
            object = fileMapper.findAll();
        else
            object = fileMapper.findAllByUser(request.getSession().getAttribute("email").toString());
        ((List)object).size();
        session.commit();
        session.close();
        response.setContentType("application/json");
        return object.toString();
    }


    @ResponseBody
    @RequestMapping("/download")
    public void download(@RequestParam("filename") HttpServletResponse response) throws IOException{
        fileu.downLoad("down.png",filePath,map.get("fileSqlPath").toString(),response);
    }


}
