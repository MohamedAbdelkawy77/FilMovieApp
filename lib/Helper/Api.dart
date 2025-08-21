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
}
