import 'package:flutter/material.dart';
import 'movie.dart';

class MovieEditBody extends StatefulWidget {
  final Movie movie;

  MovieEditBody(this.movie);

  @override
  _MovieEditBodyState createState() => _MovieEditBodyState(this.movie);
}

class _MovieEditBodyState extends State<MovieEditBody> {
  final Movie movie;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _MovieEditBodyState(this.movie) {
    _titleController.text = movie.title;
    _descriptionController.text = movie.overview;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Form(
          key: _formKey,
          child: Wrap(
            runSpacing: 25,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Informe um valor!";
                  }
                  return null;
                },
                controller: _titleController,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Titulo do filme"),
              ),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Sinopse do filme"),
                controller: _descriptionController,
              ),
              Center(
                child: RaisedButton(
                  child: Text("Salvar"),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  onPressed: () {
                    if (_formKey.currentState.validate() &&
                        _descriptionController.text.length > 0) {
                      movie.title = _titleController.text;
                      movie.overview = _descriptionController.text;
                      Navigator.of(context).pop();
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
