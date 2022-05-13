package Test;

import domain.Movie;
import service.MovieService;

import java.sql.SQLException;
import java.util.List;

public class MovirManagementTest {
    public static void main(String[] args) throws SQLException {
        MovieService service = new MovieService();
        List<Movie> movies = service.findAllMovies();
        System.out.println(movies.toString());
    }

}
