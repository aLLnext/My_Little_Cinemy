package My_Little_Teamy.My_Little_Cinemy.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "countries")
public class Country {
    @Id
    @GeneratedValue
    private long id;
    private String name;

}
