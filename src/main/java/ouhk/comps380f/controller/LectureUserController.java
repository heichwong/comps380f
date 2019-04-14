package ouhk.comps380f.controller;

import java.io.IOException;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.model.LectureUser;
import ouhk.comps380f.dao.LectureUserRepository;

@Controller
@RequestMapping("user")
public class LectureUserController {

    @Resource
    LectureUserRepository lectureUserRepo;

    @RequestMapping(value = {"", "list"}, method = RequestMethod.GET)
    public String list(ModelMap model) {
        model.addAttribute("lectureUsers", lectureUserRepo.findAll());
        return "listUser";
    }

    public static class Form {

        private String username;
        private String password;
        private String[] roles;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public ModelAndView create() {
        return new ModelAndView("addUser", "lectureUser", new Form());
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public View create(Form form) throws IOException {
        LectureUser user = new LectureUser(form.getUsername(),
                form.getPassword(), form.getRoles()
        );
        lectureUserRepo.save(user);
        return new RedirectView("/user/list", true);
    }

    @RequestMapping(value = "delete/{username}", method = RequestMethod.GET)
    public View deleteLecture(@PathVariable("username") String username) {
        lectureUserRepo.delete(lectureUserRepo.findOne(username));
        return new RedirectView("/user/list", true);
    }
    
    //Traditional Chinese Controller
    @RequestMapping(value = {"list/tc"}, method = RequestMethod.GET)
    public String TClist(ModelMap model) {
        model.addAttribute("lectureUsers", lectureUserRepo.findAll());
        return "TClistUser";
    }
    
    @RequestMapping(value = "create/tc", method = RequestMethod.GET)
    public ModelAndView TCcreate() {
        return new ModelAndView("TCaddUser", "lectureUser", new Form());
    }

    @RequestMapping(value = "create/tc", method = RequestMethod.POST)
    public View TCcreate(Form form) throws IOException {
        LectureUser user = new LectureUser(form.getUsername(),
                form.getPassword(), form.getRoles()
        );
        lectureUserRepo.save(user);
        return new RedirectView("/user/list/tc", true);
    }

    @RequestMapping(value = "delete/{username}/tc", method = RequestMethod.GET)
    public View TCdeleteLecture(@PathVariable("username") String username) {
        lectureUserRepo.delete(lectureUserRepo.findOne(username));
        return new RedirectView("/user/list/tc", true);
    }
    
}
