package My_Little_Teamy.My_Little_Cinemy.repos;

import My_Little_Teamy.My_Little_Cinemy.domains.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepo extends CrudRepository<User, Long> {
    User findUserByEMail(String email);
    User findUserByEMailOrName(String email, String name);
}
