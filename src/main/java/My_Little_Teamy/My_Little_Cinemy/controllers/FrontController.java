package My_Little_Teamy.My_Little_Cinemy.controllers;

import My_Little_Teamy.My_Little_Cinemy.domains.User;
import My_Little_Teamy.My_Little_Cinemy.repos.FilmRepo;
import My_Little_Teamy.My_Little_Cinemy.repos.UserRepo;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@AllArgsConstructor(onConstructor = @__(@Autowired))
@SessionAttributes({"user"})
public class FrontController {

    @Autowired
    private FilmRepo filmRepo;
    @Autowired
    private UserRepo userRepo;


    @RequestMapping(value = {"/index", "", "/"}, method = RequestMethod.GET)
    public ModelAndView request_index(HttpServletRequest request, HttpSession session) {
        ModelAndView result = new ModelAndView();
        User user = (User)session.getAttribute("user");
        boolean isSigned;
        if(user == null)
            isSigned = false;
        else
            isSigned = user.getIsActive() == 1;

        result.addObject("signedIn", isSigned);
        result.addObject("films_titles", filmRepo.getFilmsTitles());
        result.addObject("films_pic", filmRepo.getFilmsImages());
        result.setViewName("index");
        return result;
    }

    @ModelAttribute("user")
    public User createUser(){
        return new User();
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("user") User user, HttpSession session,
                        HttpServletRequest request, Map<String, Object> model){
        User userInDB = userRepo.findUserByEMail(user.getEMail());
        if(user.getPassword().equals(userInDB.getPassword())) {
            user.setIsActive(1);
            user.setId(userInDB.getId());
            user.setBooks(userInDB.getBooks());
            user.setReviews(userInDB.getReviews());
            user.setRole(userInDB.getRole());
            user.setPhoneNumber(userInDB.getPhoneNumber());
            user.setName(userInDB.getName());
            session.invalidate();
            session = request.getSession();
            session.setAttribute("user", user);
            userInDB.setIsActive(1);
            model.put("signedIn", true);
        } else {
            model.put("signedIn", false);
        }

        return "redirect:/index";
    }

    @PostMapping("/reg")
    public String reg(@ModelAttribute("user") User user, HttpSession session,
                      HttpServletRequest request, Map<String, Object> model){
        User userFromDB = userRepo.findUserByEMailOrName(user.getEMail(), user.getName());
        if(userFromDB != null){
            return "redirect:/index";
        }
        session.invalidate();
        session = request.getSession();
        user.setRole("VIEWER");
        user.setIsActive(1);
        session.setAttribute("user", user);
        userRepo.save(user);
        return "redirect:/account";

    }

    @GetMapping("/account")
    public String account(Map<String, Object> model, HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(user == null || user.getEMail() == null || user.getName() == null)
            return "redirect:/index";
        model.put("name", user.getName());
        model.put("email", user.getEMail());
        model.put("phoneNumber", user.getPhoneNumber());
        return "account";
    }

}