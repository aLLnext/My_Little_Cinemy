package My_Little_Teamy.My_Little_Cinemy;

import My_Little_Teamy.My_Little_Cinemy.domain.DBWork;
import My_Little_Teamy.My_Little_Cinemy.repos.DBWorkRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collection;
import java.util.Map;

@Controller
public class GreetingController {

    @Autowired
    private DBWorkRepo dbWork;
    @GetMapping("/greeting")
    public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name,
                           Map<String, Object> model) {
        Collection<String> test = dbWork.findAllActiveUsers();
        model.put("users", test);

        Integer a = 0;
        return "greeting";
    }

}