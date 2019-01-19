package My_Little_Teamy.My_Little_Cinemy.ModelRepo;

import My_Little_Teamy.My_Little_Cinemy.Model.Ticket;
import org.springframework.data.repository.CrudRepository;

import java.util.ArrayList;

public interface TicketRepo extends CrudRepository<Ticket, Long> {
    Iterable<Ticket> findTicketBySessionId(Long id);
    ArrayList<Ticket> findTicketsBySessionId(Long id);
    Ticket findTicketByLineAndPlaceAndSessionId(Long line, Long place, Long session_id);
}
