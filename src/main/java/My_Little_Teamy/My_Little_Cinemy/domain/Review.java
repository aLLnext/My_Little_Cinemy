package My_Little_Teamy.My_Little_Cinemy.domain;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "reviews")
public class Review {
    @Id
    @GeneratedValue
    private long id;
    private String text;
    @Column(name = "publication_date")
    private java.sql.Date publicationDate;
    @Column(name = "film_id")
    private long filmId;
    @Column(name = "user_id")
    private long userId;
    private Double mark;

}
