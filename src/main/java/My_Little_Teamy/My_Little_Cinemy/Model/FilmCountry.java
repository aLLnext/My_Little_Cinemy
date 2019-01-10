package My_Little_Teamy.My_Little_Cinemy.Model;

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
