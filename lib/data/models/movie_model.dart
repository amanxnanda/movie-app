// To parse this JSON data, do
//
//     final movieListModel = movieListModelFromJson(jsonString);

import 'dart:convert';

import 'package:movieapp/domain/entities/movie_entity.dart';

MovieListModel movieListModelFromJson(String str) => MovieListModel.fromJson(json.decode(str));

String movieListModelToJson(MovieListModel data) => json.encode(data.toJson());

class MovieListModel {
    MovieListModel({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    final int page;
    final List<MovieModel> results;
    final int totalPages;
    final int totalResults;

    factory MovieListModel.fromJson(Map<String, dynamic> json) => MovieListModel(
        page: json["page"],
        results: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class MovieModel extends MovieEntity {
    MovieModel({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.originalLanguage,
        this.originalTitle,
        this.posterPath,
        this.id,
        this.video,
        this.voteAverage,
        this.overview,
        this.releaseDate,
        this.voteCount,
        this.title,
        this.popularity,
        this.mediaType,
    });

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

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        posterPath: json["poster_path"],
        id: json["id"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
        voteCount: json["vote_count"],
        title: json["title"],
        popularity: json["popularity"].toDouble(),
        mediaType: mediaTypeValues.map[json["media_type"]],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "poster_path": posterPath,
        "id": id,
        "video": video,
        "vote_average": voteAverage,
        "overview": overview,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "vote_count": voteCount,
        "title": title,
        "popularity": popularity,
        "media_type": mediaTypeValues.reverse[mediaType],
    };
}

enum MediaType { MOVIE }

final mediaTypeValues = EnumValues({
    "movie": MediaType.MOVIE
});

enum OriginalLanguage { EN, DE, JA, ZH }

final originalLanguageValues = EnumValues({
    "de": OriginalLanguage.DE,
    "en": OriginalLanguage.EN,
    "ja": OriginalLanguage.JA,
    "zh": OriginalLanguage.ZH
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
