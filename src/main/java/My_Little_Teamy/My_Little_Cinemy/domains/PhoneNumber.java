package My_Little_Teamy.My_Little_Cinemy.domains;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "phone_numbers")
public class PhoneNumber {
    @Id
    @GeneratedValue
    private long id;
    private String name;
    private long cinema_id;
}
