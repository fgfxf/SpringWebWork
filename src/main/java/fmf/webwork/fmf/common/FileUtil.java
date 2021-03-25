package fmf.webwork.fmf.common;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @Description File工具类 <br/>
 * @Date
 * @author  李鹏飞
 */
@Component
public class FileUtil {

    /**
     * @Description <br/>
     * 具体存储路径： fileUploadPath+"/"+folder+"/"+yyyyMM\dd\HHmmss+"/"+UUID.文件名
     * @param fileUploadPath 指定文件存储路径 例 D:\\upload
     * @param folder         指定file存储的文件夹 视频video 图片 img ...
     * @param file           上传的文件
     * @return fileName:    文件名
     *         fileSize:    文件大小（字节）
     *         fileSqlPath: 文件存储路径（数据库）
     *         uploadTime:  上传时间
     *         transferTo:  上传到文件夹路径
     *         ext:         文件后缀
     *         SQL 执行成功后 file.transferTo(new File((String) map.get("transferTo")));
     * @throws IOException
     */
    public Map<String,Object> upload(String fileUploadPath, String folder, MultipartFile file) throws IOException {


        // 1、getOriginalFilename():获取上传文件的文件名
        String fileName = file.getOriginalFilename();
        // 2、<input type="file" name="bigHeadImage"></p>
        // getName()：获取的是file控件中name的属性值，此处的属性值为bigHeadImage
        // 3、将上传的文件保存到指定的目录下
        String uuid = UUID.randomUUID().toString();
        // String path = request.getServletContext().getRealPath("/images");
        // File filePath = new File(path + "\\" + uuid + originalFilename);
        //  创建时间文件夹
        Date date = new Date();
        //上传时间
        String uploadTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        //-------------
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM"+File.separator+"dd"+File.separator+"HHmmss");
        String basePath = sdf.format(date);
        String path = fileUploadPath+File.separator+folder+File.separator+basePath;
        //数据库存储路径
        String fileSqlPath = folder+File.separator+basePath+File.separator+ uuid + fileName.substring(fileName.lastIndexOf("."));
        //全路径
        String fileUrl = fileUploadPath + File.separator +fileSqlPath;
        //存储到本地文件夹
        File filePath = new File(fileUrl);
        // 判断文件夹是否存在
        File createPath = new File(path);
        if (!createPath.exists()) {
            createPath.mkdirs();
        }
        //文件后缀
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
        Map<String,Object> map = new HashMap<>();
        map.put("fileName",fileName);
        map.put("fileSize",file.getSize());
        map.put("fileSqlPath",fileSqlPath);
        map.put("uploadTime",uploadTime);
        map.put("transferTo",fileUrl);
        map.put("ext",ext);
        file.transferTo(filePath);
        return map;
    }


    /**
     * @Description 文件下载<br/>
     * @param fileName          文件名
     * @param fileUploadPath    文件存储路径 D:\\uploads
     * @param fileSqlPath       文件数据库存储路径 video\...\UUID.jpg
     * @param response
     * @throws IOException
     */
    public void downLoad(String fileName, String fileUploadPath , String fileSqlPath , HttpServletResponse response)
            throws IOException{

        String URL = fileUploadPath+ File.separator+fileSqlPath;

        // 下载文件：需要设置响应头
        response.addHeader("content-Type", "application/octet-stream");// 二进制 都可以下载
        response.addHeader("content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "utf-8"));// filename包含文件后缀

        InputStream in = new FileInputStream(URL);
        // 获取文件流
        // 输出流 刚才读到的文件输出
        ServletOutputStream out = response.getOutputStream();
        byte[] bs = new byte[1024];
        int len = -1;
        while ((len = in.read(bs)) != -1) {// 读完为-1 !=-1 没有读完
            out.write(bs, 0, len);
        }
        out.close();
        in.close();
    }

    public void viewImg(String fileName, String fileUploadPath , String fileSqlPath , HttpServletResponse response,String file_ext)
            throws IOException{

        String URL = fileUploadPath+ File.separator+fileSqlPath;

        // 下载文件：需要设置响应头
        response.addHeader("content-Type", "image/"+file_ext);// 二进制 都可以下载
        response.addHeader("content-Disposition", "inline;filename=" + URLEncoder.encode(fileName, "utf-8"));// filename包含文件后缀

        InputStream in = new FileInputStream(URL);
        // 获取文件流
        // 输出流 刚才读到的文件输出
        ServletOutputStream out = response.getOutputStream();
        byte[] bs = new byte[1024];
        int len = -1;
        while ((len = in.read(bs)) != -1) {// 读完为-1 !=-1 没有读完
            out.write(bs, 0, len);
        }
        out.close();
        in.close();
    }
}
