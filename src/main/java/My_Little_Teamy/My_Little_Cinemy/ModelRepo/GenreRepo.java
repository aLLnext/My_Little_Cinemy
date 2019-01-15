package My_Little_Teamy.My_Little_Cinemy.ModelRepo;

import My_Little_Teamy.My_Little_Cinemy.Model.Genre;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface GenreRepo extends CrudRepository<Genre, Long> {
    @Query(nativeQuery = true, value = "select name from genres inner join films_genres on " +
            "genres.id = genre_id where film_id = :filmId")
    Iterable<String> findGenresByFilm(@Param("filmId") Long filmId);
}
