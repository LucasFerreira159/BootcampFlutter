import 'package:bootcamp_flutter/movie.dart';
import 'package:bootcamp_flutter/movie_edit.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  MovieDetails(this.movie);

  @override
  Widget build(BuildContext context) {
    final url = 'https://image.tmdb.org/t/p/w500/';
    final maxSize = MediaQuery.of(context).size.width * 0.95;
    final _textStyle = TextStyle(color: Colors.white, fontSize: 18);

    return Scaffold(
        appBar: AppBar(
          title: Text("${movie.title}"),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MovieEdit(movie)));
                })
          ],
        ),
        body: Container(
            color: Colors.black,
            child: ListView(children: <Widget>[
              ListTile(
                  contentPadding: EdgeInsets.all(8),
                  title: Image(
                      width: maxSize,
                      image: NetworkImage(url + movie.backdropPath))),
              ListTile(
                  title: Text(
                "Avaliação: ${movie.voteAverage} (${movie.voteCount} votos)",
                style: _textStyle,
              )),
              ListTile(
                title: Text(
                  "Lançamento: ${movie.releaseDate.year}",
                  style: _textStyle,
                ),
              ),
              ListTile(
                title: Text(
                  movie.overview,
                  style: _textStyle,
                ),
              )
            ])));
  }
}
