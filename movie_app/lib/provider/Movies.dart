import 'package:flutter/foundation.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/repository/movie_repository.dart';

class Movies extends ChangeNotifier{
  List<Movie> moviesList = <Movie>[];

  Movies() {
    fetchMovies();
  }
  void fetchMovies() async{
    moviesList = await MovieRepository().getMovies();
    notifyListeners();
  }

}