// ignore_for_file: public_member_api_docs, sort_constructors_first
class TVmodel {
  final String image;
  final String Title;
  final String Overview;

  final double rate;
  bool chosse;
  TVmodel(
      {required this.image,
      required this.Title,
      required this.Overview,
      required this.rate,
      required this.chosse});

  factory TVmodel.fromJson(Data) {
    return TVmodel(
        image: Data["poster_path"],
        Title: Data["name"],
        Overview: Data["overview"],
        rate: Data["vote_average"],
        chosse: false);
  }

  @override
  bool operator ==(covariant TVmodel other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.Title == Title &&
        other.Overview == Overview &&
        other.rate == rate &&
        other.chosse == chosse;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        Title.hashCode ^
        Overview.hashCode ^
        rate.hashCode ^
        chosse.hashCode;
  }
}
