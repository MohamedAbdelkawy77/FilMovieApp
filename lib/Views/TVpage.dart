import 'package:filmovies/Constants.dart';
import 'package:filmovies/Cubites/ApiMovie/api_movie_cubit.dart';
import 'package:filmovies/CustomWidget/Svg.dart';
import 'package:filmovies/Models/TVmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvShowsPage extends StatefulWidget {
  @override
  _TvShowsPageState createState() => _TvShowsPageState();
}

class _TvShowsPageState extends State<TvShowsPage> {
  final List<String> networks = [
    "Netflix",
    "Prime Video",
    "Hulu",
    "Disney+",
    "HBO",
  ];

  // روابط الصور من الإنترنت لكل شبكة
  final Map<String, String> networkImages = {
    "Netflix":
        "https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg",
    "Prime Video":
        "https://upload.wikimedia.org/wikipedia/commons/f/f1/Prime_Video.png",
    "Hulu": "Hulu",
    "Disney+":
        "https://upload.wikimedia.org/wikipedia/commons/3/3e/Disney%2B_logo.svg",
    "HBO":
        "https://upload.wikimedia.org/wikipedia/commons/1/17/HBO_Max_Logo.svg",
  };

  late String selected;
  late Future<List<TVmodel>> futureTvShows;

  @override
  void initState() {
    super.initState();
    selected = networks.first;
    futureTvShows =
        BlocProvider.of<ApiMovieCubit>(context).getmoviebyNetwork(selected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== TITLE =====
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "TV Shows",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ===== NETWORK TABS WITH IMAGES =====
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: networks.length,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final network = networks[index];
                  final isSelected = selected == network;
                  final imageUrl = networkImages[network]!;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = network;
                        futureTvShows = BlocProvider.of<ApiMovieCubit>(context)
                            .getmoviebyNetwork(network);
                      });
                    },
                    child: AnimatedContainer(
                      height: 100,
                      width: 100,
                      duration: Duration(milliseconds: 300),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.grey[900],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                ),
                              ]
                            : [],
                      ),
                      child: buildImage(imageUrl),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // ===== TV Shows LIST =====
            Expanded(
              child: FutureBuilder<List<TVmodel>>(
                future: futureTvShows,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(color: colorlike[0]),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Something went wrong...",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  final tvShows = snapshot.data ?? [];

                  if (tvShows.isEmpty) {
                    return Center(
                      child: Text(
                        "No TV Shows found",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: tvShows.length,
                    itemBuilder: (context, index) {
                      final show = tvShows[index];

                      return Container(
                        width: 220,
                        margin: EdgeInsets.only(right: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Stack(
                            children: [
                              // Poster
                              Image.network(
                                "$uriimage${show.image}",
                                width: 220,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),

                              // Gradient + Title
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withOpacity(0.9),
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    show.Title ?? "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
