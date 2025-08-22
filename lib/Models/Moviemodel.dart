// ignore_for_file: public_member_api_docs, sort_constructors_first
class Moviemodel {
  final String image;
  final String Title;
  final String Overview;
  final String Date;
  final double rate;
  bool chosse;
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

  @override
  bool operator ==(covariant Moviemodel other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.Title == Title &&
        other.Overview == Overview &&
        other.Date == Date &&
        other.rate == rate &&
        other.chosse == chosse;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        Title.hashCode ^
        Overview.hashCode ^
        Date.hashCode ^
        rate.hashCode ^
        chosse.hashCode;
  }
}
