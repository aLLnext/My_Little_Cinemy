package My_Little_Teamy.My_Little_Cinemy.ModelRepo;

import My_Little_Teamy.My_Little_Cinemy.Model.Session;
import My_Little_Teamy.My_Little_Cinemy.Model.Ticket;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.ArrayList;


public interface SessionRepo extends CrudRepository<Session, Long> {
    Iterable<Session> findByFilmIdOrderBySessionDateAsc(Long id);

    //id, session_date, session_time, halls.name, cinemas.name
    //Iterable<Session> findSessionByFilmIdOrderBySession_date(Long id);
    //Iterable<Session> findSessionByFilmIdAndSession_date(Long id, java.sql.Date date);
}
