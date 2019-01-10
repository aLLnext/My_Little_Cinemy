package My_Little_Teamy.My_Little_Cinemy.controller;

import My_Little_Teamy.My_Little_Cinemy.Model.Film;
import My_Little_Teamy.My_Little_Cinemy.ModelRepo.FilmRepo;
import My_Little_Teamy.My_Little_Cinemy.ModelRepo.UserRepo;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@AllArgsConstructor(onConstructor = @__(@Autowired))
public class FrontController {

    @Autowired
    private FilmRepo filmRepo;
    @Autowired
    private UserRepo userRepo;



    @RequestMapping(value = {"/index", "", "/"}, method = RequestMethod.GET)
    public ModelAndView index(@CookieValue(value = "CINEMA-AUTH",
                                        defaultValue = "0") String userId) {
        ModelAndView result = new ModelAndView();
        result.addObject("signedIn", userRepo.findById(Long.valueOf(userId)).isPresent());
        result.addObject("films", filmRepo.findAll());
        result.setViewName("index");
        return result;
    }




    @RequestMapping(value = "/films/{id}", method = RequestMethod.GET)
    public String films(@PathVariable long id, Map<String, Object> model, @CookieValue(value = "CINEMA-AUTH", defaultValue = "0") String userId) {
        try {
            Film film = filmRepo.findFilmById(id);
            model.put("film", film);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        model.put("signedIn", userRepo.findById(Long.valueOf(userId)).isPresent());
        return "films";
    }





}