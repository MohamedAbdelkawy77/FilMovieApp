import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServer {
  Future<List<dynamic>> GetPopularMovies() async {
    var respons = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=a961a1c0e0d72aca2b97335285874bcd&sort_by=popularity.desc&vote_average.gte=8&vote_average.lte=9"));
    if (respons.statusCode == 200) {
      List<dynamic> Movieslist = jsonDecode(respons.body)["results"];
      return Movieslist;
    } else {
      throw Exception("Failed to load movies: ${respons.statusCode}");
    }
  }

  Future<List<dynamic>> GetYearMovies() async {
    var respons = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=a961a1c0e0d72aca2b97335285874bcd&primary_release_year=2025&with_origin_country=US"));
    if (respons.statusCode == 200) {
      List<dynamic> Movieslist = jsonDecode(respons.body)["results"];
      print(Movieslist[0]["original_title"]);
      return Movieslist;
    } else {
      throw Exception("Failed to load movies: ${respons.statusCode}");
    }
  }

  Future<List<dynamic>> GetSearchMovies(int year) async {
    var respons = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=a961a1c0e0d72aca2b97335285874bcd&primary_release_year=$year&with_origin_country=US"));
    if (respons.statusCode == 200) {
      List<dynamic> Movieslist = jsonDecode(respons.body)["results"];
      print(Movieslist[0]["original_title"]);
      return Movieslist;
    } else {
      throw Exception("Failed to load movies: ${respons.statusCode}");
    }
  }

  Future<List<dynamic>> GetSearchMoviesByCategory(String category) async {
    // تحويل الاسم لـ genreId
    Map<String, int> genres = {
      "Action": 28,
      "Documentary": 99,
      "Sci-Fi": 878,
      "Drama": 18,
      "Comedy": 35,
    };

    int? genreId = genres[category];

    if (genreId == null) {
      throw Exception("Invalid category");
    }

    var response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=a961a1c0e0d72aca2b97335285874bcd&with_origin_country=US&with_genres=$genreId"));

    if (response.statusCode == 200) {
      List<dynamic> Movieslist = jsonDecode(response.body)["results"];
      if (Movieslist.isNotEmpty) print(Movieslist[0]["original_title"]);
      return Movieslist;
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }

  Future<List<dynamic>> GetTVShowsByNetwork(String network) async {
    // تحويل اسم الشبكة لـ networkId
    Map<String, int> networks = {
      "Netflix": 213,
      "Prime Video": 1024,
      "Hulu": 453,
      "Disney+": 2739,
      "HBO": 49,
    };

    int? networkId = networks[network];

    if (networkId == null) {
      throw Exception("Invalid network");
    }

    var response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/discover/tv?api_key=a961a1c0e0d72aca2b97335285874bcd&with_networks=$networkId"));

    if (response.statusCode == 200) {
      List<dynamic> tvShowsList = jsonDecode(response.body)["results"];
      if (tvShowsList.isNotEmpty) print(tvShowsList[0]["name"]);
      return tvShowsList;
    } else {
      throw Exception("Failed to load TV shows: ${response.statusCode}");
    }
  }
}
