package ouhk.comps380f.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ouhk.comps380f.model.Comments;

public interface CommentsRepository extends JpaRepository<Comments, String> {
}
