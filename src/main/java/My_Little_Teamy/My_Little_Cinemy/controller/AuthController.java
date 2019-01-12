package My_Little_Teamy.My_Little_Cinemy.controller;

import My_Little_Teamy.My_Little_Cinemy.Model.User;
import My_Little_Teamy.My_Little_Cinemy.ModelRepo.UserRepo;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
@AllArgsConstructor(onConstructor = @__(@Autowired))
public class AuthController {
    @Autowired
    private UserRepo userRepo;

    @PostMapping("/login")
    public String login(@ModelAttribute("user") User user,
                        Map<String, Object> model,
                        HttpServletResponse response) {
        User userInDB = userRepo.findUserByEMail(user.getEMail());
        if (user.getPassword().equals(userInDB.getPassword())) {
            model.put("signedIn", true);
            response.addCookie(new Cookie("CINEMA-AUTH", userInDB.getId().toString()));
        } else {
            model.put("signedIn", false);
            return "redirect:/index";
        }

        return "redirect:/account";
    }

    @PostMapping("/reg")
    public String reg(@ModelAttribute("user") User user, HttpServletResponse response) {
        if (userRepo.findUserByEMail(user.getEMail()) != null) {
            return "redirect:/index";
        }
        user.setRole("VIEWER");
        response.addCookie(new Cookie("CINEMA-AUTH", userRepo.save(user).getId().toString()));
        return "redirect:/account";

    }

    @GetMapping("/logout")
    public String logout(HttpServletResponse response) {
        Cookie cookie = new Cookie("CINEMA-AUTH", "");
        response.addCookie(cookie);
        return "redirect:/index";
    }

}
