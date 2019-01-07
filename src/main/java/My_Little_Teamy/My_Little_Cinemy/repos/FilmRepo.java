package My_Little_Teamy.My_Little_Cinemy.repos;

import My_Little_Teamy.My_Little_Cinemy.domains.Film;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface FilmRepo extends CrudRepository<Film, Long> {
    @Query(value = "SELECT title FROM films", nativeQuery = true)
    Iterable<String> getFilmsTitles();

    @Query(value = "SELECT main_photo FROM films", nativeQuery = true)
    Iterable<String> getFilmsImages();

}
