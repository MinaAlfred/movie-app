
import 'package:movieapp/data_access_layer/network_client.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/model/movie_detail.dart';

class MovieApi {

  Future<List<Movie>> fetchMoviesOnline() async {
    var jsonResponse = await HttpClient().fetchData();
    return List<Movie>.from(
        jsonResponse.map((jsonEntry) => Movie.fromJson(jsonEntry)));
  }

  Future<MovieDetail> fetchMoviesDetail(String mId) async {
    var jsonResponse = await HttpClient().fetchDetailData(mId);
    MovieDetail movieDetail= new MovieDetail();
    movieDetail.posterPath = jsonResponse['poster_path'];
    movieDetail.originalTitle = jsonResponse['original_title'];
    movieDetail.overview = jsonResponse['overview'];
    movieDetail.voteAverage = jsonResponse['vote_average'];
    return movieDetail;
  }

}