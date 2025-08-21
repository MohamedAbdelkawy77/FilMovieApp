part of 'api_movie_cubit.dart';

@immutable
sealed class ApiMovieState {}

final class ApiMovieInitial extends ApiMovieState {}

final class ApiMovieLoading extends ApiMovieState {}

final class ApiMovieSeccess extends ApiMovieState {}

final class ApiMovieFailure extends ApiMovieState {
  final String Error;

  ApiMovieFailure({required this.Error});
}
