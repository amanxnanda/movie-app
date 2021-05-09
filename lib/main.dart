import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movieapp/data/data_sources/movie_remote_data_source.dart';

void main() {
  Client client = Client();
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(client);
  dataSource.getTrending();

  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(),
    );
  }
}
