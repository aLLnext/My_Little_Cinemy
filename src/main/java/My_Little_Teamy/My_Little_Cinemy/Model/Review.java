package My_Little_Teamy.My_Little_Cinemy.Model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "reviews")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "review_text")
    private String reviewText;
    @Column(name = "publication_date")
    private java.sql.Date publicationDate;
    @Column(name = "film_id")
    private long filmId;
    @Column(name = "user_id")
    private long userId;
    private Long mark;

}
