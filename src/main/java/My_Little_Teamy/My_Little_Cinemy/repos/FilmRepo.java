package My_Little_Teamy.My_Little_Cinemy.repos;

import My_Little_Teamy.My_Little_Cinemy.domains.Film;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface FilmRepo extends CrudRepository<Film, Long> {
    Film findFilmById(long id);

    //TODO напиши функцию без запроса
    @Query(value = "SELECT * FROM films", nativeQuery = true)
    List<Film> getFilms();
}
