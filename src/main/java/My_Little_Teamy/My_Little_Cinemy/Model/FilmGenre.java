package My_Little_Teamy.My_Little_Cinemy.Model;

import My_Little_Teamy.My_Little_Cinemy.compositeKeys.FilmGenreId;
import lombok.Data;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "films_genres")
public class FilmGenre {
    @EmbeddedId
    private FilmGenreId filmGenre;
}
