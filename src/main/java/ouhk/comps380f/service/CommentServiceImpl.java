package ouhk.comps380f.service;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ouhk.comps380f.dao.CommentsRepository;
import ouhk.comps380f.model.Comments;

@Service
public class CommentServiceImpl implements CommentService{
    
    @Resource
    private CommentsRepository commentsRepo;
    
    @Override
    @Transactional
    public List<Comments> getContent() {
        return commentsRepo.findAll();
    }

    @Override
    @Transactional
    public long createComment(String studentName, String content) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public Comments getContent(long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
