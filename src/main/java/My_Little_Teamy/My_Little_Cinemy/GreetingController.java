package My_Little_Teamy.My_Little_Cinemy;

import My_Little_Teamy.My_Little_Cinemy.domain.Book;
import My_Little_Teamy.My_Little_Cinemy.domain.User;
import My_Little_Teamy.My_Little_Cinemy.repos.BookRepo;
import My_Little_Teamy.My_Little_Cinemy.repos.UserRepo;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@AllArgsConstructor(onConstructor = @__(@Autowired))
public class GreetingController {

    @Autowired
    private UserRepo userRepo;
    @Autowired
    private BookRepo bookRepo;
    @GetMapping("/greeting")
    public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name,
                           Map<String, Object> model) {
        Iterable<User> test = userRepo.findAll();
        Iterable<Book> test2 = bookRepo.findAll();
//        model.put("test", test);
        int a=8;
        return "greeting";
    }

}