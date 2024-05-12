
class OnboardingPageModel {
  final String image;
  final String title;
  final String subTitle;

  OnboardingPageModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

final List<OnboardingPageModel> pages = [
  OnboardingPageModel(
    image: "assets/json/explore.json",
    title: 'Shop From your favorite stores',
    subTitle:
        'Discover a world of convenience and endless choices. Get ready to experience the best of online shopping right at your fingertips.',
  ),
  OnboardingPageModel(
    image: "assets/json/shopping.json",
    title: 'Get IT Delivered',
    subTitle:
        'Enjoy fast and reliable delivery straight to your doorstep. Sit back and relax while we bring your purchases to you.',
  ),
  OnboardingPageModel(
    image: "assets/json/delivery.json",
    title: 'Flexible payment',
    subTitle:
        'Choose from a variety of payment options that suit your needs. We make shopping easy and convenient for you.',
  ),
];
