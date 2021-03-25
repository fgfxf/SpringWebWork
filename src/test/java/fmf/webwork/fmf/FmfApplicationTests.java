package fmf.webwork.fmf;

import fmf.webwork.fmf.Entity.FileEntity;
import fmf.webwork.fmf.mapper.FileMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.Reader;
import java.util.List;

@SpringBootTest
class FmfApplicationTests {
    public static SqlSession initMybatis(String conf) throws Exception{
        Reader reader = Resources.getResourceAsReader(conf);
        SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        return  sessionFactory.openSession();
    }
    @Test
    void contextLoads() throws Exception {
        SqlSession session = initMybatis("config/mybatis.xml");
        FileMapper fileMapper = session.getMapper(FileMapper.class);
        System.out.println(fileMapper.findById(999)==null);

    }


}
