package My_Little_Teamy.My_Little_Cinemy.controller;

import My_Little_Teamy.My_Little_Cinemy.domains.User;
import My_Little_Teamy.My_Little_Cinemy.repos.UserRepo;
import My_Little_Teamy.My_Little_Cinemy.types.UpdatingUser;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
@AllArgsConstructor(onConstructor = @__(@Autowired))
public class UserController {

    @Autowired
    private UserRepo userRepo;

    @GetMapping("/account")
    public String account(Map<String, Object> model,
                          @CookieValue(value = "CINEMA-AUTH", defaultValue = "0") String userId) {
        User user = userRepo.findById(Long.valueOf(userId)).orElse(null);
        if (user == null)
            return "redirect:/index";
        model.put("name", user.getName());
        model.put("email", user.getEMail());
        model.put("phoneNumber", user.getPhoneNumber());
        model.put("signedIn", true);
        return "account";
    }

    @PostMapping(value = "/updateuser")
    public String updateUser(@ModelAttribute UpdatingUser updatingUser,
                             @CookieValue(value = "CINEMA-AUTH", defaultValue = "0") String userId) {
        User user = userRepo.findById(Long.valueOf(userId)).orElse(null);
        if (user == null){
            return "redirect:/index";
        }
        user.setPhoneNumber(updatingUser.getPhoneNumber());
        user.setEMail(updatingUser.getEMail());
        user.setName(updatingUser.getName());
        try {
            userRepo.save(user);
        } catch (Exception e) {
            return "redirect:/account";
        }

         return "redirect:/account";
    }
}
