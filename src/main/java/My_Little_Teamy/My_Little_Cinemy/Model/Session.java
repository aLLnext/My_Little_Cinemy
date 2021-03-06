package My_Little_Teamy.My_Little_Cinemy.Model;

import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "sessions")
public class Session {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "session_date")
    private java.sql.Date sessionDate;
    @Column(name = "session_time")
    private java.sql.Time sessionTime;
    @Column(name = "film_id")
    private long filmId;
    @Column(name = "cinema_id")
    private long cinemaId;
    @Column(name = "hall_id")
    private long hallId;

    @OneToMany(targetEntity = Ticket.class)
    @JoinColumn(name = "session_id")
    private Set<Ticket> tickets = new HashSet<>();
}
