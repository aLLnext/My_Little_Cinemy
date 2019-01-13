package My_Little_Teamy.My_Little_Cinemy.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {
    @RequestMapping("/error")
    public String errorOccurred(){
        return "some_error_page";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}
