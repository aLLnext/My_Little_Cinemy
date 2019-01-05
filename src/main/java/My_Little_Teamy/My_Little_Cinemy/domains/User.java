package My_Little_Teamy.My_Little_Cinemy.domains;

import My_Little_Teamy.My_Little_Cinemy.types.Group;
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
public class User {
    @Id
    @GeneratedValue
    private long id;

    private String name;
    @Enumerated(EnumType.STRING)
    private Group group;
    @Column(name = "e_mail")
    private String eMail;
    @Column(name = "phone_number")
    private String phoneNumber;
    private String password;


    @OneToMany(targetEntity = Book.class)
    @JoinColumn(name = "user_id")
    private Set<Book> books = new HashSet<>();

    @OneToMany(targetEntity = Review.class)
    @JoinColumn(name = "user_id")
    private Set<Review> reviews = new HashSet<>();

}
