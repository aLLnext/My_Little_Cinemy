package My_Little_Teamy.My_Little_Cinemy.ModelRepo;

import My_Little_Teamy.My_Little_Cinemy.Model.Film;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface FilmRepo extends CrudRepository<Film, Long> {
}
