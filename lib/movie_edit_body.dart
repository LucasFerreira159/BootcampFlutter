import 'package:flutter/material.dart';

import 'movie.dart';

class MovieEditBody extends StatefulWidget {
  final Movie movie;

  MovieEditBody(this.movie);

  @override
  _MovieEditBodyState createState() => _MovieEditBodyState(movie);
}

class _MovieEditBodyState extends State<MovieEditBody> {
  final Movie movie;
  var _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

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
          autovalidate: true,
          key: _formKey,
          child: Wrap(
            runSpacing: 25,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              SizedBox(),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Valor nao pode ser vazio!";
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
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    if (_formKey.currentState.validate() &&
                        _descriptionController.text.length > 0) {
                      movie.title = _titleController.text;
                      movie.overview = _descriptionController.text;
                      Navigator.of(context).pop(movie);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
