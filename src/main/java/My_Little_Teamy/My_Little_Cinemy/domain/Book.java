package My_Little_Teamy.My_Little_Cinemy.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "books")
public class Book {
    @Id
    @GeneratedValue
    private long id;
    private long user_id;

    @OneToMany(targetEntity = Ticket.class)
    @JoinColumn(name = "book_id")
    private Set<Ticket> tickets = new HashSet<>();
}
