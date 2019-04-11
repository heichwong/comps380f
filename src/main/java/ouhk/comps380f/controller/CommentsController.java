package ouhk.comps380f.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ouhk.comps380f.service.CommentService;

@Controller
@RequestMapping("lecture")
public class CommentsController {
    
    @Autowired
    private CommentService commentService;
    
    @RequestMapping(value = "/comment/{lecture.id}", method = RequestMethod.GET)
    public ModelAndView create(@PathVariable("lectureId") long lectureId, ModelMap model) {
        return new ModelAndView("comments", "comments", new commentForm());
    }
    
    public static class commentForm {

        private String username;
        private String content;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }
    }

    

    
    
}
