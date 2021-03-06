package My_Little_Teamy.My_Little_Cinemy.Model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "medias")
public class Media {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String picture;
    @Column(name = "film_id")
    private long filmId;
}
