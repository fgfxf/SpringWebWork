package fmf.webwork.fmf.common;

public class loginResult {
    private Integer ret;
    private String msg;
    private String data;
    public loginResult(Integer ret,String msg){
        this.ret=ret;
        this.msg=msg;
    }
    @Override
    public String toString(){
        return "{\"ret\":"+
                ret+
                ",\"msg\":"+
                "\""+
                msg+
                "\""+
                "}";
    }
}
