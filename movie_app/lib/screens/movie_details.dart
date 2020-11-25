import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/model/movie_detail.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MovieDetails extends StatefulWidget {
  final String movieId;
  MovieDetails(this.movieId);
  final MovieBloc movieBloc = new MovieBloc();

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Movie Details"),
          backgroundColor: Colors.cyan,
        ),
        body: FutureBuilder(
          future: widget.movieBloc.displayMovies(widget.movieId),
          builder: (_, AsyncSnapshot<MovieDetail> movies) {
            if (movies.hasData) {
              return SingleChildScrollView(
                child: Container(
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 500.0,
                        width: 800.0,
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${movies.data.posterPath}'),
                      ),


                      Container(
                        child: SmoothStarRating(
                          color: Colors.amber,
                          rating: movies.data.voteAverage,
                          size: 65,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star_half,
                          defaultIconData: Icons.star_border,
                          starCount: 5,
                          allowHalfRating: false,
                          spacing: 1.0,
                          onRatingChanged: (value) {
                            setState(() {
                              movies.data.voteAverage = value;
                            });
                          },
                        ),
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 300,
                              child: Text(
                                '${movies.data.originalTitle}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '${movies.data.overview}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (movies.hasError) {
              return Container(
                child: Text("Error"),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
