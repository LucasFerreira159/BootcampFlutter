import 'package:flutter/material.dart';

import 'movie.dart';
import 'movie_edit.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;

  MovieDetails(this.movie);

  @override
  _MovieDetailsState createState() => _MovieDetailsState(movie);
}

class _MovieDetailsState extends State<MovieDetails> {
  final Movie movie;
  final url = 'https://image.tmdb.org/t/p/w500/';

  _MovieDetailsState(this.movie);

  Widget pupularityIcon() {
    if (movie.popularity < 20) {
      return Icon(Icons.sentiment_very_dissatisfied, color: Colors.red);
    } else if (movie.popularity < 40) {
      return Icon(Icons.sentiment_dissatisfied, color: Colors.orange);
    } else if (movie.popularity < 60) {
      return Icon(Icons.sentiment_neutral, color: Colors.yellow);
    } else if (movie.popularity < 80) {
      return Icon(Icons.sentiment_satisfied, color: Colors.blue);
    } else {
      return Icon(Icons.sentiment_very_satisfied, color: Colors.green);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(movie.title), backgroundColor: Colors.black),
        body: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              Image.network(url + movie.backdropPath),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Idioma original: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(movie.originalLanguage),
                            Spacer(),
                            Text(
                              "Popularidade: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            this.pupularityIcon(),
                            Spacer(),
                            Text(
                              "Adulto: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("${movie.adult ? 'Sim' : 'Não'}"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Data de lançamento: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                '${movie.releaseDate.day}/${movie.releaseDate.month}/${movie.releaseDate.year}'),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text("Descrição:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                      Text(movie.overview)
                    ],
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    "Editar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieEdit(movie)));
                  },
                ),
              )
            ],
          ),
        ));
  }
}
