package fmf.webwork.fmf.service;

import fmf.webwork.fmf.Entity.Users;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.SQLNonTransientException;

public interface UserService {
    Users insertUser(String email, String name, String passwd, String wechat, String imtype, String introduce) ;
    Users findByUserEmail(String email);
    void updatePwdByUser_email(String pwd,String email);
  //  Users findByUser
}
