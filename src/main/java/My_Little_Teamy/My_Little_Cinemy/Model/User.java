package My_Little_Teamy.My_Little_Cinemy.Model;

import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "users")
public class User{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;
    private String role;
    @Column(name = "e_mail", unique = true, nullable = false)
    private String eMail;
    @Column(name = "phone_number")
    private String phoneNumber;
    private String password;

    @OneToMany(targetEntity = Book.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private Set<Book> books = new HashSet<>();

    @OneToMany(targetEntity = Review.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private Set<Review> reviews = new HashSet<>();

}
