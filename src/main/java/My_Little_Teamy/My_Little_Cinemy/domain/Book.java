package My_Little_Teamy.My_Little_Cinemy.domain;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity(name = "books")
public class Book {

    @Id
    @GeneratedValue
    private long id;
    @Column(name = "users_id")
    @ManyToOne(targetEntity = Users.class)
    private Users user;

}
