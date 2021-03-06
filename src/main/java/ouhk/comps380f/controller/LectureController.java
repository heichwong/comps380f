package ouhk.comps380f.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;
import ouhk.comps380f.exception.AttachmentNotFound;
import ouhk.comps380f.exception.CommentNotFound;
import ouhk.comps380f.exception.LectureNotFound;
import ouhk.comps380f.model.Attachment;
import ouhk.comps380f.model.Lecture;
import ouhk.comps380f.service.AttachmentService;
import ouhk.comps380f.service.CommentService;
import ouhk.comps380f.view.DownloadingView;
import ouhk.comps380f.service.LectureService;
import ouhk.comps380f.service.PollService;

@Controller
@RequestMapping("lecture")
public class LectureController {
    
    @Autowired
    private CommentService commentService;
    
    @Autowired
    private LectureService lectureService;

    @Autowired
    private AttachmentService attachmentService;
    
    @Autowired
    private PollService pollService;

    @RequestMapping(value = {"", "list"}, method = RequestMethod.GET)
    public String list(ModelMap model) {
        model.addAttribute("lectureDatabase", lectureService.getLectures());
        model.addAttribute("pollDatabase", pollService.getPolls());
        return "list";
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public ModelAndView create() {
        return new ModelAndView("add", "lectureForm", new Form());
    }

    public static class Form {

        private String subject;
        private String body;
        private List<MultipartFile> attachments;

        public String getSubject() {
            return subject;
        }

        public void setSubject(String subject) {
            this.subject = subject;
        }

        public String getBody() {
            return body;
        }

        public void setBody(String body) {
            this.body = body;
        }

        public List<MultipartFile> getAttachments() {
            return attachments;
        }

        public void setAttachments(List<MultipartFile> attachments) {
            this.attachments = attachments;
        }

    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(Form form, Principal principal) throws IOException {
        long lectureId = lectureService.createLecture(
                principal.getName(), form.getSubject(), form.getBody(), form.getAttachments());
        return "redirect:/lecture/view/" + lectureId;
    }

    @RequestMapping(value = "view/{lectureId}", method = RequestMethod.GET)
    public String view(@PathVariable("lectureId") long lectureId,
            ModelMap model) {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null) {
            return "redirect:/lecture/list";
        }
        model.addAttribute("lecture", lecture);
        model.addAttribute("commentDatabase", commentService.getComment(lectureId));
        return "view";
    }

    @RequestMapping(
            value = "/{lectureId}/attachment/{attachment:.+}",
            method = RequestMethod.GET
    )
    public View download(@PathVariable("lectureId") long lectureId,
            @PathVariable("attachment") String name) {
        Attachment attachment = attachmentService.getAttachment(lectureId, name);
        if (attachment != null) {
            return new DownloadingView(attachment.getName(),
                    attachment.getMimeContentType(), attachment.getContents());
        }
        return new RedirectView("/lecture/list", true);
    }

    @RequestMapping(value = "delete/{lectureId}", method = RequestMethod.GET)
    public String deleteLecture(@PathVariable("lectureId") long lectureId)
            throws LectureNotFound, CommentNotFound {
        commentService.delAllComment(lectureId);
        lectureService.delete(lectureId);
        return "redirect:/lecture/list";
    }

    @RequestMapping(value = "edit/{lectureId}", method = RequestMethod.GET)
    public ModelAndView showEdit(@PathVariable("lectureId") long lectureId,
            Principal principal, HttpServletRequest request) {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(lecture.getStudentName()))) {
            return new ModelAndView(new RedirectView("/lecture/list", true));
        }

        ModelAndView modelAndView = new ModelAndView("edit");
        modelAndView.addObject("lecture", lecture);

        Form lectureForm = new Form();
        lectureForm.setSubject(lecture.getSubject());
        lectureForm.setBody(lecture.getBody());
        modelAndView.addObject("lectureForm", lectureForm);

