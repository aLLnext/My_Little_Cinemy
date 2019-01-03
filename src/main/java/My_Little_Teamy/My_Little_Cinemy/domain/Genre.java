package My_Little_Teamy.My_Little_Cinemy.domain;

import lombok.Data;
import org.springframework.data.annotation.TypeAlias;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "genres")
public class Genre {
    @Id
    @GeneratedValue
    private long id;
    private String name;

    @Override
    public String toString(){
        return super.toString();
    }
}
