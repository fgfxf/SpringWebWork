package fmf.webwork.fmf.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;


import javax.persistence.*;

@Entity
@Table(name = "user")
@Data
@AllArgsConstructor
@ToString

public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer uid;
    @Column(name = "user_email")
    private String user_email;
    @Column(name = "user_name")
    private String user_name;
    @Column(name = "user_pwd")
    private String user_pwd;
    @Column(name = "user_wechat")
    private String user_wechat;
    @Column(name = "user_imtype")
    private String user_imtype;
    @Column(name = "user_introduce")
    private String user_introduce;

    public Users() {

    }
}
