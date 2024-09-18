import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/features/on_boarding/models/on_bording_model.dart';

mixin OnBordingBehaviour {
   final List<OnBordingModel> onBoardingWidgets = const [
    OnBordingModel(
      heading: 'Enjoy Shopping',
      subHeading:
          'Discover the joy of shopping with our intuitive app – where every find is a delight!',
      imagePath: CustmoerImages.onBoardingShopping,
    ),
    OnBordingModel(
      heading: 'Maping',
      subHeading:
          'Explore nearby shops with our integrated geolocation mapping feature, providing real-time directions',
      imagePath: CustmoerImages.onBoardingMapping,
    ),
    OnBordingModel(
      heading: 'Listing',
      subHeading:
          'Discover and explore a curated list of products and services tailored to your needs',
      imagePath: CustmoerImages.onBoardingListing,
    ),
  ];
}