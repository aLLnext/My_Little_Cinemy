package My_Little_Teamy.My_Little_Cinemy.ModelRepo;

import My_Little_Teamy.My_Little_Cinemy.Model.Film;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface FilmRepo extends CrudRepository<Film, Long> {
    @Query(value = "SELECT * FROM films inner join " +
            "sessions on films.id = film_id where cinema_id = :cinemaId", nativeQuery = true)
    Iterable<Film> findFilmByCinemaId(@Param("cinemaId") Long id);
}
