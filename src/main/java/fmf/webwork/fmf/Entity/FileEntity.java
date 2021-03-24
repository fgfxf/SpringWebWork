package fmf.webwork.fmf.Entity;

public class FileEntity {
    private Integer id;
    private String file_name;
    private String file_sql_path;
    private String file_size;
    private String file_ext;
    private String file_time;
    private String file_owner;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    public String getFile_sql_path() {
        return file_sql_path;
    }

    public void setFile_sql_path(String file_sql_path) {
        this.file_sql_path = file_sql_path;
    }

    public String getFile_size() {
        return file_size;
    }

    public void setFile_size(String file_size) {
        this.file_size = file_size;
    }

    public String getFile_ext() {
        return file_ext;
    }

    public void setFile_ext(String file_ext) {
        this.file_ext = file_ext;
    }

    public String getFile_time() {
        return file_time;
    }

    public void setFile_time(String file_time) {
        this.file_time = file_time;
    }

    public String getFile_owner() {
        return file_owner;
    }

    public void setFile_owner(String file_owner) {
        this.file_owner = file_owner;
    }

    @Override
    public String toString() {
        file_sql_path=file_sql_path.replace("\\","\\\\");
        return "{\"id\":\""+id +"\""+
                ",\"file_name\":\"" + file_name + "\"" +
                ",\"file_sql_path\":\"" + file_sql_path + "\"" +
                ",\"file_size\":\"" + file_size + "\"" +
                ",\"file_ext\":\"" + file_ext + "\"" +
                ",\"file_time\":\"" + file_time + "\"" +
                ",\"file_owner\":\"" + file_owner + "\"" +
                '}';
    }
}
