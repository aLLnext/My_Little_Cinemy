package My_Little_Teamy.My_Little_Cinemy.domain;

import My_Little_Teamy.My_Little_Cinemy.compositeKeys.FilmParticipantId;
import lombok.Data;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "films_people")
public class FilmParticipant {
    @EmbeddedId
    private FilmParticipantId filmParticipantId;
}
