package My_Little_Teamy.My_Little_Cinemy.Model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "genres")
public class Genre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;

}
