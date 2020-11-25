import 'package:movieapp/model/movie_detail.dart';
import 'package:movieapp/repository/movie_repository.dart';

class MovieBloc {
  Future<MovieDetail> displayMovies(String movId) async {
    return await MovieRepository().moviesDetails(movId);
  }
}
