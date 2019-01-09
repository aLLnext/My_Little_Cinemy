package My_Little_Teamy.My_Little_Cinemy.controllers;

import My_Little_Teamy.My_Little_Cinemy.domains.Film;
import My_Little_Teamy.My_Little_Cinemy.domains.User;
import My_Little_Teamy.My_Little_Cinemy.repos.FilmRepo;
import My_Little_Teamy.My_Little_Cinemy.repos.UserRepo;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
@AllArgsConstructor(onConstructor = @__(@Autowired))
public class FrontController {

    @Autowired
    private FilmRepo filmRepo;
    @Autowired
    private UserRepo userRepo;


    private boolean isNewUser(User user){
        return (user == null || user.getName() == null ||
                user.getEMail() == null || user.getPassword() == null);
    }

    @RequestMapping(value = {"/index", "", "/"}, method = RequestMethod.GET)
    public ModelAndView index(@CookieValue(value = "CINEMA-AUTH",
                                        defaultValue = "0") String userId) {
        ModelAndView result = new ModelAndView();
        result.addObject("signedIn", userRepo.findById(Long.valueOf(userId)).isPresent());
        result.addObject("films", filmRepo.findAll());
        result.setViewName("index");
        return result;
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("user") User user,
                        Map<String, Object>          model,
                        HttpServletResponse          response) {
        User userInDB = userRepo.findUserByEMail(user.getEMail());
        if(user.getPassword().equals(userInDB.getPassword())) {
            model.put("signedIn", true);
            response.addCookie(new Cookie("CINEMA-AUTH",  userInDB.getId().toString()));
        } else {
            model.put("signedIn", false);
        }

        return "redirect:/account";
    }

    @PostMapping("/reg")
    public String reg(@ModelAttribute("user") User user, HttpServletResponse response){
        if (userRepo.findUserByEMail(user.getEMail()) != null) {
            return "redirect:/index";
        }
        user.setRole("VIEWER");
        response.addCookie(new Cookie("CINEMA-AUTH", userRepo.save(user).getId().toString()));
        return "redirect:/account";

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

    @GetMapping("/account")
    public String account(Map<String, Object> model,
                          @CookieValue(value = "CINEMA-AUTH", defaultValue = "0") String userId) {
        User user = userRepo.findById(Long.valueOf(userId)).orElse(null);
        if (isNewUser(user))
            return "redirect:/index";
        model.put("name", user.getName());
        model.put("email", user.getEMail());
        model.put("phoneNumber", user.getPhoneNumber());
        model.put("signedIn", true);
        return "account";
    }

    @PostMapping("/updateuser")
    public String updateUser(MultiValueMap form) {
        int a = 0;
        return "redirect:/account";
    }

    @GetMapping("/logout")
    public String logout(SessionStatus sessionStatus, HttpServletResponse response) {
        Cookie cookie = new Cookie("CINEMA-AUTH", "");
        //cookie.setMaxAge(0);
        response.addCookie(cookie);
        //response.addCookie(new Cookie("CINEMA-AUTH", "empty"));
//        sessionStatus.setComplete();
        return "redirect:/index";
    }


}