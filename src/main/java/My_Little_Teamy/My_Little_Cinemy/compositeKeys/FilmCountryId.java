package My_Little_Teamy.My_Little_Cinemy.compositeKeys;

import My_Little_Teamy.My_Little_Cinemy.Model.Country;
import My_Little_Teamy.My_Little_Cinemy.Model.Film;
import lombok.Data;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Data
@Embeddable
public class FilmCountryId implements Serializable {
    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country;

    @ManyToOne
    @JoinColumn(name = "film_id")
    private Film film;
}
