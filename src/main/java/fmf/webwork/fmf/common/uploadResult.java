package fmf.webwork.fmf.common;

public class uploadResult {
    private String args;
    private String data;
    private String files;

    public uploadResult(String args, String data,String files) {
        this.args = args;
        this.data = data;
        this.files = "\"file\":\""+encryptionUtil.getSHA256StrJava(files)+"\"";
    }

    public String getFiles() {
        return files;
    }

    public void setFiles(String files) {
        this.files = files;
    }

    @Override
    public String toString() {
        return "{\"args\":{\""+
                "filename\":\""+args+
                "\"},\"data\":\""+
                data+
                "\",\"files\":{"+
                files+
                "},\"form\":{},\"headers\":{},\"json\":null}";
    }
}
