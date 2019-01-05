package My_Little_Teamy.My_Little_Cinemy.controllers;

import My_Little_Teamy.My_Little_Cinemy.repos.BookRepo;
import My_Little_Teamy.My_Little_Cinemy.repos.FilmRepo;
import My_Little_Teamy.My_Little_Cinemy.repos.UserRepo;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@AllArgsConstructor(onConstructor = @__(@Autowired))
public class FrontController {

    @Autowired
    private UserRepo userRepo;
    @Autowired
    private BookRepo bookRepo;
    @Autowired
    private FilmRepo films;

    @RequestMapping(value = {"/index", "", "/", "/index#registration"}, method = RequestMethod.GET)
    public ModelAndView request_index(HttpServletRequest request) {
        ModelAndView result = new ModelAndView();
        result.addObject("signedIn", false);
        result.addObject("films_titles", films.getFilmsTitles());
        result.addObject("films_pic", films.getFilmsImages());
        result.setViewName("index");
        return result;
    }

    @RequestMapping("/account")
    public String account() {
        return "account";
    }
}