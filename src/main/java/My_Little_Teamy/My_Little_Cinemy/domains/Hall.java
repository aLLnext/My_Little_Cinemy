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
    @GeneratedValue
    private long id;
    @Column(name = "cinema_id")
    private long cinemaId;
    private String name;
    private long rows;
    private long columns;

    @OneToMany(targetEntity = Session.class)
    @JoinColumn(name = "hall_id")
    private Set<Session> sessions = new HashSet<>();
}
