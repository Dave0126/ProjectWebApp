package Test;

import dao.CommentDao;
import domain.Comment;
import service.CommentService;

import java.sql.SQLException;
import java.util.List;

public class CommentSerivceTest {
    static CommentDao comment = new CommentDao();

    public static void main(String[] args) throws SQLException {
        CommentService commentService = new CommentService();
        try {
            List<Comment> comments = commentService.findCommentsByMovieName("航海王：狂热行动 ONE PIECE STAMPEDE");
            for(Comment c : comments) {
                System.out.println(c.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
