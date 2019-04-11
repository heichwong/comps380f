package ouhk.comps380f.service;

import ouhk.comps380f.model.Comments;
import java.util.List;

public interface CommentService {
    public long createComment(String studentName, String content)
            throws Exception;
    
    public List<Comments> getContent();
    
    public Comments getContent(long id);
}
