package My_Little_Teamy.My_Little_Cinemy.domain;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "books")
public class Book {
    @Id
    @GeneratedValue
    private long id;
//    private long Users_id;

    @ManyToOne(cascade = CascadeType.ALL, targetEntity = User.class)
    @JoinColumn(name = "Users_id")
    private User owner;

}
