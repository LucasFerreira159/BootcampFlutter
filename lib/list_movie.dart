import 'package:bootcamp_flutter/movie.dart';
import 'package:bootcamp_flutter/widgets/movie_cell.dart';
import 'package:bootcamp_flutter/widgets/movie_detail.dart';
import 'package:bootcamp_flutter/widgets/movie_title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  _MovieListState() {
    getData();
  }

  List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Filmes",
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.black,
          elevation: 5.0,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MovieTitle(),
              Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: movies == null ? 0 : movies.length,
                  itemBuilder: (context, i) {
                    return FlatButton(
                      child: MovieCell(movies, i),
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MovieDetails(movies[i])));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Future getJson() async {
    var url =
        "http://api.themoviedb.org/3/movie/top_rated?api_key=3c6b7b5163f500336234a349b8b17a74&language=pt-BR";
    http.Response response = await http.get(url);
    return resultFromJson(response.body);
  }

  void getData() async {
    Result data = await getJson();

    setState(() {
      movies = data.movies;
    });
  }
}
