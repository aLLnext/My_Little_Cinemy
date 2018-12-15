package My_Little_Teamy.My_Little_Cinemy.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DBWork {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String PidoeName;

    public DBWork() {
    }

    public DBWork(String PidorName) {
        this.PidoeName = PidorName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPidoeName() {
        return PidoeName;
    }

    public void setPidoeName(String pidoeName) {
        this.PidoeName = pidoeName;
    }
}
