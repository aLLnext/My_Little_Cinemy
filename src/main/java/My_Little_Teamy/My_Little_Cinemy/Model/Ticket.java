package My_Little_Teamy.My_Little_Cinemy.Model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "tickets")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String status;
    @Column(name = "price_rub")
    private long priceRub;
    private long line;
    private long place;
    @Column(name = "session_id")
    private long sessionId;
    @Column(name = "book_id")
    private Long bookId;
}
