package My_Little_Teamy.My_Little_Cinemy.repos;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;

public interface DBWorkRepo extends CrudRepository<DBWork, Integer> {
    @Query(value = "SELECT username FROM user", nativeQuery = true)
    Collection<String> findAllActiveUsers();
}
