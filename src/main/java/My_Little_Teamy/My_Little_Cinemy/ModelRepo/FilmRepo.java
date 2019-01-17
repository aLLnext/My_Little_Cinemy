package My_Little_Teamy.My_Little_Cinemy.ModelRepo;

import My_Little_Teamy.My_Little_Cinemy.Model.Film;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface FilmRepo extends CrudRepository<Film, Long> {
    //@Query(value = "SELECT * FROM films f inner join sessions s on f.id = s.film_id where s.cinema_id = :id;", nativeQuery = true)
    //Iterable<Film> findFilmsByCinemaId(@Param("id") Long id);
    @Query(value = "SELECT * FROM sessions s JOIN films f on f.id = s.film_id WHERE s.Cinema_id = :Id GROUP BY f.title ORDER BY f.date_release", nativeQuery = true)
    Iterable<Film> findFilmsByCinemaId(@Param("Id") Long id);
}
