package My_Little_Teamy.My_Little_Cinemy.domains;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "medias")
public class Media {
    @Id
    @GeneratedValue
    private long id;
    private String picture;
    private long film_id;
}
