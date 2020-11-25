import 'package:movieapp/api/movie_api.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/model/movie_detail.dart';

class MovieRepository {
  Future<List<Movie>> getMovies() async{
    return await MovieApi().fetchMoviesOnline();
  }
  Future<MovieDetail> moviesDetails(String movId) async =>
      await MovieApi().fetchMoviesDetail(movId);
}