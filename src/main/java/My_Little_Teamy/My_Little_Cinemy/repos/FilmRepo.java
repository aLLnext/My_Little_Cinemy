package My_Little_Teamy.My_Little_Cinemy.repos;

import My_Little_Teamy.My_Little_Cinemy.domain.Film;
import org.springframework.data.repository.CrudRepository;

public interface FilmRepo extends CrudRepository<Film, Long> {
}