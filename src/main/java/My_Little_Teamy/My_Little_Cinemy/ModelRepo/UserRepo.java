package My_Little_Teamy.My_Little_Cinemy.ModelRepo;

import My_Little_Teamy.My_Little_Cinemy.Model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.ArrayList;

public interface UserRepo extends CrudRepository<User, Long> {
    User findUserByEMail(String email);
    @Query(value = "SELECT u.name FROM users u WHERE u.id = :id", nativeQuery = true)
    String findUserNameById(@Param("id") Long id);
}