        return modelAndView;
    }

    @RequestMapping(value = "edit/{lectureId}", method = RequestMethod.POST)
    public View edit(@PathVariable("lectureId") long lectureId, Form form,
            Principal principal, HttpServletRequest request)
            throws IOException, LectureNotFound {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(lecture.getStudentName()))) {
            return new RedirectView("/lecture/list", true);
        }

        lectureService.updateLecture(lectureId, form.getSubject(),
                form.getBody(), form.getAttachments());
        return new RedirectView("/lecture/view/" + lectureId, true);
    }

    @RequestMapping(
            value = "/{lectureId}/delete/{attachment:.+}",
            method = RequestMethod.GET
    )
    public String deleteAttachment(@PathVariable("lectureId") long lectureId,
            @PathVariable("attachment") String name) throws AttachmentNotFound {
        lectureService.deleteAttachment(lectureId, name);
        return "redirect:/lecture/edit/" + lectureId;
    }
    
    //Traditional Chinese Controller
    
    @RequestMapping(value = {"list/tc"}, method = RequestMethod.GET)
    public String TClist(ModelMap model) {
        model.addAttribute("lectureDatabase", lectureService.getLectures());
        model.addAttribute("pollDatabase", pollService.getPolls());
        return "TClist";
    }

    @RequestMapping(value = "create/tc", method = RequestMethod.GET)
    public ModelAndView TCcreate() {
        return new ModelAndView("TCadd", "lectureForm", new Form());
    }
    
        @RequestMapping(value = "create/tc", method = RequestMethod.POST)
    public String TCcreate(Form form, Principal principal) throws IOException {
        long lectureId = lectureService.createLecture(
                principal.getName(), form.getSubject(), form.getBody(), form.getAttachments());
        return "redirect:/lecture/view/tc" + lectureId;
    }

    @RequestMapping(value = "view/{lectureId}/tc", method = RequestMethod.GET)
    public String TCview(@PathVariable("lectureId") long lectureId,
            ModelMap model) {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null) {
            return "redirect:/lecture/list/tc";
        }
        model.addAttribute("lecture", lecture);
        model.addAttribute("commentDatabase", commentService.getComment(lectureId));
        return "TCview";
    }

    @RequestMapping(
            value = "/{lectureId}/attachment/{attachment:.+}/tc",
            method = RequestMethod.GET
    )
    public View TCdownload(@PathVariable("lectureId") long lectureId,
            @PathVariable("attachment") String name) {
        Attachment attachment = attachmentService.getAttachment(lectureId, name);
        if (attachment != null) {
            return new DownloadingView(attachment.getName(),
                    attachment.getMimeContentType(), attachment.getContents());
        }
        return new RedirectView("/lecture/list/tc", true);
    }

    @RequestMapping(value = "delete/{lectureId}/tc", method = RequestMethod.GET)
    public String TCdeleteLecture(@PathVariable("lectureId") long lectureId)
            throws LectureNotFound, CommentNotFound {
        commentService.delAllComment(lectureId);
        lectureService.delete(lectureId);
        return "redirect:/lecture/list/tc";
    }

    @RequestMapping(value = "edit/{lectureId}/tc", method = RequestMethod.GET)
    public ModelAndView TCshowEdit(@PathVariable("lectureId") long lectureId,
            Principal principal, HttpServletRequest request) {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(lecture.getStudentName()))) {
            return new ModelAndView(new RedirectView("/lecture/list/tc", true));
        }

        ModelAndView modelAndView = new ModelAndView("TCedit");
        modelAndView.addObject("lecture", lecture);

        Form lectureForm = new Form();
        lectureForm.setSubject(lecture.getSubject());
        lectureForm.setBody(lecture.getBody());
        modelAndView.addObject("lectureForm", lectureForm);

        return modelAndView;
    }

    @RequestMapping(value = "edit/{lectureId}/tc", method = RequestMethod.POST)
    public View TCedit(@PathVariable("lectureId") long lectureId, Form form,
            Principal principal, HttpServletRequest request)
            throws IOException, LectureNotFound {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null
                || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(lecture.getStudentName()))) {
            return new RedirectView("/lecture/list/tc", true);
        }

        lectureService.updateLecture(lectureId, form.getSubject(),
                form.getBody(), form.getAttachments());
        return new RedirectView("/lecture/view/tc/" + lectureId, true);
    }

    @RequestMapping(
            value = "/{lectureId}/delete/{attachment:.+}/tc",
            method = RequestMethod.GET
    )
    public String TCdeleteAttachment(@PathVariable("lectureId") long lectureId,
            @PathVariable("attachment") String name) throws AttachmentNotFound {
        lectureService.deleteAttachment(lectureId, name);
        return "redirect:/lecture/edit/tc/" + lectureId;
    }
}
