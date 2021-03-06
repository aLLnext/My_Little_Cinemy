package My_Little_Teamy.My_Little_Cinemy.compositeKeys;

import My_Little_Teamy.My_Little_Cinemy.Model.Film;
import My_Little_Teamy.My_Little_Cinemy.Model.Genre;
import lombok.Data;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Data
@Embeddable
public class FilmGenreId implements Serializable {
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "film_id")
    private Film film;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "genre_id")
    private Genre genre;
}
