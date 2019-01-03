package My_Little_Teamy.My_Little_Cinemy.domain;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

@Data
@Entity
@Table(name = "users", uniqueConstraints = @UniqueConstraint(
        columnNames = {"e_mail", "phone_number"}))
public class User {
    @Id
    @GeneratedValue
    private long id;

    private String name;
    private String group;
    @Column(name = "e_mail")
    private String eMail;
    @Column(name = "phone_number")
    private String phoneNumber;


    @OneToMany(cascade = CascadeType.ALL, targetEntity = Book.class, mappedBy = "owner")
    private Collection<Book> books;

    @Override
    public String toString(){
        return super.toString();
    }

}
