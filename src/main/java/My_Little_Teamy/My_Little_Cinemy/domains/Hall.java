package My_Little_Teamy.My_Little_Cinemy.domains;

import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "halls")
public class Hall {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "cinema_id")
    private long cinemaId;
    private String name;
    private long line;
    private long place;

    @OneToMany(targetEntity = Session.class)
    @JoinColumn(name = "hall_id")
    private Set<Session> sessions = new HashSet<>();
}
