import 'package:filmovies/Cubites/AddMovie/add_movie_cubit.dart';
import 'package:filmovies/CustomWidget/Customcard2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagefavomovies extends StatelessWidget {
  const Pagefavomovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AddMovieCubit, AddMovieSuccess>(
        builder: (context, state) {
          if (state.Fmovies.isEmpty) {
            return Center(
              child: Image.asset("assets/images/emptyghost.gif"),
            );
          } else {
            return ListView.builder(
                itemCount: state.Fmovies.length,
                itemBuilder: (context, index) {
                  return Customcard2(moviemodel: state.Fmovies[index]);
                });
          }
        },
      ),
    );
  }
}
