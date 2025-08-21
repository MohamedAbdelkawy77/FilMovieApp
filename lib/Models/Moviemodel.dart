class Moviemodel {
  final String image;
  final String Title;
  final String Overview;
  final String Date;
  final double rate;
  final bool chosse;
  Moviemodel(
      {required this.image,
      required this.Title,
      required this.Overview,
      required this.Date,
      required this.rate,
      required this.chosse});

  factory Moviemodel.fromJson(Data) {
    return Moviemodel(
        image: Data["poster_path"],
        Title: Data["title"],
        Overview: Data["overview"],
        Date: Data["release_date"],
        rate: Data["vote_average"],
        chosse: false);
  }
}
