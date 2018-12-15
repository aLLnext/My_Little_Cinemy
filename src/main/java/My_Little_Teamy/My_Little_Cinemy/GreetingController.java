package My_Little_Teamy.My_Little_Cinemy;

import My_Little_Teamy.My_Little_Cinemy.domain.DBWork;
import My_Little_Teamy.My_Little_Cinemy.repos.DBWorkRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class GreetingController {

    @Autowired
    private DBWorkRepo dbWork;
    @GetMapping("/greeting")
    public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name,
                           Map<String, Object> model) {
        model.put("name", name);
        return "greeting";
    }
    @GetMapping()
    public String main(Map<String, Object> model){
        Iterable<DBWork> all = dbWork.findAll();
        model.put("users", all);
        return "main";
    }
    @PostMapping()
    public String add(Map<String, Object> model, @RequestParam String user) {
        DBWork dbWork1 = new DBWork(user);
        dbWork.save(dbWork1);
        Iterable<DBWork> all = dbWork.findAll();
        model.put("users", all);
        return "main";
    }

}