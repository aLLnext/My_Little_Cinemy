package My_Little_Teamy.My_Little_Cinemy.ModelRepo;

import My_Little_Teamy.My_Little_Cinemy.Model.Participant;
import javafx.util.Pair;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface ParticipantRepo extends CrudRepository<Participant, Long> {
    @Query(value = "select `name` from people inner join films_people on " +
            "people.id = participant_id where (film_id = :filmId and post = :post)",
            nativeQuery = true)
    Iterable<String> findPartisipantsByfilmIdAndPost(@Param("filmId") Long filmId,
                                                                   @Param("post") String post);
}
