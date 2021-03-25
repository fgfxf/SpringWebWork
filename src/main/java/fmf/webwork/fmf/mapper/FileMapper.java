package fmf.webwork.fmf.mapper;

import fmf.webwork.fmf.Entity.FileEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileMapper {
     Integer fileInsert(String file_name,String file_sql_path,String file_size,String file_ext,String file_time,String file_owner);
     List<FileEntity> findAll(Integer start,Integer end);
     Integer countFiles();
     void deleteFileById(Integer id);
     FileEntity findById(Integer id);
}
