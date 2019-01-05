package My_Little_Teamy.My_Little_Cinemy.domains;

import My_Little_Teamy.My_Little_Cinemy.compositeKeys.FilmCountryId;
import lombok.Data;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "films_countries")
public class FilmCountry {
    @EmbeddedId
    private FilmCountryId filmCountryId;
}
