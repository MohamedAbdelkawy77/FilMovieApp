part of 'add_movie_cubit.dart';

@immutable
sealed class AddMovieState {}


final class AddMovieSuccess extends AddMovieState {
  final List<Moviemodel> Fmovies;

  AddMovieSuccess({required this.Fmovies});
}
