package My_Little_Teamy.My_Little_Cinemy.Model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "people",
        uniqueConstraints = @UniqueConstraint(
                columnNames = {"name", "surname"}))
public class Participant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String surname;
}
