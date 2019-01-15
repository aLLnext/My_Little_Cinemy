package My_Little_Teamy.My_Little_Cinemy.ModelRepo;

import My_Little_Teamy.My_Little_Cinemy.Model.Country;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface CountryRepo extends CrudRepository<Country, Long> {
    @Query(value = "select name from countries inner join films_countries on " +
            "countries.id = country_id where film_id = :filmId", nativeQuery = true)
    Iterable<String> findCountriesByFilmId(@Param("filmId") Long filmId);
}
