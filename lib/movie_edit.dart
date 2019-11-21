import 'package:bootcamp_flutter/movie.dart';
import 'package:bootcamp_flutter/movie_edit_body.dart';
import 'package:flutter/material.dart';

class MovieEdit extends StatefulWidget {
  final Movie movie;

  MovieEdit(this.movie);

  @override
  _MovieEditState createState() => _MovieEditState(movie);
}

class _MovieEditState extends State<MovieEdit> {
  final Movie movie;
  final url = 'https://image.tmdb.org/t/p/w500';

  _MovieEditState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.black,
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(movie.title),
            background: Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(url + movie.backdropPath),
                      fit: BoxFit.fill)),
            ),
          ),
        ),
        SliverFillRemaining(
          child: MovieEditBody(movie),
        )
      ],
    ));
  }
}
