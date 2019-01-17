package My_Little_Teamy.My_Little_Cinemy.controller;

import My_Little_Teamy.My_Little_Cinemy.Model.Film;
import My_Little_Teamy.My_Little_Cinemy.Model.Session;
import My_Little_Teamy.My_Little_Cinemy.Model.Ticket;
import My_Little_Teamy.My_Little_Cinemy.ModelRepo.*;
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
    @Autowired
    private TicketRepo ticketRepo;
    @Autowired
    private CinemaRepo cinemaRepo;
    @Autowired
    private HallRepo hallRepo;
    @Autowired
    private GenreRepo genreRepo;
    @Autowired
    CountryRepo countryRepo;
    @Autowired
    ParticipantRepo participantRepo;




    @RequestMapping(value = {"/index", "", "/"}, method = RequestMethod.GET)
    public ModelAndView index(@CookieValue(value = "CINEMA-AUTH",
            defaultValue = "0") String userId) {
        ModelAndView result = new ModelAndView();
        result.addObject("signedIn", userRepo.findById(Long.valueOf(userId)).isPresent());
        result.addObject("films", filmRepo.findAll());
        result.setViewName("index");
        return result;
    }

    @RequestMapping(value = "/cinemas", method = RequestMethod.GET)
    public String cinemas(Map<String, Object> model, @CookieValue(value = "CINEMA-AUTH", defaultValue = "0") String userId){

        return "all_cinemas";
    }

    @RequestMapping(value = "/cinemas/{id}", method = RequestMethod.GET)
    public String current_cinema(@PathVariable long id, Map<String, Object> model, @CookieValue(value = "CINEMA-AUTH", defaultValue = "0") String userId){

        return "cinema";
    }

    @RequestMapping(value = "/films/{id}", method = RequestMethod.GET)
    public String films(@PathVariable long id, Map<String, Object> model, @CookieValue(value = "CINEMA-AUTH", defaultValue = "0") String userId) {
        Film filmFromDB = filmRepo.findById(id).orElse(null);
        model.put("film", filmFromDB);
        model.put("genres", genreRepo.findGenresByFilmId(id));
        model.put("countries", countryRepo.findCountriesByFilmId(id));
        model.put("directors",participantRepo.findPartisipantsByfilmIdAndPost(id, "director"));
        model.put("producers",participantRepo.findPartisipantsByfilmIdAndPost(id, "producer"));
        model.put("screenwriters",participantRepo.findPartisipantsByfilmIdAndPost(id, "screenwriter"));
        model.put("actors",participantRepo.findPartisipantsByfilmIdAndPost(id, "actor"));
        //TODO(НУЖНО ПО ID ДОСТАТЬ НАЗВАНИЯ)
        Iterable<Session> all_sessions = sessionRepo.findByFilmIdOrderBySessionDateAsc(id);
        ArrayList<ArrayList<Object>> sessions = new ArrayList<>();
        ArrayList<Object> inner = new ArrayList<>();
        for (Session session : all_sessions) {
            if(inner.size() > 0) {
                if (session.getSessionDate() == ((Session)((ArrayList)inner.get(0)).get(0)).getSessionDate()) {
                    inner.add(InsertIntoSession(session));
                } else {
                    sessions.add(inner);
                    inner = new ArrayList<>();
                    inner.add(InsertIntoSession(session));
                }
            }
            else{
                inner.add(InsertIntoSession(session));
            }
        }
        sessions.add(inner);
        model.put("sessions", sessions);
        model.put("signedIn", userRepo.findById(Long.valueOf(userId)).isPresent());

        return "films";
    }

    public ArrayList<Object> InsertIntoSession(Session session){
        ArrayList<Object> inner = new ArrayList<>();
        inner.add(session);
        inner.add(cinemaRepo.findCinemaById(session.getCinemaId()));
        inner.add(hallRepo.findHallById(session.getHallId()));
        inner.add(ticketRepo.findTicketBySessionId(session.getId()));
        return inner;
    }
}