import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/provider/Movies.dart';
import 'package:provider/provider.dart';

import 'movie_details.dart';

class MovieListWithProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Movie"),
        backgroundColor: Colors.cyan,
      ),
      body: ChangeNotifierProvider<Movies> (
        create: (context) => Movies(),
          child: MovieListBody(),
      ),
    );
  }
}

class MovieListBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<Movies>(
      builder: (BuildContext context, Movies movies, Widget child) => Container(
        color: Colors.black,
        child: ListView.builder(
          itemBuilder: (_, int index) => ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieDetails('${movies.moviesList[index].id}')));
            },
            leading: Container(
              child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movies.moviesList[index].posterPath}'),
            ),
            title: Text(
              movies.moviesList[index].title,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          itemCount: movies.moviesList.length,
        ),
      ),
    );
  }

}