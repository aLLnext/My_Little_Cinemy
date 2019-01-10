package My_Little_Teamy.My_Little_Cinemy.Model;

import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "cinemas")
public class Cinema {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    @Column(unique = true)
    private String adress;
    private String description;
    private String icon;
    @Column(name = "email")
    private String eMail;

    @OneToMany(targetEntity = Hall.class)
    @JoinColumn(name = "cinema_id")
    private Set<Hall> halls = new HashSet<>();

    @OneToMany(targetEntity = Session.class)
    @JoinColumn(name = "cinema_id")
    private Set<Session> sessions = new HashSet<>();
}
