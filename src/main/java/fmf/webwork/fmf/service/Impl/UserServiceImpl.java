package fmf.webwork.fmf.service.Impl;

import fmf.webwork.fmf.Entity.Users;
import fmf.webwork.fmf.repository.UserRepository;
import fmf.webwork.fmf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.SQLNonTransientException;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Override
    public Users insertUser(String email, String name, String passwd, String wechat, String imtype, String introduce)  {
            Users  user=new Users();
            user.setUser_email(email);
            user.setUser_name(name);
            user.setUser_pwd(passwd);
            user.setUser_wechat(wechat);
            user.setUser_imtype(imtype);
            user.setUser_introduce(introduce);
            Users saveUser=userRepository.save(user);
            return saveUser;
    }

    @Override
    public Users findByUserEmail(String email){
        Users findByUserEmail=userRepository.findUsersByUser_email(email);
        return  findByUserEmail;
    }
    @Override
    public void updatePwdByUser_email(String pwd,String email){
        userRepository.updatePwdByUser_email(pwd,email);
    }
}
