import 'package:aislecheck/core/constants/assets_path.dart';

//class that holding the images for customers side
abstract class CustmoerImages {
  static const String onBoardingShopping =
      '${CustomerAssets.custImageBasePath}shopping.png';
  static const String onBoardingMapping =
      '${CustomerAssets.custImageBasePath}mapping.png';
  static const String onBoardingListing =
      '${CustomerAssets.custImageBasePath}listing.png';
  static const String onBoardingElipseOne =
      '${CustomerAssets.custImageBasePath}elipse_one.png';
  static const String onBoardingElipseTwo =
      '${CustomerAssets.custImageBasePath}elipse_two.png';
  static const String googleIcon =
      '${CustomerAssets.custIconsBasePath}google.png';
  static const String facebookIcon =
      '${CustomerAssets.custIconsBasePath}facebook.png';
  static const String emailIcon =
      '${CustomerAssets.custIconsBasePath}email.png';
  static const String appleIcon =
      '${CustomerAssets.custIconsBasePath}apple.png';
  static const String rightIcon =
      '${CustomerAssets.custIconsBasePath}right.png';
  static const String leftIcon = '${CustomerAssets.custIconsBasePath}left.png';
  static const String beautyImg =
      '${CustomerAssets.custImageBasePath}beauty.png';
  static const String item = '${CustomerAssets.custImageBasePath}item.png';
  static const String shop = '${CustomerAssets.custImageBasePath}shop.png';
  static const String map = '${CustomerAssets.custImageBasePath}map.png';
  static const String star = '${CustomerAssets.custImageBasePath}star.png';
  static const String promo = '${CustomerAssets.custImageBasePath}promo.png';
}

//class that hold the images path and icons path of app
abstract class AppImages {
  static const String appLogo = '${AppAssets.appImageBasePath}app_logo.png';
  static const String markerTag = '${AppAssets.appImageBasePath}map_mark.png';
}

//class that holding the images for customers side
abstract class AdminImages {
  static const String groceryAd =
      '${AdminAssests.custImageBasePath}grocery_ad.png';
  static const String shopAd = '${AdminAssests.custImageBasePath}shop_ad.png';
}
