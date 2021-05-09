import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movieapp/data/models/movie_model.dart';

class MovieEntity extends Equatable {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final OriginalLanguage originalLanguage;
  final String originalTitle;
  final String posterPath;
  final int id;
  final bool video;
  final double voteAverage;
  final String overview;
  final DateTime releaseDate;
  final int voteCount;
  final String title;
  final double popularity;
  final MediaType mediaType;

  MovieEntity({
    @required this.adult,
    @required this.backdropPath,
    @required this.genreIds,
    @required this.originalLanguage,
    @required this.originalTitle,
    @required this.posterPath,
    @required this.id,
    @required this.video,
    @required this.voteAverage,
    this.overview,
    @required this.releaseDate,
    @required this.voteCount,
    @required this.title,
    @required this.popularity,
    @required this.mediaType,
  }) : assert(id == null, 'Movie id must not be null');

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
