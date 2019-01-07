package My_Little_Teamy.My_Little_Cinemy.domains;

import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "users", uniqueConstraints = {
        @UniqueConstraint(
                columnNames = {"e_mail", "phone_number"}),
        @UniqueConstraint(
                columnNames = {"name", "password"})
})
public class User{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "name")
    private String name;
    private String role;
    @Column(name = "e_mail")
    private String eMail;
    @Column(name = "phone_number")
    private String phoneNumber;
    private String password;
    @Column(name = "is_active")
    private int isActive;

    @OneToMany(targetEntity = Book.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private Set<Book> books = new HashSet<>();

    @OneToMany(targetEntity = Review.class, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private Set<Review> reviews = new HashSet<>();

}
