class InfoWindowClass {
  final double originLatitude, originLongitude, destLatitude, destLongitude;
  final String shopName, shopDistance, imagPath;
  InfoWindowClass(
      {required this.destLongitude,
      required this.destLatitude,
      required this.originLatitude,
      required this.originLongitude,
      required this.imagPath,
      required this.shopDistance,
      required this.shopName});
}