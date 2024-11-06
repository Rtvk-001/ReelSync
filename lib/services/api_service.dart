import 'dart:convert';
import 'package:http/http.dart' as http;
import '../apikey.dart';
import '../models/movie.dart';
class ApiService {
  Future<List<Movie>> fetchLatestMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/latest?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Parse your movie data here
    } else {
      throw Exception('Failed to load movies');
    }
  }

// Add more methods for filtering by genre, date, etc.
}
