import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:filmovies/Helper/Api.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:meta/meta.dart';

part 'api_movie_state.dart';

class ApiMovieCubit extends Cubit<ApiMovieState> {
  ApiMovieCubit() : super(ApiMovieInitial());
  Future<List<Moviemodel>> getpopulerMovies() async {
    try {
      emit(ApiMovieLoading());
      List<dynamic> Movies = await ApiServer().GetPopularMovies();
      List<Moviemodel> popMovies =
          Movies.map((json) => Moviemodel.fromJson(json)).toList();
      print(popMovies[0].Title);
      emit(ApiMovieSeccess());
      return popMovies;
    } on Exception catch (e) {
      emit(ApiMovieFailure(Error: e.toString()));
      throw Exception(e.toString());
    }
  }

  Future<List<Moviemodel>> getYearrMovies() async {
    try {
      emit(ApiMovieLoading());
      List<dynamic> Movies = await ApiServer().GetYearMovies();
      List<Moviemodel> popMovies =
          Movies.map((json) => Moviemodel.fromJson(json)).toList();
      emit(ApiMovieSeccess());
      return popMovies;
    } on Exception catch (e) {
      emit(ApiMovieFailure(Error: e.toString()));
      throw Exception(e.toString());
    }
  }
}
