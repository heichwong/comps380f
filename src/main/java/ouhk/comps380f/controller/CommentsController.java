package ouhk.comps380f.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.model.Lecture;
import ouhk.comps380f.service.CommentService;
import ouhk.comps380f.service.LectureService;
import ouhk.comps380f.exception.CommentNotFound;

@Controller
@RequestMapping("lecture")
public class CommentsController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private LectureService lectureService;

    public static class cmForm {

        private long id;
        private String username;
        private String comment;
        private long lecture_id;

        public long getId() {
            return id;
        }

        public void setId(long id) {
            this.id = id;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getComment() {
            return comment;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }

        public long getLecture_id() {
            return lecture_id;
        }

        public void setLecture_id(long lecture_id) {
            this.lecture_id = lecture_id;
        }

    }

    @RequestMapping(value = "/comment/{lectureId}", method = RequestMethod.GET)
    public ModelAndView createForm(@PathVariable("lectureId") long lectureId, ModelMap model) {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null) {
            return new ModelAndView("list");
        }
        model.addAttribute("lecture", lecture);
        return new ModelAndView("comment", "commentForm", new cmForm());
    }

    @RequestMapping(value = "comment/{lectureId}", method = RequestMethod.POST)
    public View addComment(@PathVariable("lectureId") long lectureId, cmForm form,
            ModelMap model, HttpServletRequest request) throws Exception {
        commentService.createComment(request.getUserPrincipal().getName(), form.getComment(), form.getLecture_id());
        return new RedirectView("/lecture/view/" + lectureId, true);
    }

    @RequestMapping(value = "view/deleteComment/{lectureId}/{Id}", method = RequestMethod.GET)
    public View delComment(@PathVariable("Id") long Id, @PathVariable("lectureId") long lectureId)
            throws CommentNotFound {
        commentService.delComment(Id);
        return new RedirectView("/lecture/view/" + lectureId, true);
    }


//Traditional Chinese Controller   
    
        @RequestMapping(value = "/comment/{lectureId}/tc", method = RequestMethod.GET)
    public ModelAndView TCcreateForm(@PathVariable("lectureId") long lectureId, ModelMap model) {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null) {
            return new ModelAndView("TClist");
        }
        model.addAttribute("lecture", lecture);
        return new ModelAndView("TCcomment", "commentForm", new cmForm());
    }

    @RequestMapping(value = "comment/{lectureId}/tc", method = RequestMethod.POST)
    public View TCaddComment(@PathVariable("lectureId") long lectureId, cmForm form,
            ModelMap model, HttpServletRequest request) throws Exception {
        commentService.createComment(request.getUserPrincipal().getName(), form.getComment(), form.getLecture_id());
        return new RedirectView("/lecture/view/tc/" + lectureId, true);
    }

    @RequestMapping(value = "view/deleteComment/{lectureId}/{Id}/tc", method = RequestMethod.GET)
    public View TCdelComment(@PathVariable("Id") long Id, @PathVariable("lectureId") long lectureId)
            throws CommentNotFound {
        commentService.delComment(Id);
        return new RedirectView("/lecture/view/tc/" + lectureId, true);
    }
    
}