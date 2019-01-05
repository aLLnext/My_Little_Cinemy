package My_Little_Teamy.My_Little_Cinemy;

import My_Little_Teamy.My_Little_Cinemy.domain.Book;
import My_Little_Teamy.My_Little_Cinemy.domain.User;
import My_Little_Teamy.My_Little_Cinemy.repos.BookRepo;
import My_Little_Teamy.My_Little_Cinemy.repos.FilmRepo;
import My_Little_Teamy.My_Little_Cinemy.repos.UserRepo;
import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@AllArgsConstructor(onConstructor = @__(@Autowired))
public class FrontController {

    @Autowired
    private UserRepo userRepo;
    @Autowired
    private BookRepo bookRepo;
    @Autowired
    private FilmRepo films;
    public static final String POST_REQUEST_INDEX_NAME = "index";

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView post_request_index(HttpServletRequest request) {
        ModelAndView result = new ModelAndView();
        result.addObject("title", "ВАХОБ ЗОЕБАЛ");
        result.addObject("films_titles", films.getFilmsTitles());
        result.addObject("films_pic", films.getFilmsImages());
        return result;
    }

    @RequestMapping(value = "/error")
    public String handleError(HttpServletRequest request) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());

            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                return "error-404";
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                return "error-500";
            }
        }
        return "error";
    }

    /*public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name,
                           Map<String, Object> model) {
        //Iterable<User> test = userRepo.findAll();
        //Iterable<Book> test2 = bookRepo.findAll();
//        model.put("test",
//        test);
        Iterable<String> list = films.getFilmsTitles();

        return "index";
    }*/

    @RequestMapping("/account")
    public String account() {
        return "account";
    }
}