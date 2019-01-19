package My_Little_Teamy.My_Little_Cinemy.CustomType;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.Data;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
        "posX",
        "posY"
})
public class BookedTicket {
        @JsonProperty("posX")
        private String posX;
        @JsonProperty("posY")
        private String posY;
    @JsonProperty("posX")
    public String getPosX() {
        return posX;
    }

    @JsonProperty("posX")
    public void setPosX(String posX) {
        this.posX = posX;
    }

    @JsonProperty("posY")
    public String getPosY() {
        return posY;
    }

    @JsonProperty("posY")
    public void setPosY(String posY) {
        this.posY = posY;
    }
}
