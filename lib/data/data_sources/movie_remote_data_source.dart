import 'package:http/http.dart';
import 'package:movieapp/data/models/movie_model.dart';
import '../../data/core/api_constants.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final Client client;
  MovieRemoteDataSourceImpl(this.client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await client.get(
      Uri.parse(
        '${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final movies = movieListModelFromJson(response.body).results;
      print(movies);
      return movies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
