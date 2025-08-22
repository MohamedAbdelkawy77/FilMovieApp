import 'package:bloc/bloc.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:meta/meta.dart';

part 'add_movie_state.dart';

class AddMovieCubit extends Cubit<AddMovieSuccess> {
  AddMovieCubit() : super(AddMovieSuccess(Fmovies: []));

  void AddFmovies(Moviemodel movie) {
    if (!state.Fmovies.contains(movie)) {
      final List<Moviemodel> movies = List<Moviemodel>.from(state.Fmovies)
        ..add(movie);
      emit(AddMovieSuccess(Fmovies: movies));
    }
  }

  void RemoveFmovies(Moviemodel movie) {
    if (state.Fmovies.contains(movie)) {
      final List<Moviemodel> movies = List<Moviemodel>.from(state.Fmovies)
        ..remove(movie);
      emit(AddMovieSuccess(Fmovies: movies));
    }
  }
}
