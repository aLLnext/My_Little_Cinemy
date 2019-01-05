package My_Little_Teamy.My_Little_Cinemy.domain;

import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "films", uniqueConstraints = @UniqueConstraint(
        columnNames = {"title", "date_release"}))
public class Film {
    @Id
    @GeneratedValue
    private long id;
    private String title;
    private java.sql.Date date_release;
    private long duration;
    private long rars;
    @Column(name = "main_photo")
    private String mainPhoto;
    private String description;
    @Column(name = "imdb_rate")
    private Double IMDBRate;
    @Column(name = "kinopoisk_rate")
    private double kinopoiskRate;

    @OneToMany(targetEntity = Media.class)
    @JoinColumn(name = "film_id")
    private Set<Media> medias = new HashSet<>();

    @OneToMany(targetEntity = Review.class)
    @JoinColumn(name = "film_id")
    private Set<Review> reviews = new HashSet<>();

    @OneToMany(targetEntity = Session.class)
    @JoinColumn(name = "film_id")
    private Set<Session> sessions = new HashSet<>();


}
