import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


class HttpClient {

  Future <dynamic> fetchData() async {
    var url =
        'https://api.themoviedb.org/4/discover/movie?api_key=6557d01ac95a807a036e5e9e325bb3f0&sort_by=popularity.desc';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var moviesResult = jsonResponse['results'];
      return moviesResult;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return Future.error(Error());
    }
  }

  Future<dynamic> fetchDetailData(String mId) async {
    var url =
        'https://api.themoviedb.org/3/movie/$mId?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return Future.error(Error());
    }
  }
}