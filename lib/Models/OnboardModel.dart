class OnboardModel {
  final String image;
  final String title;
  final String subtitle;

  OnboardModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final List<OnboardModel> onboardData = [
  OnboardModel(
    image: "assets/images/MilGibson.jpeg",
    title: "If You Looking For The Latest Movies",
    subtitle: "Sit and enjoy movies at home without going outside",
  ),
  OnboardModel(
    image: "assets/images/bladerunner.jpeg",
    title: "Hello Welcome To Best Movies",
    subtitle: "Explore thousands of movies updated everyday",
  ),
  OnboardModel(
    image: "assets/images/Gothamprotector.jpeg",
    title: "Only With Us Only For You",
    subtitle: "Your cinema journey starts from your device",
  ),
];
