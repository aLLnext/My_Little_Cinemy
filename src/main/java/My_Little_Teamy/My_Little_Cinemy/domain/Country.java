package My_Little_Teamy.My_Little_Cinemy.domain;

import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "countries")
public class Country {
    @Id
    @GeneratedValue
    private long id;
    private String name;
    @ManyToMany(mappedBy = "countries")
    private Set<Film> films = new HashSet<>();

}
