package My_Little_Teamy.My_Little_Cinemy.compositeKeys;

import My_Little_Teamy.My_Little_Cinemy.Model.Film;
import My_Little_Teamy.My_Little_Cinemy.Model.Participant;
import lombok.Data;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Data
@Embeddable
public class FilmParticipantId implements Serializable {
    @ManyToOne
    @JoinColumn(name = "film_id")
    private Film film;

    @ManyToOne
    @JoinColumn(name = "participant_id")
    private Participant participant;

    private String post;
}
