package My_Little_Teamy.My_Little_Cinemy.controller;

import My_Little_Teamy.My_Little_Cinemy.CustomType.CinemaNameHallName;
import My_Little_Teamy.My_Little_Cinemy.Model.Session;
import My_Little_Teamy.My_Little_Cinemy.ModelRepo.FilmRepo;
import My_Little_Teamy.My_Little_Cinemy.ModelRepo.SessionRepo;
import My_Little_Teamy.My_Little_Cinemy.ModelRepo.UserRepo;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@AllArgsConstructor(onConstructor = @__(@Autowired))
public class FrontController {

    @Autowired
    private FilmRepo filmRepo;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private SessionRepo sessionRepo;


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
        model.put("film", filmRepo.findById(id).orElse(null));
        //TODO
        ArrayList<Session> all_sessions = sessionRepo.findSessionByFilmOrderByDate(id);
        ArrayList<ArrayList<Session>> sessions = new ArrayList<>();
        ArrayList<Session> inner = new ArrayList<>();
        for (Session session : all_sessions) {
            if(inner.size() > 0) {
                if (session.getSession_date() == (inner.get(0)).getSession_date()) {
                    inner.add(session);
                } else {
                    sessions.add(inner);
                    inner = new ArrayList<>();
                    inner.add(session);
                }
            }
            else{
                inner.add(session);
            }
        }
        sessions.add(inner);
        model.put("sessions", sessions);
        model.put("signedIn", userRepo.findById(Long.valueOf(userId)).isPresent());
        return "films";
    }


}