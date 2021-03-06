package fmf.webwork.fmf.repository;

import fmf.webwork.fmf.Entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<Users, Integer> , JpaSpecificationExecutor<Users>{
    @Query("select t from Users t where t.user_email = ?1")
    Users findUsersByUser_email(String email);

    @Modifying
    @Query("update Users m set m.user_pwd=?1 where m.user_email=?2")
    int updatePwdByUser_email(String pwd,String email);

    @Modifying
    @Query("update Users m set m.user_name=?1,m.user_introduce=?2 where m.user_email=?3")
    int updateNameandIntroduceByUser_email(String name,String introduce,String email);

}